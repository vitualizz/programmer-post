Rails.application.routes.draw do
  get 'disconnect' => 'users#disconnect'
  resources :socials
  resources :posts
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resource :users, only: :show 
  get 'home/contact'
end
