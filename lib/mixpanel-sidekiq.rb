require 'mixpanel-ruby'

MixpanelSidekiq.configure_server do |config|
  config.mixpanel do |cfg|
    cfg.api_key = 'd4a302f695330322fe4c44bc302f3780'
  end
  config.sidekiq do |cfg|
    cfg.redis = { url: 'redis://localhost:6379', namespace: 'Omnipaste' }
  end
end


module MixpanelSidekiq
  def self.configure_server
    yield self
  end

  def self.sidekiq
    Sidekiq.configure_server
  end

  class MixpanelTracker
    include Sidekiq::Worker

    def perform(email, event_name, params)
      Mixpanel::Tracker.new().track(email, event_name, params)
    end
  end
end


module MixpanelTrackerConfig
  mattr_accessor :test_mode
  self.test_mode = false

  mattr_accessor :api_key
  self.api_key = ''

  def self.config
    yield self
  end
end

TrackConfig.config do |conf|
  conf.api_key = 'd4a302f695330322fe4c44bc302f3780' if Rails.env.staging? || Rails.env.production?
  conf.test_mode = Rails.env.test? || Rails.env.cucumber? || Rails.env.development?
end