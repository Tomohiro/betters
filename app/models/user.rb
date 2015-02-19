class User < ActiveRecord::Base
  has_many :identities, dependent: :destroy

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:github]

  def self.from_oauth(auth)
    identity = Identity.from_oauth(auth)

    user = identity.user
    if user.nil?
      user = User.new(
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save!

      # Associate the identity with user
      identity.user = user
      identity.save!
    end

    user
  end
end
