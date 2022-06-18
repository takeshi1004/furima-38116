class OrderShip
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address1, :address2, :phone_number, :order_id, :user_id, :item_id
  
  with_options presence: true do
    
  end
  def initialize
    
  end
end
