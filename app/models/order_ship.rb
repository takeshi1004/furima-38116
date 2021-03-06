class OrderShip
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address1, :address2, :phone_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :token
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1, message: "を選んでください" }
    validates :city
    validates :address1
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にハイフン(-)を含めてください" }, allow_blank: true
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, messages: "が正しくありません" }, allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Ship.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, phone_number: phone_number, order_id: order.id)
  end
end
