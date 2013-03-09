# encoding: UTF-8
module ApplicationHelper
  
  def number_to_price(number)
    return "#{number_with_precision(number, :precision => 0)}Kč";
  end
  
end
