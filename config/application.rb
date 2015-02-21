require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Betters
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    redis_url = ENV['REDIS_URL'] || ENV['REDISCLOUD_URL'] || 'localhost'

    # Rails provides different stores for the cached data created by action and fragment caches.
    # http://guides.rubyonrails.org/caching_with_rails.html#cache-stores
    config.cache_store = :redis_store, "#{redis_url}/1/cache",
      { expires_in: 90.minutes }

    # For session store.
    config.session_store_servers = "#{redis_url}/0/session"
  end
end
