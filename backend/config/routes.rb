# frozen_string_literal: true

Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post 'matchings', to: 'matching#match'
  get 'matchings', to: 'matching#match'

  # childhood Category
  get 'childhoods', to: 'childhoods#index'
  get 'nows', to: 'nows#index'

  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post 'user_token' => 'user_token#create'

  match '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]
  match '/auth/failure', to: 'sessions#failure', via: %i[get post]

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
