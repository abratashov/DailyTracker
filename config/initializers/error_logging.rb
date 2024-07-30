# frozen_string_literal: true

def log_error(error, message = nil, lines = 10)
  Rails.logger.error(message) if message
  Rails.logger.error(error.message)
  Rails.logger.error(error.backtrace[0..lines].join("\n"))
end
