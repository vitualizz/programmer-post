Rails.application.routes.draw do
  resources :socials
  resources :posts
  root 'home#index'
  devise_for :users
  get 'home/contact'
end
