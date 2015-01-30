set :deploy_to, '/var/www/omnikiq'
set :branch, 'production'

set :rack_env, 'production'

set :default_env, { 'RACK_ENV' => 'production' }

role :app, %w(deploy@178.62.253.81)
role :web, %w(deploy@178.62.253.81)
