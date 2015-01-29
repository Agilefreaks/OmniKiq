require 'mixpanel-sidekiq-config'

module OmniKiq
  extend MixpanelSidekiqConfig

  module Trackers
    autoload :MixpanelAlias, 'omnikiq/trackers/mixpanel_alias'
    autoload :MixpanelEvents, 'omnikiq/trackers/mixpanel_events'
    autoload :MixpanelPeople, 'omnikiq/trackers/mixpanel_people'
  end
end