class Product < ActiveRecord::Base
  attr_accessible :descriptionL, :descriptionS, :imgL, :imgM, :imgS, :price, :stock, :weight, :name
end
