class OrdersController < ApplicationController
  def index
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
      render :new
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone_number).merge(user_id: current_user.id, order_id: order.id)
  end
end
