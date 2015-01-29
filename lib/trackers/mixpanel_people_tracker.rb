require 'sidekiq'
require 'mixpanel-ruby'

module MixpanelSidekiq
  class MixpanelPeopleTracker
    include Sidekiq::Worker

    def perform(distinct_id, params, ip = 0)
      Mixpanel::Tracker.new(MixpanelSidekiq.mixpanel_api_key).people.set(distinct_id, params, ip)
    end
  end
end