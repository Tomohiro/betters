require 'rails_helper'

describe 'Landing page' do
  describe 'GET /' do
    it 'returns an index' do
      get '/'
      expect(response).to be_ok
    end
  end
end
