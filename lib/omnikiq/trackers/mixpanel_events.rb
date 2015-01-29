require 'sidekiq'
require 'mixpanel-ruby'

module OmniKiq
  module Trackers
    class MixpanelEvents
      include Sidekiq::Worker

      def perform(email, event_name, params)
        Mixpanel::Tracker.new(OmniKiq.configuration.mixpanel_api_key).track(email, event_name, params)
      end
    end
  end
end
