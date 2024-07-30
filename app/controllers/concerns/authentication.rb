# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  API_PATTERN = %r{\A/api/}

  included do
    protect_from_forgery unless: -> { api_endpoint? }
    before_action :authenticate!
  end

  private

  def authenticate!
    authenticate_user!
    Current.user = current_user
  end

  def api_endpoint?
    request.path.match?(API_PATTERN)
  end
end
