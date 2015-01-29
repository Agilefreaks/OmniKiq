require 'sidekiq'
require 'mixpanel-ruby'

module MixpanelSidekiq
  class MixpanelAliasTracker
    include Sidekiq::Worker

    def perform(email, distinct_id)
      Mixpanel::Tracker.new(MixpanelSidekiq.mixpanel_api_key).alias(email, distinct_id)
    end
  end
end