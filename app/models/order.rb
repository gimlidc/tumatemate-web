class Order < ActiveRecord::Base
  attr_accessible :postage, :time, :userId
end
