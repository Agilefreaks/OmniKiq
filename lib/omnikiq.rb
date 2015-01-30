require 'sidekiq'
require 'mixpanel-ruby'

require 'omnikiq/configuration'

require 'omnikiq/trackers/base'
require 'omnikiq/trackers/mixpanel_alias'
require 'omnikiq/trackers/mixpanel_events'
require 'omnikiq/trackers/mixpanel_people'

module OmniKiq
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= begin
                        config = OmniKiq::Configuration.new
                        config
                      end
  end

  def self.configure
    yield configuration if block_given?
    configure_client
  end

  def self.configure_client
    Sidekiq.configure_client do |config|
      config.redis = {
        url: OmniKiq.configuration.redis_url,
        namespace: OmniKiq.configuration.redis_namespace,
        size: 10
      }
    end
  end

  # default config for the client
  configure_client
end
