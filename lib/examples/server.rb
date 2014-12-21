require 'sidekiq'
require 'mixpanel-ruby'
require 'mixpanel-sidekiq-config.rb'

Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'Omnipaste', :size => 10 }
end

MixpanelSidekiqConfig.config do |config|
  config.mixpanel_api_key = 'd4a302f695330322fe4c44bc302f3780'
end

require 'mixpanel-sidekiq.rb'