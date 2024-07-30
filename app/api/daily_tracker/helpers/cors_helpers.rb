# frozen_string_literal: true

module DailyTracker
  module Helpers
    module CorsHelpers
      def apply_cors_rules!
        # Rails: all rules defined in config/initializers/cors.rb are not applied for Grape
        # Grape: allow API requests from any web resource
        header['Access-Control-Allow-Origin'] = '*'
        header['Access-Control-Request-Method'] = '*'
      end
    end
  end
end
