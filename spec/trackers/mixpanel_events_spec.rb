require 'spec_helper'

describe OmniKiq::Trackers::MixpanelEvents do
  describe :perform do
    let(:mixpanel_events) { OmniKiq::Trackers::MixpanelEvents.new }
    let(:mixpanel_tracker) { double(Mixpanel::Tracker) }

    subject { mixpanel_events.perform('devil@feel.i', 'find love', {}) }

    before do
      mixpanel_events.mixpanel_tracker = mixpanel_tracker
    end

    it 'will call track with correct params' do
      expect(mixpanel_tracker).to receive(:track).with('devil@feel.i', 'find love',  {}, 0)
      subject
    end
  end
end
