require 'rails_helper'

describe User::OAuthAuthorizable do
  fixtures :users, :identities

  describe '.oauth_authorize' do
    context 'with valid oauth hash' do
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

  describe '.create_from_oauth' do
    let(:dummy_provider_auth_hash) do
      OmniAuth::AuthHash.new(
        provider: 'dummy_provider',
        uid: 'NEW_USER_DUMMY_PROVIDER_UID',
        info: { email: 'new_user@example.com' }
      )
    end

    it 'creates a user from OAuth hash' do
      created_user = User.create_from_oauth(dummy_provider_auth_hash)
      expect(created_user.persisted?).to be true
    end
  end

  describe '.dummy_password' do
    it 'generates dummy password' do
      expect(User.dummy_password.length).to eq 20
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
