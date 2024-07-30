# frozen_string_literal: true

class AppEnvironmentLoader
  def self.get(key, required:, default: nil)
    required ? ENV.fetch(key) : ENV.fetch(key, default)
  end

  def self.to_bool(val)
    ActiveModel::Type::Boolean.new.cast(val)
  end

  def self.prod?
    Rails.env.production?
  end

  def self.test?
    Rails.env.test?
  end

  def self.dummy?
    ENV['SECRET_KEY_BASE_DUMMY'].present?
  end

  def self.secret_key_base
    dummy? ? ENV['SECRET_KEY_BASE_DUMMY'] : get('SECRET_KEY_BASE', required: prod?)
  end

  def self.run
    Rails.application.secrets.tap do |s|
      # s.secret_key_base = secret_key_base
      s.domain = get('RAILS_DOMAIN', required: !dummy?)
      s.host = get('RAILS_HOST', required: !dummy?)
    end

    return if dummy?

    Rails.application.config.tap do |c|
      # Set rest settins
    end
  end
end

AppEnvironmentLoader.run
