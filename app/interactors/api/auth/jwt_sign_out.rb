# frozen_string_literal: true

module Api
  module Auth
    class JwtSignOut
      include Interactor

      delegate :user, :auth_header, to: :context

      before do
        context.fail!(error: 'User not found', status: :not_found) if user.blank?
      end

      def call
        token = auth_header.to_s.split(' ').last
        context.fail!(error: 'Authorization header should contains JWT token', status: :not_found) if token.blank?

        revoke(token)
      end

      private

      def revoke(token)
        payload = AllowlistedJwt.decode_jwt_payload(token)

        User.revoke_jwt(payload, user)
      end
    end
  end
end
