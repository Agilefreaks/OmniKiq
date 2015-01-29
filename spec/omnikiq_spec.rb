require 'spec_helper'

describe OmniKiq do
  describe :configure do
    subject { OmniKiq.configuration }
    
    before do
      OmniKiq.configure do |c|
        c.mixpanel_api_key = 'mixpanel id'
      end
    end

    its(:mixpanel_api_key) { is_expected.to eq 'mixpanel id' }
  end
end