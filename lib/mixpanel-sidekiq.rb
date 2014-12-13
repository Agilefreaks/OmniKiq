require 'sidekiq'
require 'mixpanel-ruby'
require 'mixpanel-sidekiq-config'

module MixpanelSidekiq
  extend MixpanelSidekiqConfig

  def self.sidekiq
    Sidekiq.configure_server
  end

  class MixpanelTracker
    include Sidekiq::Worker

    def perform(email, event_name, params)
      Mixpanel::Tracker.new(MixpanelSidekiq.mixpanel_api_key).track(email, event_name, params)
    end
  end
end