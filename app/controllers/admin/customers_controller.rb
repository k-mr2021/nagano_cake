class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
               
  def index
    @customers = Customer.all.page(params[:page]).per(10)
    # `last_name`と`first_name`を組み合わせてフルネームを生成し、そのフルネームを要素とする新しい配列を作成
    @full_names = @customers.map { |customer| "#{customer.last_name} #{customer.first_name}" }
  end
  
  def show
    @customer_found = Customer.find(params[:id])
    @full_name = @customer_found.last_name + @customer_found.first_name
    @full_name_kana = @customer_found.last_name_kana + @customer_found.first_name_kana
  end
  
  def edit
    @customer_found = Customer.find(params[:id])
    @full_name = @customer_found.last_name + @customer_found.first_name
    @full_name_kana = @customer_found.last_name_kana + @customer_found.first_name_kana
  end
  
  def update
    @customer_found = Customer.find(params[:id])
    @customer_found.update(customer_params)
    # 会員詳細へリダイレクト
    redirect_to admin_customer_path(@customer_found)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_active)
  end
  
end
















