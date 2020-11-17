# frozen_string_literal: true

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

post '/login', to: 'sessions#login'

# post '/users', to: 'users#create'
# get '/users/:id', to: 'users#show'

resources :lists, only: %i[create show index]
resources :users, only: %i[create show]


