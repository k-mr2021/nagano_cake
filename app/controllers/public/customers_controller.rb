class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  # 会員の詳細
  def show
    @customer = Customer.find(current_customer.id)
    # 会員の詳細ページで苗字と名前を連結して表示するために変数を定義
    @full_name = @customer.last_name + @customer.first_name
    @full_name_kana = @customer.last_name_kana + @customer.first_name_kana
  end
  
  # 会員の編集
  def edit
    @customer = current_customer
  end

  # 会員の更新
  def update
    @customer = current_customer
    @customer.update(customer_params)
    # 会員の詳細ページへリダイレクト
    redirect_to customer_path(current_customer)
  end
  
  def check
    
  end
  
  # 退会機能
  def withdrawal
    @customer = current_customer
    # is_activeカラムをfalseに変更し退会できるようにする
    @customer.update(is_active: false)
    # ログアウトさせる
    reset_session
    flash[:notice] = "退会が完了しました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
  
end



















