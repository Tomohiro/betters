Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Configure SMTP to ActionMailer
  #
  # http://guides.rubyonrails.org/action_mailer_basics.html#action-mailer-configuration
  config.action_mailer.default_url_options = {
    host: "#{ENV['APP_HOST']}:#{ENV['PORT']}"
  }
  config.action_mailer.delivery_method = :file

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Creating and Customizing Rails Generators & Templates
  # http://guides.rubyonrails.org/generators.html#customizing-your-workflow-by-changing-generators-templates
  config.generators do |g|
    g.controller_specs false
    g.view_specs       false
    g.helper_specs     false
    g.helper           false
    g.javascripts      false
    g.stylesheets      false
  end

  # ruby on rails 4 - How to use Byebug with a remote process (e.g., pow) - Stack Overflow
  # http://stackoverflow.com/questions/22794176/how-to-use-byebug-with-a-remote-process-e-g-pow
  if ENV['RUBY_DEBUG_PORT']
    Byebug.start_server 'localhost', ENV['RUBY_DEBUG_PORT'].to_i
  end
end
