# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.3'

gem 'puma', '~> 6.4'
gem 'rails', '7.1.3.4'
gem 'sqlite3', '~> 1.4'

# Default Rails front-end
gem 'importmap-rails', '~> 2.0' # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'sprockets-rails', '~> 3.5' # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'stimulus-rails', '~> 1.3' # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'turbo-rails', '~> 2.0' # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

gem 'jbuilder', '~> 2.12'

gem 'redis', '~> 5.2' # Use Redis adapter to run Action Cable in production
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]

gem 'tzinfo-data', platforms: %i[windows jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

gem 'bootsnap', '~> 1.18', require: false # Reduces boot times through caching; required in config/boot.rb

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', '~> 1.9', platforms: %i[mri windows]

  # Environment
  gem 'dotenv-rails', '~> 3.1'
end

group :development do
  gem 'web-console', '~> 4.2' # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem "rack-mini-profiler" # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "spring" # Speed up commands on slow machines / big apps [https://github.com/rails/spring]

  # Linter
  gem 'rubocop', '~> 1.65', require: false
  gem 'rubocop-capybara', '~> 2.21', require: false
  gem 'rubocop-factory_bot', '~> 2.26', require: false
  gem 'rubocop-minitest', '~> 0.35', require: false
  gem 'rubocop-performance', '~> 1.21', require: false
  gem 'rubocop-rails', '~> 2.25', require: false
  gem 'rubocop-rake', '~> 0.6', require: false
  gem 'rubocop-rspec', '~> 3.0', require: false
  gem 'rubocop-rspec_rails', '~> 2.30', require: false

  # Email
  gem 'letter_opener', '~> 1.10'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '~> 3.40'
  gem 'selenium-webdriver', '~> 4.2'
end

# Authentication
gem 'devise', '~> 4.9'
gem 'devise-jwt', '~> 0.12'
gem 'rack-cors', '~> 2.0'

# API & Swagger
gem 'grape', '~> 2.1'
gem 'grape-entity', '~> 1.0'
gem 'grape_on_rails_routes', '~> 0.3' # adds 'rake grape:routes' task
gem 'grape-swagger', '~> 2.1'
gem 'grape-swagger-entity', '~> 0.5'
gem 'grape-swagger-rails', '~> 0.5'

# Other
gem 'awesome_print', '~> 1.9'
gem 'haml-rails', '~> 2.1'
gem 'interactor', '~> 3.1'
