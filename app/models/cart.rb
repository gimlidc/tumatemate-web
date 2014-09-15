class Cart < ActiveRecord::Base
    
  has_many :basket_items, dependent: :destroy
  
  # puts product into cart
  def add_product(product_id)
    current_item = basket_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = basket_items.build(:product_id => product_id)
      current_item.quantity = 1
      current_item.price = Product.find(product_id).price
    end
    current_item
  end
  
  def total_price
    basket_items.to_a.sum {
      |item| item.total_price
    }    
  end
  
  def total_weight
    basket_items.to_a.sum {
      |item| item.total_weight
    }
  end
  
end
