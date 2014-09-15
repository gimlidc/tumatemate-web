class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.string :sessionId
      t.integer :productId
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
