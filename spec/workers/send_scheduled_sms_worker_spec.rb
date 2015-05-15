require 'spec_helper'

describe OmniKiq::Workers::SendScheduledSmsWorker do
  describe :perform do
    subject { OmniKiq::Workers::SendScheduledSmsWorker.new }

    before do
      stub_request(:patch, 'http://localhost:9292/api/v1/sms_messages/1234').
        with(:body => "{\"state\":\"sending\",\"device_id\":\"4321\"}",
             :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'bearer random', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => '{\"status\":\"200\"}', :headers => {})

    end

    it 'makes a put request to the OmniApi with correct parameters' do
      expect(subject.perform('1234', '4321')).to be_a Net::HTTPOK
    end
  end
end