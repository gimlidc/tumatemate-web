class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.binary :imgS
      t.binary :imgM
      t.binary :imgL
      t.decimal :price
      t.text :descriptionS
      t.text :descriptionL
      t.float :weight
      t.integer :stock

      t.timestamps
    end
  end
end
