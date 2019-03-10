Rails.application.routes.draw do
  # Don't need to include .json at the end of the devise URLs.
  devise_for :users, skip: :all

  defaults format: :json do
    devise_scope :user do
      post 'v1/auth/sign_in', to: 'devise/sessions#create'
      delete 'v1/auth/sign_out', to: 'devise/sessions#destroy'
      patch 'v1/auth/password', to: 'devise/passwords#update'
      put 'v1/auth/password', to: 'devise/passwords#update'
      post 'v1/auth/password', to: 'devise/passwords#create'
      patch 'v1/auth/user', to: 'devise/registrations#update'
      put 'v1/auth/user', to: 'devise/registrations#update'
      delete 'v1/auth/user', to: 'devise/registrations#destroy'
      post 'v1/auth/user', to: 'devise/registrations#create'
      get 'v1/auth/unlock', to: 'devise/unlocks#show'
      post 'v1/auth/unlock', to: 'devise/unlocks#create'
    end
  end
end