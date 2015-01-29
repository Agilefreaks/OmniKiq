require 'omnikiq/configuration'

module OmniKiq
  module Trackers
    autoload :MixpanelAlias, 'omnikiq/trackers/mixpanel_alias'
    autoload :MixpanelEvents, 'omnikiq/trackers/mixpanel_events'
    autoload :MixpanelPeople, 'omnikiq/trackers/mixpanel_people'
  end

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
  end
end