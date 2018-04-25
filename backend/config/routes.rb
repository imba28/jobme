Rails.application.routes.draw do
  post 'matchings', to: 'matching#match'
  get 'matchings', to: 'matching#match'

  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  match '/auth/:provider/callback', to: 'sessions#create',  via: [:get, :post]
  match '/auth/failure', to: 'sessions#failure', via: [:get, :post]
 
  resources :users do
    resources :jobs
  end
  resources :subcategories
  resources :categories do
    resources :subcategories
  end
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#index'
end
