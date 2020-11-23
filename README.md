# Users テーブル

| Colum              | Type   | Options     |
| nickname           | string | null: false |
| encrypted_password | string | nill: false |
| email              | string | null: false |
| last_name          | string | null: false |
| first_name         | string | nill: false |
| furigana_last      | string | nill: false |
| furigana_first     | string | nill: false |
| date_of_birth      | date   | nill: false |

# Association
-has_many :items
-has_many :cashers

#　Items テーブル
| Colum              | Type       | Options          |
| name               | string     | nill: false      |
| price              | integer    | nill: false      |
| detail             | text       | nill: false      |
| quality_id         | integer    | nill: false      |
| origin_shipment_id | integer    | nill: false      |
| shipping_day_id    | integer    | nill: false      | 
| shipment_burden_id | integer    | nill: false      |
| user               | references | foreign_key: true|

# Association

-belongs_to :user
-has_one :cashier

# Cashiers テーブル

| Colum      | Type       | Option            |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

# Association

-belongs_to :user
-belongs_to :item
-has_one :address

# addresses テーブル

| Colum          | Type       | Option            |
| zip_code       | string     | nill: false       |
| prefecture_id | integer    | nill: false       |
| municipality   | string     | nill: false       |
| address        | string     | null: false       |
| building_name  | string     | ----------------- | 
| tel            | string     | nill: false       |
| cashier        | references | foreign_key: true |

# Association

-belongs_to :cashier
