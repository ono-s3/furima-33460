# テーブル設計

## usersテーブル

| Colum         | Type    | Option        |
| ------------- | ------- | ------------- |
| nickname      | string  | null: false   |
| email         | string  | null: false   |
| password      | string  | null: false   |
| last_name     | string  | null: false   |
| first_name    | string  | nill: false   |
| birth_year    | date    | null: false   |
| birth_month   | date    | null: false   |
| birth_day     | date    | null: false   |

### Association
- has_many :items
- has_many :comments
- has_one :buy


## itemsテーブル

| Colum                    | Type       | Option                         |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | text       | null: false                    |
| item_info                | text       | null: false                    |
| item_category            | integer    | null: false                    |
| item_sales_status        | integer    | null: false                    |
| item_shipping_fee_status | integer    | null: false                    |
| item_prefecture          | integer    | null: false                    |
| item_scheduled_delivery  | integer    | null: false                    |
| item_price               | integer    | null: false                    |
| add_tax_price            | integer    | null: false                    |
| profit                   | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

## Association
- has_many :comments
- belongs_to :users


# commentsテーブル

| Colum | Type       | Option                         |
| ----- | ---------- | ------------------------------ |
| text  | text       | null: false                    |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

## Association
- belongs_to :users
- belongs_to :items


# buyテーブル

| Colum          | Type      | Option        |
| -------------- | --------- | ------------- |
| card_number    | integer   | null: false   |
| card_exp_month | integer   | null: false   |
| card_exp_year  | integer   | null: false   |
| card_cvc       | integer   | null: false   |

## Association
- has_one :shipping-address
- belongs_to :users



# shipping-address

| Colum        | Type     | Option      |
| ------------ | -------- | ----------- |
| postal-code  | integer  | null: false |
| prefecture   | integer  | null: false |
| city         | string   | null: false |
| addresses    | string   | null: false |
| building     | string   | 
| phone-number | integer  | null: false |

## Association
- belongs_to :buy