require 'spec_helper'

describe OmniKiq::Configuration do
  subject { OmniKiq::Configuration.new }

  describe 'sensible defaults' do
    its(:mixpanel_api_key) { is_expected.to eq '' }
    its(:redis_url) { is_expected.to eq 'redis://localhost:6379' }
    its(:redis_namespace) { 'default' }
    its(:test_mode) { false }
  end
end
