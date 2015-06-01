source 'https://rubygems.org'

gemspec

ruby '2.2.1'

gem 'mixpanel-ruby'
gem 'sidekiq'
gem 'sinatra'

gem 'puma'

gem 'rubocop'

group :development do
  gem 'capistrano', '~> 3.3.0'
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', require: false
end

group :test do
  gem 'simplecov'
  gem 'simplecov-teamcity-summary'
  gem 'webmock'
end