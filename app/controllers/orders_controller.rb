class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :set_OrderShip, only: [:index, :new]
  before_action :authenticate_user!

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    end

    if @item.order.present?
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_OrderShip
    @order_ship = OrderShip.new
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.total_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
