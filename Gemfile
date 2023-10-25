source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'pg', '~> 1.4'
gem 'puma', '~> 6.0'
gem 'rails', '~> 7.1.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'bcrypt', '~> 3.1.18'
gem 'jwt'
gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end
