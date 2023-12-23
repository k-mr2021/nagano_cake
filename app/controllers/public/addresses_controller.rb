class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    @address = Address.new(address_params)
    # Customer must existエラー/current_customer.idを指定し顧客と関連付ける
    @address.customer_id = current_customer.id
    if @address.save
      # 一覧へリダイレクト
      redirect_to addresses_path
    else
      rendr :index
    end
  end
  
  def edit
    @address_found = Address.find(params[:id])
  end
  
  def update
    @address_found = Address.find(params[:id])
    @address_found.update(address_params)
    # 一覧へリダイレクト
    redirect_to addresses_path
  end

  def destroy
    address_found = Address.find(params[:id])
    address_found.destroy
    # 一覧へリダイレクト
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end











