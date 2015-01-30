require File.expand_path('../app/client', __FILE__)
require 'sidekiq/web'

map '/' do
  use Rack::Auth::Basic, 'Protected Area' do |username, password|
    username == 'sidekiq' && password == 'sidekiq'
  end

  run Sidekiq::Web
end