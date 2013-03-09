class Product < ActiveRecord::Base

  has_many :basket_items
  before_destroy :ensure_not_referenced_by_any_basket_item

  attr_accessible :descriptionL, :descriptionS, :imgL, :imgM, :imgS, :price, :stock, :weight, :name

  private
  # ensure that there are no basket items referencing this product
  def ensure_not_referenced_by_any_basket_item
    if basket_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
