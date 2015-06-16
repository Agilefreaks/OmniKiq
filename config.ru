require File.expand_path('../app/client', __FILE__)
require 'sidekiq/web'

class Ping
  def call(_env)
    [200, { 'Content-Type' => 'text/plain' }, ['Pong']]
  end
end

map '/ping' do
  run Ping.new
end

map '/' do
  use Rack::Auth::Basic, 'Protected Area' do |username, password|
    username == 'sidekiq' && password == 'sidekiq'
  end

  run Sidekiq::Web
end
