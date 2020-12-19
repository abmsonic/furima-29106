# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_date      | integer | null: false |

### Association

- has_many :items
- has_many :customers

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| image               | string     | null: false                    |
| name                | string     | null: false                    |
| info                | string     | null: false                    |
| category            | string     | null: false                    |
| item_status         | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :customer

## customers テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| card_number   | integer     | null: false                    |
| exp_month     | integer     | null: false                    |
| exp_year      | integer     | null: false                    |
| cvc           | integer     | null: false                    |
| postal_code   | integer     | null: false                    |
| prefecture    | string      | null: false                    |
| city          | string      | null: false                    |
| building      | string      |                                |
| phone_number  | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |
| item          | references  | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user