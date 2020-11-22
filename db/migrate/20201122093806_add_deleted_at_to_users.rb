class AddDeletedAtToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :deleted_at, :datetime
  	add_column :users, :is_active, :boolean
  end
end
