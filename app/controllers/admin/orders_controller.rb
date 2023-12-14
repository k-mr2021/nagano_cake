class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    
    # 注文情報取得  
    @order_found = Order.find(params[:id])
    # 注文idと顧客idを関連付ける
    @customer = @order_found.customer
    # 注文詳細情報取得
    @order_details = @order_found.order_details
      
  end
  
end













