require 'rails_helper'

describe User::OAuthAuthorizable do
  fixtures :users, :identities

  # Create a OAuth provider's by OmniAuth::AuthHash
  # Integration Testing intridea/omniauth Wiki
  # https://github.com/intridea/omniauth/wiki/Integration-Testing
  describe '.oauth_authorize' do
    context 'with already exists user and valid oauth hash' do
      let(:valid_github_auth_hash) do
        OmniAuth::AuthHash.new(
          provider: 'github',
          uid: 'BRUCE_GITHUB_UID',
          info: {
            email: 'bruce@example.com'
          }
        )
      end

      subject { User.oauth_authorize(valid_github_auth_hash).identities }

      it 'was authorized the user' do
        expect(subject.find_by(provider: 'github')).to be_instance_of(Identity)
      end
    end

    context 'with not exists user and valid oauth hash' do
      let(:dummy_provider_auth_hash) do
        OmniAuth::AuthHash.new(
          provider: 'dummy_provider',
          uid: 'NEW_USER_DUMMY_PROVIDER_UID',
          info: { email: 'new_user@example.com' }
        )
      end

      subject { User.oauth_authorize(dummy_provider_auth_hash) }

      it 'creates a user from OAuth hash' do
        expect(subject.persisted?).to be true
      end

      it 'has identities' do
        expect(subject.identities.present?).to be true
      end
    end

    context 'with invalid oauth hash' do
      let(:invalid_github_auth_hash) do
        OmniAuth::AuthHash.new(
          provider: 'github',
          uid: nil,
          info: { email: nil }
        )
      end

      subject { User.oauth_authorize(invalid_github_auth_hash) }

      it 'was failed to authorize the user' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe '#oauth_authorized?' do
    context 'with authorized user by GitHub' do
      it 'returns true' do
        expect(users(:clark_kent).oauth_authorized?('github')).to be true
      end
    end

    context 'with unauthorized user by GitHub' do
      it 'returns false' do
        expect(users(:bruce_wayne).oauth_authorized?('github')).to be false
      end
    end
  end
end
