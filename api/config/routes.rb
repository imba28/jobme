Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end