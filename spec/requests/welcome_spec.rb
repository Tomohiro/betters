require 'rails_helper'

describe :Welcome do
  describe 'GET /' do
    it 'returns an index' do
      get '/'
      expect(response).to be_ok
    end
  end
end
