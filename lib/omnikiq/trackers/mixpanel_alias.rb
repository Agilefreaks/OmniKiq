module OmniKiq
  module Trackers
    class MixpanelAlias < Base
      def perform(email, distinct_id)
        mixpanel_tracker.alias(email, distinct_id)
      end
    end
  end
end
