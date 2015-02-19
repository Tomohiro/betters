class Identity < ActiveRecord::Base
  belongs_to :user

  validates :uid, presence: true
  validates :uid, uniqueness: { scope: :provider }
  validates :provider, presence: true

  def self.from_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
