Rails.application.routes.draw do
    #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
    #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  
  
  
  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, only: [:index, :new, :show, :edit, :create, :update]
  end
  
  root to: "public/homes#top"
  get '/about', to: 'public/homes#about'
  
  namespace :public do
    
    resources :deliveries, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :check, :complete, :create]
    resources :cart_items, only: [:index, :update, :destroy, :create, :destroy_all]
    resources :customers, only: [:show, :edit, :quit, :update, :out, :create]
    resources :items, only: [:index, :show]
  end
  
 

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
