# README

## users テーブル

| column             | type       | options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name         | string     | null: false               |
| first_name_kana    | string     | null: false               |
| date_of_birth      | date       | null: false               |

### Association
- has_many :items
- has_many :orders
- has_one :address

## items テーブル

| column            | type       | options                   |
| ----------------- | ---------- | ------------------------- |
| item_name         | string     | null: false               |
| item_text         | text       | null: false, unique: true |
| category          | string     | null: false               |
| sales_status      | string     | null: false               |
| shipping_cost     | boolean    | null: false               |
| shipping_area     | string     | null: false               |
| day_to_ship       | string     | null: false               |
| price             | integer    | null: false               |
| user_id           | references | null: false               |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| column            | type       | options                   |
| ----------------- | ---------- | ------------------------- |
| user_id           | references | null: false               |
| item_id           | references | null: false               |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| column            | type       | options                   |
| ----------------- | ---------- | ------------------------- |
| post_code         | integer    | null: false               |
| prefectures       | string     | null: false               |
| municipalities    | string     | null: false               |
| address           | string     | null: false               |
| building_num      | string     |                           |
| telephone_num     | integer    | null: false               |
| user_id           | references | null: false               |
| order_id          | references | null: false               |

### Association
- belongs_to :user
- belongs_to :order