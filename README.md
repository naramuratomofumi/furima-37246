# README

## users テーブル

| column             | type       | options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false, uniqueness: true |
| encrypted_password | string     | null: false                   |
| last_name          | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| first_name         | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| date_of_birth      | date       | null: false                   |

### Association
- has_many :items
- has_many :orders

## items テーブル

| column            | type       | options                       |
| ----------------- | ---------- | ----------------------------- |
| item_name         | string     | null: false                   |
| item_text         | text       | null: false, uniqueness: true |
| category_id       | integer    | null: false                   |
| sales_status_id   | integer    | null: false                   |
| shipping_cost_id  | integer    | null: false                   |
| shipping_area_id  | integer    | null: false                   |
| day_to_ship_id    | integer    | null: false                   |
| price             | integer    | null: false                   |
| user              | references | null: false, foreign_key:true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| column            | type       | options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| column            | type       | options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefectures_id    | integer    | null: false                    |
| municipalities    | string     | null: false                    |
| address           | string     | null: false                    |
| building_num      | string     |                                |
| telephone_num     | string     | null: false                    |
| order             | references | null: false, foreign_key: true |

### Association
- belongs_to :order