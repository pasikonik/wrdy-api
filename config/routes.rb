Rails.application.routes.draw do
 
  # namespace :api do
  #   namespace :v1 do

  #   end
  # end

  resource :users, only: %i[create]
  resources :lists

  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
end
