# frozen_string_literal: true

module DailyTracker
  module V1
    module Auth
      class Base < Grape::API
        mount Create
        mount Destroy
      end
    end
  end
end
