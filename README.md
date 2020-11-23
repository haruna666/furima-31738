# Users テーブル

| Colum          | Type   | Options     |
| nickname       | string | null: false |
| email          | string | null: false |
| last_name      | string | null: false |
| first_name     | string | nill: false |
| furigana_last  | string | nill: false |
| furigana_first | string | nill: false |
| date_of_birth  | date   | nill: false |

# Association
-has_many :items
-has_many :cashers

#　Items テーブル
| Colum          | Type       | Options          |
| name           | string     | nill: false      |
| price          | integer    | nill: false      |
| fee            | integer    | ---------------- |
| return         | integer    | ---------------- |
| detail         | text       | nill: false      |
| quality        | integer    | nill: false      |
| origin_shipment| integer    | nill: false      |
| shipping_day   | integer    | nill: false      | 
| user           | references | foreign_key: true|

# Association

-belongs_to :user
-has_one :cashier

# Cashiers テーブル

| Colum      | Type       | Option            |
| user       | references | foreign_key: true |
| item       | references |                   |

# Association

-belongs_to :user
-belongs_to :item
-has_one :addresses

# addresses テーブル

| Colum         | Type       | Option            |
| zip_code      | string     | nill: false       |
| prefectures   | integer    | nill: false       |
| municipality  | string     | nill: false       |
| address       | string     | null: false       |
| building_name | string     | ----------------- | 
| tel           | string     | nill: false       |
| cashier       | references | foreign_key: true |

# Association

-belongs_to :cashier
