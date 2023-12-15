class Public::HomesController < ApplicationController
  
  def top
    # 新着順にitemを表示
    @items = Item.all.order(created_at: :desc)
  end
  
  def about
    
  end
  
end

