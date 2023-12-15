class Public::ItemsController < ApplicationController
  
  def index
    # item件数表示するための定義
    @all_items = Item.all
    @items = Item.page(params[:page])
  end
  
  def show
    @item_found = Item.find(params[:id])
    # 詳細からカートにアイテム追加
    @cart_item = CartItem.new
  end
  
end


