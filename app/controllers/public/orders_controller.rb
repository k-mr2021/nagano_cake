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
    # binding.pry
    # 商品合計金額を0と定義
    @total = 0
    # 自分の住所
    if params[:order][:select_address] == "current_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    # 登録済み住所
    elsif params[:order][:select_address] == "registered_address"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    # 新しいお届け先
    elsif params[:order][:select_address] == "new_address"
      @order.customer_id = current_customer.id
    else
      render 'new'
    end
    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end
  
  # 注文情報保存
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    # order_detailsを保存
    # カート内商品の情報を注文履歴に移動
    current_customer.cart_items.each do |cart_item|
      # 初期化
      @order_details = OrderDetail.new
      # 商品idを注文履歴商品idに代入
      @order_details.item_id = cart_item.item_id
      #商品の個数を注文履歴商品の個数に代入
      @order_details.amount = cart_item.amount
      # 税込み価格算出
      @order_details.price = cart_item.item.with_tax_price
      # 注履歴文商品に注文idを紐付け
      @order_details.order_id = @order.id
      # 注文履歴商品を保存
      @order_details.save!
    end
    # カートの中身削除
    CartItem.destroy_all
    # 注文完了画面へリダイレクト
    redirect_to complete_path
  end
  
  def complete
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order_found = Order.find(params[:id])
    @order_details = @order_found.order_details.all
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :select_address, :customer_id, :postal_code, :address, :name, :billing_amount, :postage )  
  end
  
end
































































