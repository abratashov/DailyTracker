# frozen_string_literal: true

require 'grape-swagger'

module DailyTracker
  class Api < Grape::API
    content_type :json, 'application/json'
    default_format :json
    format :json

    helpers Helpers::AuthHelpers
    helpers Helpers::CorsHelpers
    helpers Helpers::ErrorHelpers

    before do
      apply_cors_rules!
      authenticate_api_user!
    end

    rescue_from Grape::Exceptions::ValidationErrors do |e|
      grape_validation_error!(e)
    end

    rescue_from ActiveRecord::RecordNotFound do |_e|
      generic_error!(404, title: 'Not found')
    end

    rescue_from StandardError do |e|
      log_error(e)
      # Sentry.capture_exception(e)
      generic_error!(500, title: e.message)
    end

    mount V1::Root

    add_swagger_documentation(SWAGGER_DOCUMENTATION)
  end
end
