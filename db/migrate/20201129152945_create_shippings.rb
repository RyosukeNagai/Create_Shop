class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :user_id
      t.string :name
      t.integer :postcode
      t.string :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building

      t.timestamps
    end
  end
end
