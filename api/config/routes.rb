Rails.application.routes.draw do
  root 'groups#index'

  resources :invitecodes
  resources :groups
  resources :tasks

  resources :groups do
    resources :users
    resources :tasks
  end
  resources :users do
    resources :groups
    resources :tasks
  end

  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  get  '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end