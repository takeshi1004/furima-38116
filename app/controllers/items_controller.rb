class ItemsController < ApplicationController

  def indeex
  
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :content, :category_id, :status_id, :ship_charge_id, :prefecture_id, :take_days_id, :total_price).merge(user_id: current_user.id)
  end
end
