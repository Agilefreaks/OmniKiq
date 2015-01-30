require 'sidekiq'
require 'mixpanel-ruby'

module OmniKiq
  module Trackers
    class MixpanelPeople < Base
      def perform(distinct_id, params, ip = 0)
        mixpanel_tracker.people.set(distinct_id, params, ip)
      end
    end
  end
end
