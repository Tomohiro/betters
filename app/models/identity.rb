# Identity reporesents an user's OAuth identity
class Identity < ActiveRecord::Base
  belongs_to :user

  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :provider, presence: true

  def self.find_or_create_with_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider) do |identity|
      identity.user = User.find_by(email: auth.info.email)
    end
  end
end
