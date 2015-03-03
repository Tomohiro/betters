require 'rails_helper'

describe User do
  fixtures :users

  describe '.find_by_username' do
    context 'with capital letters' do
      it 'returns user' do
        expect(User.find_by_username('BRUCE')).to eq users(:bruce_wayne)
      end
    end

    context 'with lower-case letters' do
      it 'returns user' do
        expect(User.find_by_username('bruce')).to eq users(:bruce_wayne)
      end
    end
  end
end
