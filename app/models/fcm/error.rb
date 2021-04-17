# frozen_string_literal: true

module Fcm
  class Error
    # Errors: https://firebase.google.com/docs/reference/fcm/rest/v1/ErrorCode
    class BadRequestError < StandardError; end

    class UnAuthorizedError < StandardError; end

    class ForbiddenError < StandardError; end

    class UnregisteredError < StandardError; end

    class OuotaExceededError < StandardError; end

    class InternalServerError < StandardError; end

    class ServiceUnavailableError < StandardError; end

    class << self
      def catch!(response)
        return response if response.status == 200

        klass = case response.status
                when 400
                  BadRequestError
                when 401
                  UnauthorizedError
                when 403
                  ForbiddenError
                when 404
                  UnregisteredError
                when 429
                  QuotaExceededError
                when 500
                  InternalServerError
                when 503
                  ServiceUnavailableError
                else
                  StandardError
                end

        raise klass, response.body[:error][:message] if klass.present?
      end
    end
  end
end
