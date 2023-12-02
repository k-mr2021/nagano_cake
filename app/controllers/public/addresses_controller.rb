class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.save
    # 一覧へリダイレクト
    redirect_to addresses_path
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
end

