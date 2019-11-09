# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.3'
gem 'hanami-model', '~> 1.3'

gem 'puma'

gem 'bcrypt'
gem 'jwt'

gem 'pg'

gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
  gem 'rubocop', require: false
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
  gem 'byebug'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end
