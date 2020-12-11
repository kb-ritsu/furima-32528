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
-has_one  :buys

## itemsテーブル
|Column    |Type      |Options                     |
|----------|----------|----------------------------|
|item_name |string    |null:false                  |
|price     |string    |null:false                  |
|category  |string    |null:false                  |
|status    |string    |null:false                  |
|fee       |boolean   |null:false                  |
|place     |integer   |null:false                  |
|seller    |references|null:false, foreign_key:true|
|detail    |text      |null:false                  |


### Association

-belongs_to :user
-has_one    :address



## addressテーブル
|Column       |Type      |Options                     |
|-------------|----------|----------------------------|
|prefecture   |string    |null:false                  |
|city         |string    |null:false                  |
|address      |string    |null:false                  |
|building     |string    |                            |
|phone_number |string    |null:false                  |

### Association

-has_many :buys


## buysテーブル
|Column       |Type      |Options                     |
|-------------|----------|----------------------------|
|buyer        |references|null:false, foreign_key:true|

### Association
-belongs_to :address
