class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
  end
  
  def show
    @item_found = Item.find(params[:id])
  end
  
end

