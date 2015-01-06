require 'mixpanel-sidekiq-config'
require 'mixpanel_events_tracker'
require 'mixpanel_people_tracker'
require 'mixpanel_alias_tracker'

module MixpanelSidekiq
  extend MixpanelSidekiqConfig
end