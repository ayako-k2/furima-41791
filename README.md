
## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false, uniqie: true      |
| email               | string     | null: false, uniqie: true      |
| password            | string     | null: false                    |
| encrypted_password  | string     | null: false                    |
| lastname            | string     | null: false                    |
| firstname           | string     | null: false                    |
| lastname(kana)      | string     | null: false                    |
| firstname(kana)     | string     | null: false                    |
| birthday            | date       | null: false                    |


### Association
- has_many :items
- has_one  :purchase

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category            | integer    | null: false                    |
| condition           | integer    | null: false                    |
| deliveryfee         | integer    | null: false                    |
| shipfrom            | integer    | null: false                    |
| shipdate            | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | reference  | null: false, foreign_key: true |
| purchase_id         | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## purchasesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postalcode          | string     | null: false                    |
| prefecture          | integer    | null: false                    |
| city                | string     | null: false                    |
| address1            | string     | null: false                    |
| address2            | string     | null: false                    |
| tel                 | integer    | null: false                    |
| user_id             | reference  | null: false, foreign_key: true |
| item_id             | reference  | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| comment             | text       | null: false                    |


### Association
- belongs_to :item



## テスト用アカウント
- Basic認証ID : admin
- Basic認証PASS : 2222
