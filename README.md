## usersテーブル
|Column              |Type   |Options   |
|--------------------|-------|----------|
|nickname            |string |null:false|
|email               |string |null:false, unique: true|
|encrypted_password  |string |null:false|
|first_name          |string |null:false|
|last_name           |string |null:false|
|birthday            |date   |null:false|
|first_katakana_name |string |null:false|
|last_katakana_name  |string |null:false|

### Association

-has_many :items
-has_many  :users_items

## itemsテーブル
|Column      |Type      |Options                     |
|------------|----------|----------------------------|
|name        |string    |null:false                  |
|price       |integer   |null:false                  |
|category_id |integer   |null:false                  |
|status_id   |integer   |null:false                  |
|fee_id      |string    |null:false                  |
|place_id    |integer   |null:false                  |
|user        |references|null:false, foreign_key:true|
|detail      |text      |null:false                  |
|date        |integer   |null:false

### Association

-belongs_to :user
-has_one    :users_item



## addressテーブル
|Column       |Type      |Options                     |
|-------------|----------|----------------------------|
|prefecture_id|string    |null:false                  |
|city         |string    |null:false                  |
|address      |string    |null:false                  |
|building     |string    |                            |
|phone_number |string    |null:false                  |

### Association

-belongs_to :users_item


## users_itemsテーブル
|Column       |Type      |Options                     |
|-------------|----------|----------------------------|
|user_id      |references|null:false, foreign_key:true|
|item_id      |references|null:false, foreign_key:true|
### Association
-has_one :address
