require 'extensions/array'
require 'extensions/module'

module MixpanelSidekiqConfig
  mattr_accessor :mixpanel_api_key
  self.mixpanel_api_key = ''

  mattr_accessor :redis_url
  self.redis_url = 'redis://localhost:6379'

  mattr_accessor :redis_namespace
  self.redis_namespace = 'default'

  mattr_accessor :test_mode
  self.test_mode = false

  def self.config
    yield self
  end
end