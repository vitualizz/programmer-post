Rails.application.routes.draw do
  get 'disconnect' => 'users#disconnect'
  resources :socials
  resources :posts
  root 'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get 'home/contact'
end
