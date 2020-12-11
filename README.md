## usersテーブル
|Column    |Type   |Options   |
|----------|-------|----------|
|nickname  |string |null:false|
|email     |string |null:false|
|password  |string |null:false|
|first_name|string |null:false|
|last_name |string |null:false|
|birthday  |integer|null:false|

### Association

-has_many :items
-has_one  :addresses

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
|address      |integer   |null:false                  |
|building     |string    |null:false                  |
|phone_number |integer   |null:false                  |

### Association

-belongs_to :user
-belongs_to :item