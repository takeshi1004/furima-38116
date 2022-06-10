# テーブル設計

## usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birthday        |  date  | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | text       | null: false                    |
| item_name      | string     | null: false                    |
| text           | string     | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| is_ship_charge | integer    | null: false                    |
| bill_address   | string     | null: false                    |
| take_days      | integer    | null: false                    |
| total_price    | integer    | null: false                    |
| pay_charge     | integer    | null: false                    |
| proceeds       | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user


## ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| ship_id | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: ship


## shipsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| ship_prefecture | string     | null: false                    |
| ship_city       | string     | null: false                    |
| ship_address1   | string     | null: false                    |
| ship_address2   | string     |                                |
| phone_number    | string     | null: false                    |
| order_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :order
