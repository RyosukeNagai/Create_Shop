class Order < ApplicationRecord
	belongs_to :user

	enum payment_method: { 銀行振込: false, クレジットカード: true }
	enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

end