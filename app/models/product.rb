class Product < ActiveRecord::Base

  has_many :basket_items
  before_destroy :ensure_not_referenced_by_any_basket_item

  attr_accessible :descriptionL, :descriptionS, :price, :stock, :weight, :name, :image_large, :image_medium, :image_small
  has_attached_file :image_large, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  has_attached_file :image_medium, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_small, :styles => { :medium => "300x300>", :thumb => "100x100>" }

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
