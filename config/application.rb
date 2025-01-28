require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "active_job/railtie"
require "action_cable/engine"
require "active_storage/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile
require "bundler/setup"
Bundler.require(*Rails.groups)

module CaptchaDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    config.time_zone = "UTC"
    
    # Don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.view_specs false
      g.helper_specs false
      g.system_tests = nil
    end

    # Configure the default encoding used in templates
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file
    config.filter_parameters += [
      :passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
    ]

    # Enable asset pipeline
    config.assets.enabled = true
    config.assets.version = '1.0'

    # Use new asset pipeline
    config.assets.css_compressor = nil
    config.assets.js_compressor = nil

    # Add additional load paths for your own custom dirs
    # config.autoload_paths += %W(#{config.root}/extras)

    # Disable automatic transformation of timezone-aware attributes to UTC
    # config.active_record.time_zone_aware_types = [:datetime, :time]
  end
end
