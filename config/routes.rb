Rails.application.routes.draw do
  mount Peek::Railtie => '/peek'

  devise_for :users, controllers: {
    omniauth_callbacks: :oauth_callbacks
  }

  get '/@:username' => 'users#show'

  # How To: Define resource actions that require authentication using routes.rb
  # https://github.com/plataformatec/devise/wiki/How-To:-Define-resource-actions-that-require-authentication-using-routes.rb
  authenticated :user do
    root 'dashboard#index', as: :authenticated_user_root
  end

  root 'landing#index'
end
