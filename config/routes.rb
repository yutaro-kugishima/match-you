Rails.application.routes.draw do
  get 'rooms/show'
  mount ActionCable.server => '/cable'
  get 'chats/index'
  get 'chats/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'users#index'
  # root to: 'rooms#show'
  get 'users/search', to: 'users#search'
  resources :users do
    resources :chats
  end
end