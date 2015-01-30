module OmniKiq
  module Trackers
    class Base
      include Sidekiq::Worker

      attr_writer :mixpanel_tracker

      def mixpanel_tracker
        @mixpanel_tracker ||= Mixpanel::Tracker.new(OmniKiq.configuration.mixpanel_api_key)
      end
    end
  end
end
