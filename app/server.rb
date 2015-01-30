require 'sidekiq'
require 'omnikiq'

OmniKiq.configure do |c|
  c.mixpanel_api_key = 'd4a302f695330322fe4c44bc302f3780'
end

redis_url = if ENV[:rack_env] == 'staging' || ENV[:rack_env] == 'production'
              'redis://10.133.201.189:6379'
            else
              'redis://localhost:6379'
            end

Sidekiq.configure_server do |config|
  config.redis = {
    url: redis_url,
    namespace: 'default'
  }

  config.options[:concurrency] = 10
end
