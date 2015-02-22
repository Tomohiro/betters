class User
  # OAuthAuthrorizable registers the authorized user
  module OAuthAuthorizable
    extend ActiveSupport::Concern

    def oauth_authorized?
      identities.present? && persisted?
    end

    # ClassMethods defines OAuth authorization processes
    module ClassMethods
      def oauth_authorize(auth)
        identity = Identity.find_or_create_with_oauth(auth)

        user = identity.user
        if user.nil?
          user = create_from_oauth(auth)
          user.identities << identity
        end

        user
      end

      def create_from_oauth(auth)
        user = User.new(email: auth.info.email, password: dummy_password)
        user.skip_confirmation!
        user.save!
        user
      end

      def dummy_password
        Devise.friendly_token[0, 20]
      end
    end
  end
end
