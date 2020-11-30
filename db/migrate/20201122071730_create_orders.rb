class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :postcode
      t.string :prefecture_code
      t.string :address_city
      t.string :address_street
      t.string :address_building
      t.string :name
      t.integer :postage
      t.integer :total_price
      t.boolean :payment_method
      t.integer :order_status
      t.timestamps
    end
  end
end
