# frozen_string_literal: true

module DailyTracker
  module Helpers
    module ErrorHelpers
      def unauthorized_error!
        error!('Unauthorized', 401)
      end

      def generic_error!(response_status, title:)
        status = Rack::Utils.status_code(response_status)
        errors = [{ status: status.to_s, title: }]
        error!({ errors: }, status)
      end

      def grape_validation_error!(exception) # rubocop:disable Metrics/MethodLength
        # Processing Grape::Exceptions::ValidationErrors context https://github.com/ruby-grape/grape/issues/574
        errors = exception.errors.map do |attr, attr_errors|
          {
            status: '422',
            title: 'ParamValidationError',
            meta: {
              field: attr.first,
              details: attr_errors.map { |e| { code: e.message_key } }
            }
          }
        end

        error!({ errors: }, 422)
      end

      def service_error!(service)
        return if service.success?

        status = service.status || 422
        error!(generic_error!(status, title: service.error), status)
      end
    end
  end
end
