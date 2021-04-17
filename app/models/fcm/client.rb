# frozen_string_literal: true

module Fcm
  class Client
    BASE_URL = 'https://fcm.googleapis.com'

    def connection
      Faraday.new(BASE_URL) do |builder|
        builder.request :oauth2, bearer_token, token_type: :bearer
        builder.request :json
        builder.response :json, parser_options: { symbolize_names: true }, content_type: 'application/json'
        builder.adapter Faraday.default_adapter
      end
    end

    private

    def bearer_token
      @bearer_token ||= GoogleAuth.access_token
    end
  end
end
