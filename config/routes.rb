Rails.application.routes.draw do
  
  mount API => '/'

  resources :events, only: [:index, :show]
  
  root 'events#index'
end
