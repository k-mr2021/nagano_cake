class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
               
  def index
    @customers = Customer.all.page(params[:page]).per(10)
    # `last_name`と`first_name`を組み合わせてフルネームを生成し、そのフルネームを要素とする新しい配列を作成
    @full_names = @customers.map { |customer| "#{customer.last_name} #{customer.first_name}" }
  end
  
  def show
    @customer_found = Customer.find(params[:id])
  end
end






