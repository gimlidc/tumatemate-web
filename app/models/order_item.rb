class OrderItem < ActiveRecord::Base
  attr_accessible :orderId, :price, :productId, :quantity
end
