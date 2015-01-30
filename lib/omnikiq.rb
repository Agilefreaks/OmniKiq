require 'sidekiq'
require 'mixpanel-ruby'

require 'omnikiq/configuration'
require 'omnikiq/trackers/base'

module OmniKiq
  class << self
    attr_writer :configuration
  end

  module Trackers
    autoload :MixpanelAlias, 'omnikiq/trackers/mixpanel_alias'
    autoload :MixpanelEvents, 'omnikiq/trackers/mixpanel_events'
    autoload :MixpanelPeople, 'omnikiq/trackers/mixpanel_people'
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

    if OmniKiq.configuration.test_mode
      require 'sidekiq/testing'
      Sidekiq::Testing.fake!
    end
  end

  # default config for the client
  configure_client
end
