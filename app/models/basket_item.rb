class BasketItem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :cart
  
  attr_accessible :cart_id, :product_id, :product, :cart, :price, :quantity
  
  def total_price
    quantity * price
  end
  
  def total_weight
    if product.weight.nil?
      0
    else
      quantity * product.weight
    end
  end
  
  def remove_one
    quantity -= 1
  end
  
  def add_one
    quantity -= 1
  end
  
end
