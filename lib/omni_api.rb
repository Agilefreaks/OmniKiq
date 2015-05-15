require 'singleton'

module OmniApi
  attr_accessor :test_mode
  @@test_mode = false
  @@base_url = ''
  @@client_access_token = ''

  def self.test_mode= value
    @@test_mode = value
  end

  def self.test_mode
    @@test_mode || false
  end

  # rubocop:disable Style/ClassVars
  def self.client_access_token=(token)
    @@client_access_token = "bearer #{token}"
  end

  def self.client_access_token
    @@client_access_token || ''
  end

  def self.base_url=(url)
    @@base_url = url
  end

  def self.base_url
    @@base_url || ''
  end


  def self.config
    self
  end

  def self.setup
    yield self
  end
end
