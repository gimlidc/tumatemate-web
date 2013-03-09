class RenameSessionIdToCartId < ActiveRecord::Migration
  def up
    rename_column :basket_items, :sessionId, :cartId
  end

  def down
    rename_column :basket_items, :cartId, :sessionId
  end
end
