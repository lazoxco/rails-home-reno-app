Rails.application.routes.draw do
  resources :items
  root to: "tasks#index"
  
  resources :tasks do
    resources :comments
    resources :items
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
