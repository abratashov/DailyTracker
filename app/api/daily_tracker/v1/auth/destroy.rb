# frozen_string_literal: true

module DailyTracker
  module V1
    module Auth
      class Destroy < Grape::API
        namespace :auth do
          desc 'User Sign Out' do
            success code: 204
            failure [
              { code: 401, message: 'Unauthorized' },
              { code: 422, message: 'Unprocessable entity' }
            ]
          end

          delete :sign_out do
            service = ::Api::Auth::JwtSignOut.call(user: current_user, auth_header: request.headers['Authorization'])

            service_error!(service) and return if service.failure?

            header 'Authorization', ''
            status :no_content
          end
        end
      end
    end
  end
end
