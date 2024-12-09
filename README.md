
## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| lastname            | string     | null: false                    |
| firstname           | string     | null: false                    |
| lastname_kana       | string     | null: false                    |
| firstname_kana      | string     | null: false                    |
| birthday            | date       | null: false                    |


### Association
- has_many :items
- has_many :purchases 

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| deliveryfee_id      | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipdate_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postalcode          | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| tel                 | string     | null: false                    |
| purchase            | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase






## テスト用アカウント
- Basic認証ID : admin
- Basic認証PASS : 2222
