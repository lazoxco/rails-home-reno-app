Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :items
  root to: "tasks#index"
  
  resources :tasks do
    resources :comments
    resources :items
  end
  
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
