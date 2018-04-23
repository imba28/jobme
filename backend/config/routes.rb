Rails.application.routes.draw do
  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#create',  via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]

  resources :users
  resources :subcategories
  resources :categories
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#index'
end
