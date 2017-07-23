Rails.application.routes.draw do
  get 'search/index'

  root 'pages#home'
  
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  
  devise_for :businesses

  # Admin part 
  devise_for :admins

  namespace :admin do
    resources :businesses, only: [:index, :update, :destroy]
  end
  
end
