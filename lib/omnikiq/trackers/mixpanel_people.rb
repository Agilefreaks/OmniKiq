require 'sidekiq'
require 'mixpanel-ruby'

module OmniKiq
  module Trackers
    class MixpanelPeople
      include Sidekiq::Worker

      def perform(distinct_id, params, ip = 0)
        Mixpanel::Tracker.new(OmniKiq.mixpanel_api_key).people.set(distinct_id, params, ip)
      end
    end
  end
end