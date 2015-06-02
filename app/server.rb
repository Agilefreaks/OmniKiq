require 'sidekiq'
require 'omnikiq'

OmniKiq.configure do |c|
  c.mixpanel_api_key = 'd4a302f695330322fe4c44bc302f3780'
end

OmniApi.config.base_url = ENV['OMNI_API_URL'] || 'localhost:9292'
# rubocop:disable Metrics/LineLength
OmniApi.config.client_access_token = ENV['OMNI_API_KEY'] || 'FUsPvOxMXTqyu06TbcVd691uxuKJtNHpBhmQGJPm5EkhAXmn9GANiUM1sq0VzIhvPjgjaUBt4HvFlMFCtqb6KQ=='

redis_url = if ENV['RACK_ENV'] == 'staging' || ENV['RACK_ENV'] == 'production'
              'redis://10.133.201.189:6379'
            else
              'redis://localhost:6379'
            end

Sidekiq.configure_server do |config|
  config.redis = {
    url: redis_url,
    namespace: ENV['RACK_ENV'],
    size: 10
  }

  config.options[:concurrency] = 10
end
