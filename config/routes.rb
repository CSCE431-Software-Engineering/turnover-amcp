# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :members, controllers: { omniauth_callbacks: 'members/omniauth_callbacks' }
  devise_scope :member do
    get 'members/sign_in', to: 'members/sessions#new', as: :new_member_session
    get 'members/sign_out', to: 'members/sessions#destroy', as: :destroy_member_session
  end

  # resources :admins do
  #   get 'profile', on: :collection, as: 'profile' # Changes the path to /admins/profile
  #   get 'profiles', on: :collection, as: 'profiles' # Changes the path to /admins/profiles
  # end
  resources :members
  resources :teams
  resources :activities do
    member do
      post 'sign_up'
      get 'participants'
      delete 'remove_participant/:participant_id', to: 'activities#remove_participant', as: 'remove_participant'
    end
  end
  resources :feedbacks
  resources :home
  get 'calendar', to: 'calendar#calendar', as: 'calendar'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
end
