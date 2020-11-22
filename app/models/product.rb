class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  attachment :image

  enum is_active: { 販売停止中: false, 販売中: true }
end
