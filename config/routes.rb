Rails.application.routes.draw do
  
  mount API => '/api'

  resources :events, only: [:index, :show]
  
  root 'events#index'
end
