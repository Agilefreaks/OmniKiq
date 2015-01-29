require 'bundler/setup'
Bundler.setup

ENV['RACK_ENV'] ||= 'test'

require 'omnikiq'

# Require all of the RSpec Support libraries
Dir[File.expand_path(File.join('../support/**/*.rb'), __FILE__)].each { |f| require f }

require 'simplecov'
SimpleCov.start 'teamcity'
