# テーブル設計

## usersテーブル

| Colum              | Type    | Option         |
| ------------------ | ------- | -------------- |
| nickname           | string  | null: false    |
| email              | string  | null: false, unique: true   |
| encrypted_password | string  | null: false    |
| last_name          | string  | null: false    |
| first_name         | string  | nill: false    |
| last_name_kana     | string  | null: false    |
| first_name_kana    | string  | nill: false    |
| birthday           | date    | null: false    |


### Association
- has_many :items
- has_many :buys


## itemsテーブル

| Colum                  | Type       | Option                         |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string       | null: false                    |
| info                   | text       | null: false                    |
| category_id            | integer    | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :buy




# buysテーブル

| Colum          | Type      | Option        |
| -------------- | --------- | ------------- |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |


## Association
- has_one :shipping_address
- belongs_to :user
- belongs_to :item



# shipping_addresses

| Colum         | Type     | Option      |
| ------------- | -------- | ----------- |
| postal_code   | string   | null: false |
| prefecture_id | integer  | null: false |
| city          | string   | null: false |
| addresses     | string   | null: false |
| building      | string   | 
| phone_number  | string   | null: false |
| buy           | references | null: false, foreign_key: true |

## Association
- belongs_to :buy