# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'OmniKiq'
set :repo_url, 'git@github.com:Agilefreaks/OmniKiq.git'

set :rvm_ruby_version, 'ruby-2.2.0@omnikiq'

set :pty, false

set :sidekiq_require, './app/server.rb'
