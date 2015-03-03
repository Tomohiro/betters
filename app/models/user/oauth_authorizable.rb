class User
  # OAuthAuthrorizable creates the connection of the authorized user
  module OAuthAuthorizable
    extend ActiveSupport::Concern

    class_methods do
      def oauth_authorize(auth)
        connection = Connection.find_or_create_with_oauth(auth)

        user = connection.user
        if user.nil?
          user = create_from_oauth(auth)
          user.connections << connection
        end

        user
      end

      def create_from_oauth(auth)
        user = User.new(
          username: auth.info.nickname,
          email:    auth.info.email,
          password: dummy_password
        )
        user.skip_confirmation!
        user.save!
        user
      end

      def dummy_password
        Devise.friendly_token[0, 20]
      end
    end

    def oauth_authorized?(provider)
      connections.find_by(provider: provider).present? && persisted?
    end
  end
end
