# frozen_string_literal: true

Rails.application.routes.draw do
  resources :lists do
    resources :words, only: %i[index]
  end
  resources :words, only: %i[create destroy]
  resources :users, only: %i[create] do
    get 'me', to: 'users#me', on: :collection
  end

  post '/login', to: 'auth#login'
end
