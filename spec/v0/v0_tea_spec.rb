require 'spec_helper'

describe 'test app', type: :request do
    before do
      get url
    end

  context 'root' do
    let(:url) { '/v0/tea/additions' }

    it do
      expect(last_response.ok?).to be_truthy
      expect(last_response.body).to eq('honey lemon mint cinnamon lavender ginger')
    end
  end

  context 'routing parameters' do
    let(:url) { '/v0/tea/types' }

    it do
      expect(last_response.body).to eq('black green herbal')
    end
  end
end
