# README
![image](https://user-images.githubusercontent.com/64464083/101259724-ee113480-376d-11eb-9763-a9c8fef54547.png)
# このアプリについて
 - お気に入りの本紹介サイト
 - フォロー機能
 - 検索機能
 - PV数取得
 - Hamlの導入
 - 使用Gem

# Gem/ver
* Ruby:2.5.7

* Rails:'~> 5.2.4', '>= 5.2.4.4'

* System dependencies
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

## bookテーブル
|Column|Type|
|------|----|
|title|string|
|body|text|
|user_id|integer|

### Association
 -belongs_to: user<br>
 -has_many :reviews, dependent: :destroy

## relationshipテーブル
|Column|Type|
|------|----|
|follower_id|integer|
|followed_id|integer|

### Association
 -belongs_to :follower, class_name: "User"
 -belongs_to :followed, class_name: "User"

## impressionsテーブル
|Column|Type|
|------|----|
|impressionable_type|string|
|impressionable_id|integer|
|user_id|integer|
|controller_name|string|
|action_name|string|
|view_name|string|
|request_hash|string|
|ip_address|string|
|session_hash|string|
|message|t.text|
|referrer|t.text|
|params|t.text|



