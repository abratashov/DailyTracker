# frozen_string_literal: true

class AllowlistedJwt < ApplicationRecord
  belongs_to :user

  scope :expired, -> { where('exp < :now', now: Time.current) }

  class << self
    def decode_jwt_payload(token, secret_key = Rails.application.credentials.jwt_secret_key!, alg = 'HS256')
      payload = JWT.decode(token, secret_key, true, algorithm: alg).first
      HashWithIndifferentAccess.new(payload)
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => e
      raise StandardError, e.message
    end
  end
end
