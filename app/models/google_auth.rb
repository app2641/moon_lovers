# frozen_string_literal: true

class GoogleAuth
  attr_reader :auth

  class << self
    def access_token
      new.then(&:access_token)
    end
  end

  def initialize
    @auth = ::Google::Auth::ServiceAccountCredentials
            .make_creds(scope: 'https://www.googleapis.com/auth/firebase.messaging')
  end

  def access_token
    return @access_token if @access_token.present?

    response = auth.fetch_access_token!
    @access_token = response['access_token']
  end
end
