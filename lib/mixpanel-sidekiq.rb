module MixpanelSidekiq
  extend MixpanelSidekiqConfig

  class MixpanelTracker
    include Sidekiq::Worker

    def perform(email, event_name, params)
      Mixpanel::Tracker.new(MixpanelSidekiq.mixpanel_api_key).track(email, event_name, params)
    end
  end
end