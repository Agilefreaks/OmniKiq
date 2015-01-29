require 'sidekiq'
require 'omnikiq'

OmniKiq.configure do |c|
  c.mixpanel_api_key = 'd4a302f695330322fe4c44bc302f3780'
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: 'redis://localhost:6379',
    namespace: 'default'
  }

  config.options[:concurrency] = 10
end
