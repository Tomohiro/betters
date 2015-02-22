# OauthCallbacksController authrozes the user by OAuth providers
class OauthCallbacksController < Devise::OmniauthCallbacksController
  rescue_from ActiveRecord::RecordInvalid, with: :unauthorized

  def auth
    request.env['omniauth.auth']
  end

  def authorize
    provider = auth.provider

    user = User.oauth_authorize(auth)
    if user.oauth_authorized?
      authorized(user, provider)
    else
      unauthorized(provider)
    end
  end

  Devise.omniauth_providers.each do |provider|
    alias_method provider, :authorize
  end

  private

  def authorized(user, provider)
    if is_navigational_format?
      set_flash_message(:notice, :success, kind: provider)
    end
    sign_in_and_redirect user, event: :authentication
  end

  def unauthorized(provider)
    session["devise.#{provider}_data"] = auth
    redirect_to new_user_registration_url
  end
end
