class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order_new = Order.new
    @addresses = current_customer.addresses.all
    # current_customerとaddress_displayを関連付ける
    # @addresses.find_by(customer_id: params[:current_customer_id])
  end
  
end









