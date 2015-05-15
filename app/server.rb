require 'sidekiq'
require 'omnikiq'

OmniKiq.configure do |c|
  c.mixpanel_api_key = 'd4a302f695330322fe4c44bc302f3780'
end

OmniApi.config.base_url = ENV['OMNI_API_URL'] || 'localhost:9292'
OmniApi.config.client_access_token = ENV['OMNI_API_KEY'] + 'FUsPvOxMXTqyu06TbcVd691uxuKJtNHpBhmQGJPm5EkhAXmn9GANiUM1sq0VzIhvPjgjaUBt4HvFlMFCtqb6KQ=='

Sidekiq.configure_server do |config|
  config.redis = {
    url: 'redis://localhost:6379',
    namespace: 'default'
  }

  config.options[:concurrency] = 10
end
