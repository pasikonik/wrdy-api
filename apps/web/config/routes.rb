# frozen_string_literal: true

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

post '/login', to: 'sessions#login'

post '/users', to: 'users#create'
post '/lists', to: 'lists#create'
get '/lists/:id', to: 'lists#show'
get '/users/:id', to: 'users#show'

# resources :users, only: %i[show create]

# resources :lists
