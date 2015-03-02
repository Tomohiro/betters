require 'rails_helper'

describe User do
  fixtures :users

  describe '.find_by_username' do
    subject { users(:bruce_wayne) }

    context 'with capital letters' do
      it 'returns user' do
        expect(subject).to eq User.find_by_username('BRUCE')
      end
    end

    context 'with lower-case letters' do
      it 'returns user' do
        expect(subject).to eq User.find_by_username('bruce')
      end
    end
  end
end
