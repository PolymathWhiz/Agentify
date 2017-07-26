Rails.application.routes.draw do
  get 'search/index'

  root 'pages#home'
  
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  
  devise_for :businesses

  devise_scope :businesses do
    resources :businesses, only: [:show]    
  end

  # Admin portal
  devise_for :admins

  namespace :admin do
    resources :businesses, only: [:index, :update, :destroy]

    get '/home', to: 'home#index'
    get '/requests', to: 'businesses#business_request'
    get '/activated', to: 'businesses#activated_business'
    get '/admin_list', to: 'access#index'
  end

end
