# frozen_string_literal: true

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

post '/users', to: 'users#create'
get '/users/:id', to: 'users#show'
post '/login', to: 'sessions#login'

# resources :users, only: %i[show create]

resources :lists
