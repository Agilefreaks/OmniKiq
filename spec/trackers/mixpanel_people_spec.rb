require 'spec_helper'

describe OmniKiq::Trackers::MixpanelPeople do
  describe :perform do
    let(:mixpanel_people) { OmniKiq::Trackers::MixpanelPeople.new }
    let(:mixpanel_tracker) { double(Mixpanel::Tracker) }

    subject { mixpanel_people.perform('42', {}) }

    before do
      mixpanel_people.mixpanel_tracker = mixpanel_tracker
    end

    it 'will call set with correct params' do
      people = double(:people)
      expect(mixpanel_tracker).to receive(:people).and_return(people)
      expect(people).to receive(:set).with('42', {}, 0)
      subject
    end
  end
end
