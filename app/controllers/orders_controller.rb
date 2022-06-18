class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order_ship = OrderShip.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
