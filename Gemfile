source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 6.1.7'
gem 'pg', '~> 1.4'
gem 'puma', '~> 6.0'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'jwt'
gem 'bcrypt', '~> 3.1.18'
gem 'rack-cors'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end
