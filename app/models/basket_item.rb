class BasketItem < ActiveRecord::Base
  attr_accessible :price, :productId, :quantity, :sessionId
end
