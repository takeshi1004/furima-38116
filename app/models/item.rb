class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_charge
  belongs_to :prefecture
  belongs_to :take_days
  has_one_attached :image

  validates :item_name,   presence: true
  validates :content,     presence: true
  validates :total_price, presence: true
  validates :image,       presence: true

  validates :category_id, numericality: { other_than: 1, message: "カテゴリーを選んでください" } 
  validates :status_id, numericality: { other_than: 1, message: "商品の状態を選んでください"}
  validates :ship_charge_id, numericality: {other_than: 1, message: "配送料の負担を選んでください"}
  validates :prefecture_id, numericality: { other_than: 1, message: "発送元の地域を選んでください"}
  validates :take_days_id, numericality: { other_than: 1, message: "発送までの日数を選んでください"}

end
