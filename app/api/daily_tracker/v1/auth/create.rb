# frozen_string_literal: true

module DailyTracker
  module V1
    module Auth
      class Create < Grape::API
        namespace :auth do
          desc 'User Sign In' do
            success code: 200
            failure [
              { code: 401, message: 'Unauthorized' },
              { code: 422, message: 'Unprocessable entity' }
            ]
          end

          params do
            requires :email, type: String
            requires :password, type: String
          end

          post :sign_in do
            service = ::Api::Auth::JwtSignIn.call(params:)

            service_error!(service) and return if service.failure?

            header 'Authorization', "Bearer #{service.token}"
            present service.user, with: DailyTracker::Entities::User
          end

          # User 'Sign Up' implemented only with Devise that creates user with an email confirmation /users/sign_up
          # post :sign_up { ... }
        end
      end
    end
  end
end
