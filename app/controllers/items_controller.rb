class ItemsController < ApplicationController

  def indeex
  
  end
  
  def new
    @item = Item.new
  end
end
