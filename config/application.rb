require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

class Application < Rails::Application
  # Initialize configuration defaults for originally generated Rails version.
  config.load_defaults 6.1

  # Redis configurations
  # config.cache_store = :redis_store, "redis://localhost:6379/0/cache", { expires_in: 90.minutes }
  # config.cache_store = :redis_store, "redis://redis-13574.c56.east-us.azure.cloud.redislabs.com:13574/0/cache", { expires_in: 1.minute }


  # Configuration for the application, engines, and railties goes here.
  #
  # These settings can be overridden in specific environments using the files
  # in config/environments, which are processed later.
  #
  # config.time_zone = "Central Time (US & Canada)"
  # config.eager_load_paths << Rails.root.join("extras")
  Rails.application.default_url_options[:host] = 'http://localhost:3000/'
end
