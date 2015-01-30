#!/usr/bin/env puma

directory '/var/www/omnikiq/current'
rackup '/var/www/omnikiq/current/config.ru'
environment ENV['RACK_ENV']

pidfile '/var/www/omnikiq/shared/tmp/pids/puma.pid'
state_path '/var/www/omnikiq/shared/tmp/pids/puma.state'
stdout_redirect '/var/www/omnikiq/shared/log/puma_access.log', '/var/www/omnikiq/shared/log/puma_error.log', true

threads 0, 2

bind 'unix:/var/www/omnikiq/shared/tmp/sockets/puma.sock'
workers 2

preload_app!

on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = '/var/www/omnikiq/current/Gemfile'
end
