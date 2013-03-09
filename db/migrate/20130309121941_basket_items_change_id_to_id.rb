class BasketItemsChangeIdToId < ActiveRecord::Migration
  def up
    rename_column :basket_items, :productId, :product_id
    rename_column :basket_items, :cartId, :cart_id
  end

  def down
    rename_column :basket_items, :product_id, :productId
    rename_column :basket_items, :cart_id, :cartId
  end
end
