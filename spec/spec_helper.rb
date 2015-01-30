require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

require 'omnikiq'
require 'rspec/its'

# Require all of the RSpec Support libraries
Dir[File.expand_path(File.join('../support/**/*.rb'), __FILE__)].each { |f| require f }

require 'simplecov'
SimpleCov.start do
  at_exit do
    SimpleCov::Formatter::TeamcitySummaryFormatter.new.format(SimpleCov.result) if ENV['TEAMCITY_VERSION']
  end
end
