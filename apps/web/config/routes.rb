# frozen_string_literal: true

# Configure your routes here
# See: https://guides.hanamirb.org/routing/overview
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

post '/register', to: 'users#register'
post '/login', to: 'sessions#login'
get '/me', to: 'sessions#me'
