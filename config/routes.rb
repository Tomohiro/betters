Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: :oauth_callbacks
  }

  # How To: Define resource actions that require authentication using routes.rb
  # https://github.com/plataformatec/devise/wiki/How-To:-Define-resource-actions-that-require-authentication-using-routes.rb
  authenticated :user do
    root 'dashboard#index', as: :authenticated_user_root
  end
  root 'welcome#index'
end
