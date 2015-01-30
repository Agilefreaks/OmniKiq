require 'sidekiq'

redis_url = if ENV['RACK_ENV'] == 'staging' || ENV['RACK_ENV'] == 'production'
              'redis://10.133.201.189:6379'
            else
              'redis://localhost:6379'
            end

Sidekiq.configure_client do |config|
  config.redis = {
    url: redis_url,
    namespace: ENV['RACK_ENV'],
    size: 10
  }
end
