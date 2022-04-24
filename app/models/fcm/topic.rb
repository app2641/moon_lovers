# frozen_string_literal: true

module Fcm
  class Topic
    TONIGHT = "#{Rails.env}-android-tonight"

    class << self
      def notify(payload)
        new.notify(payload)
      end
    end

    def notify(payload)
      response = client.connection.post("/v1/projects/#{ENV.fetch('FIREBASE_PROJECT_ID', nil)}/messages:send", payload)
      Error.catch!(response)
    end

    private

    def client
      @client ||= Client.new
    end
  end
end
