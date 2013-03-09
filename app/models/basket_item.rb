class BasketItem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :cart
  
  attr_accessible :cart_id, :product_id, :product, :cart, :price, :quantity
  
end
