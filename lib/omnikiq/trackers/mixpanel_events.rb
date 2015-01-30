require 'sidekiq'
require 'mixpanel-ruby'

module OmniKiq
  module Trackers
    class MixpanelEvents < Base
      def perform(email, event_name, params, ip = 0)
        mixpanel_tracker.track(email, event_name, params, ip)
      end
    end
  end
end
