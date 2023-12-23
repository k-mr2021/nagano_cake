class Public::ItemsController < ApplicationController
  
  def index
    # item件数表示するための定義
    @all_items = Item.all
    @items = Item.all.page(params[:page]).per(8)

  end
  
  def show
    @item_found = Item.find(params[:id])
    # 詳細からカートにアイテム追加
    @cart_item = CartItem.new
  end
  
  # 検索窓
  # def search
    #Viewのformで取得したパラメータをモデルに渡す
    # @keyword = params[:item][:search] if params[:item]
    # @all_items = Item.search(@keyword)
  # end
  
end












