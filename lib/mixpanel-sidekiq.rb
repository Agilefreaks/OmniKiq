require 'mixpanel-sidekiq-config'
require 'trackers/mixpanel_events_tracker'
require 'trackers/mixpanel_people_tracker'
require 'trackers/mixpanel_alias_tracker'

module MixpanelSidekiq
  extend MixpanelSidekiqConfig
end