require 'spec_helper'

describe OmniKiq::Trackers::MixpanelAlias do
  describe :perform do
    let(:mixpanel_alias) { OmniKiq::Trackers::MixpanelAlias.new }
    let(:mixpanel_tracker) { double(Mixpanel::Tracker) }

    subject { mixpanel_alias.perform('oh@yeah.com', '42') }

    before do
      mixpanel_alias.mixpanel_tracker = mixpanel_tracker
    end

    it 'will call alias with the correct params' do
      expect(mixpanel_tracker).to receive(:alias).with('oh@yeah.com', '42')
      subject
    end
  end
end
