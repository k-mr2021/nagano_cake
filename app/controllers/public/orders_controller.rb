class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  # 注文情報入力
  def new
    @order_new = Order.new
    @addresses = current_customer.addresses.all
    # current_customerとaddress_displayを関連付ける
    # @addresses.find_by(customer_id: params[:current_customer_id])
  end
  
  # 注文情報確認
  def confirm
    @order = Order.new(order_params) 
    binding.pry
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)  
  end
  
end














