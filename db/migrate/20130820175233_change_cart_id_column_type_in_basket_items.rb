class ChangeCartIdColumnTypeInBasketItems < ActiveRecord::Migration
  def change
    change_column :basket_items, :cart_id, :integer
  end
end
