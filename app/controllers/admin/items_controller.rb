class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
                
  def index
    @items = Item.page(params[:page])
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
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  private
  
  def itme_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price)
  end
  
end









