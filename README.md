# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| fullname_first | string | null: false |
| fullname_last  | string | null: false |
| kananame_first | string | null: false |
| kananame_last  | string | null: false |
| birth          | date   | null: false |



### Association

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| Column  | Type       | Options                        |
| ------  | -----------| ------------------------------ |
| user    | references | null: false, foreign_key: true |
| name    | string     | null: false                    |
| detail  | text       | null: false                    |
| category| integer    | null: false                    |
| state   | integer    | null: false                    |
| fee     | integer    | null: false                    |
| province| integer    | null: false                    |
| days    | integer    | null: false                    |
| price   | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| text   | text       | null: false                    |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| purchase   | references | null: false, foreign_key: true |
| postnum    | string     | null: false,                   |
| prefecture | integer    | null: false,                   |
| city       | string     | null: false,                   |
| address    | string     | null: false,                   |
| building   | string     |                                |
| tel        | string     | null: false,                   |

### Association

- belongs_to :purchase

