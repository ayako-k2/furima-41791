
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
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| deliveryfee_id      | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipdate_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| purchase            | references | null: false, foreign_key: true |

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


## addressesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postalcode          | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| address1            | string     | null: false                    |
| address2            | string     |                                |
| tel                 | integer    | null: false                    |
| purchase            | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase






## テスト用アカウント
- Basic認証ID : admin
- Basic認証PASS : 2222
