class BasketItem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :cart
  
  attr_accessible :price, :productId, :quantity, :cartId
end
