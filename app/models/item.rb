class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :take_days
  has_one_attached :image

  validates :image,       presence: true
  validates :item_name,   presence: true
  validates :content,     presence: true
  validates :category_id, numericality: { other_than: 1, message: "を選んでください" } 
  validates :status_id, numericality: { other_than: 1, message: "を選んでください"}
  validates :ship_charge_id, numericality: {other_than: 1, message: "を選んでください"}
  validates :prefecture_id, numericality: { other_than: 1, message: "を選んでください"}
  validates :take_days_id, numericality: { other_than: 1, message: "を選んでください"}

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :total_price, format: {with: VALID_PRICE_REGEX}, allow_blank: true
  validates :total_price, presence: true
  validates :total_price, numericality: {only_integer: true}, allow_blank: true
  validates :total_price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, allow_blank: true

  validates :user, presence: { message: "が存在しません"}
end
