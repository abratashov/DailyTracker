# frozen_string_literal: true

module DailyTracker
  module Helpers
    module AuthHelpers
      PUBLIC_RESOURCES = [
        '/api/swagger_doc.json',
        '/api/v1/auth/sign_in'
      ].freeze

      def authenticate_api_user!
        return if PUBLIC_RESOURCES.include?(request.path)

        unauthorized_error! unless current_user
      end

      def current_user
        Current.user ||= jwt_current_user
      end

      def jwt_current_user
        auth = headers['Authorization'].to_s
        token = auth.split.last
        Warden::JWTAuth::UserDecoder.new.call(token, :user, nil)
      rescue StandardError
        unauthorized_error!
      end
    end
  end
end
