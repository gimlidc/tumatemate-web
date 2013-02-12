class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :orderId
      t.integer :productId
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
