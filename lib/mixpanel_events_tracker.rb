require 'sidekiq'
require 'mixpanel-ruby'

module MixpanelSidekiq
  class MixpanelEventsTracker
    include Sidekiq::Worker

    def perform(email, event_name, params)
      Mixpanel::Tracker.new(MixpanelSidekiq.mixpanel_api_key).track(email, event_name, params, ip=0)
    end
  end
end