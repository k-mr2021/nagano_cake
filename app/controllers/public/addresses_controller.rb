class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    # 一覧へリダイレクト
    redirect_to addresses_path
  end
  
  def edit
    
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







