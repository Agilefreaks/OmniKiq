require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

require 'omnikiq'
require 'rspec/its'

OmniApi.config.base_url = 'localhost:9292'
OmniApi.config.client_access_token = 'random'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: false)

# Require all of the RSpec Support libraries
Dir[File.expand_path(File.join('../support/**/*.rb'), __FILE__)].each { |f| require f }

require 'simplecov'
require 'simplecov-teamcity-summary'
SimpleCov.start 'teamcity'
