Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 管理者用
  # URL /admin/sign_in ...  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/' => 'homes#top', as: :admin_top 
  end
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    # 退会確認画面
    get '/costomers/check' => 'customers#check', as: 'check'
    # 退会処理(ステータス更新)
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :customers, only: [:show, :edit, :update]
  end
  
end















