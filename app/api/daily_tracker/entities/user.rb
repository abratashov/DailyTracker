# frozen_string_literal: true

module DailyTracker
  module Entities
    class User < Grape::Entity
      root :data, :data
      expose :email, documentation: { type: String, desc: 'User email', example: 'name@mail.org' }
      expose :jwt_token, documentation: { type: String, desc: 'JWT Token', example: '<Token>' }
    end
  end
end
