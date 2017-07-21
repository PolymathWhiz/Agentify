Rails.application.routes.draw do
  get 'search/index'

  root 'pages#home'
  
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  
  devise_for :businesses

  devise_scope :businesses do
    resources :businesses, only: [:show, :update]
  end

  # Admin section
  namespace :admin do
    root 'home#index'
    resources :businesses, only: [:index, :destroy]
  end
end
