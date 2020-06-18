# README
# fleamarket_sample_77_c データベース設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :items, dependent: :destroy
- has_one :profiles, dependent: :destroy
- has_one :send_addresses, dependent: :destroy

## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|year_birth|date|null: false|
|month_birth|date|null: false|
|day_birth|date|null: false|
|image|text||
|introduction|text||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Send_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|send_full_name|string|null: false|
|send_name_kana|string|null: false|
|post_number|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|apartment|string||
|tel_number|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|introduce|string|null: false|
|status|integer|null: false|
|shipping_fee|integer|null: false|
|sipping_area|string|null: false|
|date|date|null: false|
|price_introduce|string||
|user_id|references|null: false, foreign_key: true|
|send_address_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|bland_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null, false|
### Association
- has_many :items

## Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null, false|
### Association
- has_many :items