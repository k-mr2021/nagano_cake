class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
                
  def index
    @items = Item.page(params[:page]).per(10)
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(itme_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end
  
  def show
    @item_found = Item.find(params[:id])
  end
  
  def edit
    @item_found = Item.find(params[:id])
  end
  
  def update
    @item_found = Item.find(params[:id])
    @item_found.update(itme_params)
    redirect_to admin_item_path(@item_found.id)
  end
  
  private
  
  def itme_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price)
  end
  
end






















