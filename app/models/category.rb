class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  enum is_active: { 無効: false, 有効: true }
end
