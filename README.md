# Users テーブル

| Colum     | Type   | Options     |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |

# Association
-has_many :Items
-has_many :Cashers

#　Items テーブル
| Colum       | Type    | Options     |
| items_name  | string  | nill: false |
| image       | --------| ----------- |
| price       | string  | nill: false |
| fee         | string  | ----------- |
| return      | string  | ----------- |
| item_detail | string  | nill: false |
| quality     | string  | nill: false |
| nickname    | string  | nill: false |

# Association

-belongs_to :User
-has_many :comments
-has_many :Items_chashires

# Comments テーブル

| Colum      | Type    | Option       |
| comment    | string  | ------------ |

# Association

-belongs_to :item
-belongs_to :cashiers_table

# Cashiers テーブル

| Colum      | Type       | Option       |
| items_name | string     | nill: false  |
| image      | ---------- | ------------ |
| price      | string     | nill: false  |
| item_detail| string     | nill: false  |
| shipment   | string     | nill: false  |

# Association

-belongs_to :Users
-has_many :Items
-has_one :Cashier_show

# Cashier_ show テーブル

| Colum         | Type   | Option        |
| credit_card   | string | nill :false   |
| zip_code      | string | nill :false   |
| prefectures   | string | nill :false   |
| municipality  | string | nill :false   |
| address       | string | null :false   |
| building_name | string | ------------- | 
| tel           | string | nill :false   |

# Association

-belongs_to :Csshier
