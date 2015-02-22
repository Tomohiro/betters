# User reperesents the User's domain
class User < ActiveRecord::Base
  has_many :identities, dependent: :destroy

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:github]

  include OAuthAuthorizable
end
