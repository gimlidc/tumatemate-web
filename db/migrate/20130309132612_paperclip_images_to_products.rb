class PaperclipImagesToProducts < ActiveRecord::Migration
  def up
    remove_column :products, :imgL
    remove_column :products, :imgM
    remove_column :products, :imgS
    
    add_attachment :products, :image_large
    add_attachment :products, :image_medium
    add_attachment :products, :image_small
  end

  def down    
    remove_attachment :products, :image_small
    remove_attachment :products, :image_medium
    remove_attachment :products, :image_large

    add_column :products, :imgS
    add_column :products, :imgM
    add_column :products, :imgL        
  end
end
