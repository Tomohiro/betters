# OauthCallbacksController authenticates the user
class OauthCallbacksController < Devise::OmniauthCallbacksController
  rescue_from ActiveRecord::RecordInvalid, with: :user_unauthenticated

  def auth
    request.env['omniauth.auth']
  end

  def authenticate
    provider = auth.provider

    user = User.oauth_authenticate(auth)
    if user.oauth_authenticated?
      user_authenticated(user, provider)
    else
      user_unauthenticated(provider)
    end
  end

  alias_method :github, :authenticate

  private

  def user_authenticated(user, provider)
    if is_navigational_format?
      set_flash_message(:notice, :success, kind: provider)
    end
    sign_in_and_redirect user, event: :authentication
  end

  def user_unauthenticated(provider)
    session["devise.#{provider}_data"] = auth
    redirect_to new_user_registration_url
  end
end
