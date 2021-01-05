Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'users#index'
  get 'users/search', to: 'users#search'
  resources :users do
    resources :messages, only: [:create]
  end
end