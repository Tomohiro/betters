# OauthCallbacksController authrorizes the user by OAuth providers
class OAuthCallbacksController < Devise::OmniauthCallbacksController
  rescue_from ActiveRecord::RecordInvalid, with: :unauthorized

  def authorize
    provider = auth.provider

    user = User.oauth_authorize(auth)
    if user.oauth_authorized?(provider)
      authorized(user)
    else
      unauthorized(provider)
    end
  end

  User.omniauth_providers.each do |provider|
    alias_method provider, :authorize
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def authorized(user)
    set_flash_message(:notice, :success) if is_navigational_format?
    sign_in_and_redirect user, event: :authentication
  end

  def unauthorized(provider)
    session["devise.#{provider}_data"] = auth
    redirect_to new_user_registration_url
  end
end
