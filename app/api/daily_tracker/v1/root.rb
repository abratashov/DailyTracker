# frozen_string_literal: true

module DailyTracker
  module V1
    class Root < Grape::API
      version 'v1', using: :path

      mount V1::Auth::Base
    end
  end
end
