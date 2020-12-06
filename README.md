# Users テーブル

| Colum              | Type   | Options     |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| furigana_last      | string | null: false |
| furigana_first     | string | null: false |
| date_of_birth      | date   | null: false |

# Association
-has_many :items
-has_many :order

# Items テーブル
| Colum              | Type       | Options          |
| name               | string     | null: false      |
| price              | integer    | null: false      |
| detail             | text       | null: false      |
| category_id        | integer    | null: false      |
| quality_id         | integer    | null: false      |
| prefecture_id      | integer    | null: false      |
| shipped_date_id    | integer    | null: false      |
| shipment_burden_id | integer    | null: false      |
| user               | references | foreign_key: true|

# Association

-belongs_to :user
-has_one :order

# Orders テーブル

| Colum      | Type       | Option            |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |

# Association

-belongs_to :user
-belongs_to :item
-has_one :address

# addresses テーブル

| Colum          | Type       | Option            |
| postal_code    | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| city           | string     | null: false       |
| address        | string     | null: false       |
| building       | string     | ----------------- | 
| phone_number   | string     | null: false       |
| cashier        | references | foreign_key: true |

# Association

-belongs_to :order
