# ApplicationController defines default actions
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  # Set I18n locale
  #
  # Rails Internationalization (I18n) API - Ruby on Rails Guides.
  # http://guides.rubyonrails.org/i18n.html#setting-the-locale-from-the-domain-name
  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end

  # Get locale code from request subdomain (like http://ja.plate.dev)
  #
  # In development environment on OS X, you have to create the Pow symlink like:
  #   ln -s plate ~/.pow/plate
  #
  # @return [String|nil] locale the auto detected locale from subdomain
  def extract_locale_from_subdomain
    locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
  end
end
