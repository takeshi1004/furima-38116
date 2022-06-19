class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @order_ship = OrderShip.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def new
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
