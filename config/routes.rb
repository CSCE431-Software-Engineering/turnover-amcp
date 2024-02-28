Rails.application.routes.draw do
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  resources :admins do
    get 'profile', on: :collection, as: 'profile' # Changes the path to /admins/profile
    get 'profiles', on: :collection, as: 'profiles' # Changes the path to /admins/profiles
  end
  resources :teams
  resources :activities
  resources :feedbacks
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
