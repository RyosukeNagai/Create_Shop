class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders

  enum is_active: { 退会済: false, 有効: true }
  # 論理削除用の記述 acts_as_paranoidとカラムにdeleted_atを入れることによりデータは残るが削除された扱いになる
  acts_as_paranoid

end
