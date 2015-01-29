require 'sidekiq'
require 'mixpanel-ruby'

module OmniKiq
  module Trackers
    class MixpanelAlias
      include Sidekiq::Worker

      def perform(email, distinct_id)
        Mixpanel::Tracker.new(OmniKiq.mixpanel_api_key).alias(email, distinct_id)
      end
    end
  end
end