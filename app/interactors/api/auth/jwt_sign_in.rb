# frozen_string_literal: true

module Api
  module Auth
    class JwtSignIn
      include Interactor

      delegate :params, to: :context

      attr_reader :user, :email, :password

      before do
        @email = params[:email]
        @password = params[:password]
        @user = User.find_for_database_authentication(email: params[:email])
        context.fail!(error: 'User not found', status: :not_found) if user.blank?
      end

      def call
        context.fail!(error: 'Incorrect password', status: :not_found) unless user.valid_password?(password)

        token, payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
        user.on_jwt_dispatch(token, payload)

        user.jwt_token = token
        context.user = user
      end
    end
  end
end
