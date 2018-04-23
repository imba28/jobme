Rails.application.routes.draw do
  resources :users
  resources :subcategories
  resources :categories
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
