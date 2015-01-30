set :deploy_to, '/var/www/omnikiq'
set :branch, 'staging'

set :rack_env, 'staging'

role :app, %w(deploy@188.166.60.176)
role :web, %w(deploy@188.166.60.176)
