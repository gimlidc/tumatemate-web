class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :zipCode
      t.string :country
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
