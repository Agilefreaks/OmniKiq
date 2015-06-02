require 'net/http'

module OmniKiq
  module Workers
    class SendScheduledSmsWorker
      include Sidekiq::Worker

      def perform(sms_message_id, device_id)
        http = Net::HTTP.new(::OmniApi.config.base_url)
        path = "/api/v1/sms_messages/#{sms_message_id}"

        data = { state: 'sending', device_id: device_id }.to_json
        header = { 'Authorization' => OmniApi.config.client_access_token }
        http.send_request('PATCH', path, data, header)
      end
    end
  end
end
