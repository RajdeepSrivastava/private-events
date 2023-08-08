Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  
  resources :events, only: [:index, :new, :create, :show]

  patch '/events/:id', to: 'events#update'
  
  delete '/events/:id', to: 'events#destroy'
  
end
