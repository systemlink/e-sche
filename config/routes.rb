Rails.application.routes.draw do
  
  mount API => '/api'

  resources :events, only: [:index]
  
  root 'events#index'
end
