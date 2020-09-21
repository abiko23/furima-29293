class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  has_one_attached :image

  validates :name, :detail, :category_id, :state_id, :fee_id, :province_id, :days_id,  :price, :image, presence: true

  validates :category_id, :state_id, :fee_id, :days_id, numericality: { other_than: 1, base: 'カテゴリを選択してください' }
  validates :province_id, numericality: {other_than: 0, base: '都道府県を選択してください'}
  validates :price, numericality: {greater_than_or_equal_to: 300, message: '価格は300円以上9,999,999円以下で入力してください'}
  validates :price, numericality: {less_than_or_equal_to: 9_999_999, message: '価格は300円以上9,999,999円以下で入力してください'}
end
