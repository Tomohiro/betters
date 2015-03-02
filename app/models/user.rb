# User represents an user's domain
class User < ActiveRecord::Base
  has_many :identities, dependent: :destroy

  # @param [String] username the unique name of user
  scope :find_by_username, -> (username) do
    where(arel_table[:username].matches("%#{username}%")).take!
  end

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: 1..15
  validates :username, format: { without: /[!-\/\@\^\~\`\(\)\[\]\>\<\=]/ }

  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,
         :omniauthable, omniauth_providers: [:github, :facebook]

  include OAuthAuthorizable
end
