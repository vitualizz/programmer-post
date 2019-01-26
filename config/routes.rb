Rails.application.routes.draw do
  root 'home#index'
  get 'disconnect' => 'users#disconnect'
  resources :socials
  resources :posts
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resource :users, only: :show 
  get 'home/contact'
end
