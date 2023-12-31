Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # 管理者用
  # URL /admin/sign_in ...  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/admin' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    # 退会確認画面
    get '/costomers/check' => 'customers#check', as: 'check'
    # 退会処理(ステータス更新)
    patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    post '/orders/confirm' => 'orders#confirm', as: 'confirm'
    get '/orders/complete' => 'orders#complete', as: 'complete'
    # 検索窓
    # post '/search',  to: 'items#search'
    # get  '/search',  to: 'items#search'
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
    resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
    
  end
  
end































