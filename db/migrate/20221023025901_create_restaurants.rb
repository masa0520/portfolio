class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :seat, defalut: 0
      t.integer :price, defalut: 0
      t.timestamps
    end
  end
end
