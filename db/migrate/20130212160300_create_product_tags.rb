class CreateProductTags < ActiveRecord::Migration
  def change
    create_table :product_tags do |t|
      t.integer :tagId
      t.integer :productId

      t.timestamps
    end
  end
end
