class User < ActiveRecord::Base
  attr_accessible :city, :country, :email, :name, :phone, :street, :surname, :zipCode
end
