# README
![image](https://user-images.githubusercontent.com/64464083/101259724-ee113480-376d-11eb-9763-a9c8fef54547.png)
# このアプリについて
 - 自身のブランド商品を出品できるECサイト
 - 検索機能
 - Cart機能
 - Hamlの導入
 - admin(管理者page)作成

# Gem/ver
* Ruby:2.5.7

* Rails:'~> 5.2.4', '>= 5.2.4.4'

* System dependencies
 - 使用Gem
 - gem 'devise'
 - gem 'haml_rails'
 - gem 'font-awesome-sass'
 - gem 'bootstrap-sass', '~> 3.3.6'
 - gem 'refile'
 - gem 'refile-mini_magick'
 - gem 'jquery-rails'
 - gem 'kaminari','~> 1.2.1'
 - gem 'gretel'
 - gem 'paranoia'

## usersテーブル
|Column|Type|
|------|----|
|name|string|
|email|string|
|password|string|
|first_name|string|
|last_name|string|
|postcode|integer|
|prefecture_code|string|
|address_city|string|
|address_street|string|
|address_building|string|
|phone_number|string|
|deleted_at|datetime|
|is_active|boolean|

### Association
 -has_many: products, through: :cart_items, source: :product<br>
 -has_many :orders, dependent: :destroy
 -has_many :orders, dependent: :destroy
 -has_many :cart_items, dependent: :destroy
 -has_many :shippings, dependent: :destroy
 -enum is_active: { 退会済: false, 有効: true }

## adminテーブル
|Column|Type|
|------|----|
|email|string|
|password|string|

### Association

## cart_itemテーブル
|Column|Type|
|------|----|
|user_id|integer|
|product_id|integer|
|count|integer|

### Association
 -belongs_to :user
 -belongs_to :product

## categoryテーブル
|Column|Type|
|------|----|
|name|string|
|is_active|boolean|
|user_id|integer|

### Association
 -has_many :products, dependent: :destroy
 -enum is_active: { 無効: false, 有効: true }

## orderテーブル
|Column|Type|
|------|----|
|user_id|integer|
|postcode|integer|
|prefecture_code|string|
|address_city|string|
|address_street|string|
|address_building|string|
|postage|integer|
|total_price|integer|
|payment_method|boolean|
|order_status|integer|
### Association
 -belongs_to :user
 -has_many :order_details, dependent: :destroy
 -enum payment_method: { 銀行振込: false, クレジットカード: true }
 -enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

## order_detailテーブル
|Column|Type|
|------|----|
|product_id|integer|
|order_id|integer|
|count|integer|
|price|integer|
|work_status|integer|

### Association
 -belongs_to :product
 -belongs_to :order
 -enum work_status: { 着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }

## shippingテーブル
|Column|Type|
|------|----|
|user_id|integer|
|name|string|
|postcode|integer|
|prefecture_code|string|
|address_city|string|
|address_street|string|
|address_building|string|

### Association
 -belongs_to :user

