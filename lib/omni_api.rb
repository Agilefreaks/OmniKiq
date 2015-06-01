require 'singleton'
require 'active_support/core_ext/module/attribute_accessors'

module OmniApi
  mattr_accessor :test_mode
  self.test_mode = false

  mattr_accessor :base_url
  self.base_url = ''

  mattr_accessor :client_access_token
  def self.client_access_token=(token)
    @client_access_token = "bearer #{token}"
  end

  def self.client_access_token
    @client_access_token || 'bearer empty'
  end

  def self.config
    self
  end

  def self.setup
    yield self
  end
end
