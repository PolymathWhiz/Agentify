Rails.application.routes.draw do
  root 'pages#home'
  
  get '/contact', to: 'pages#contact'
  get '/about', to: 'pages#about'
  get '/terms', to: 'pages#terms'
  
  devise_for :businesses
end
