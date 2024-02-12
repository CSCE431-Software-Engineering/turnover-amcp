Rails.application.routes.draw do
  resources :teams
  resources :feedbacks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'feedbacks#index'
end
