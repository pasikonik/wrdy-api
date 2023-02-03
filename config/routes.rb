Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do

  #   end
  # end

  resources :lists
  resources :users, only: %i[create] do
    get 'me', to: "users#me", on: :collection
  end

  post "/login", to: "auth#login"
  # get "/auto_login", to: "auth#auto_login"
  # get "/user_is_authed", to: "auth#user_is_authed"
end
