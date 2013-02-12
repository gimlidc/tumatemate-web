class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :userId
      t.decimal :postage
      t.datetime :time

      t.timestamps
    end
  end
end
