class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, except: [:top]
  
  def top
    @orders = Order.all.page(params[:page]).per(10)
    # 注文個数を表示するため
    @total_amount = 0
    # `last_name`と`first_name`を組み合わせてフルネームを生成し、そのフルネームを要素とする新しい配列を作成
    # @full_names = @orders.map { |customer| "#{customer.last_name} #{customer.first_name}" }
  end
  
end





