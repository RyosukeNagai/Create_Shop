class Product < ApplicationRecord
  has_many :users, through: :cart_items, source: :users
  has_many :cart_items, dependent: :destroy
  belongs_to :category
  attachment :image

  enum is_active: { 販売停止中: false, 販売中: true }
end

