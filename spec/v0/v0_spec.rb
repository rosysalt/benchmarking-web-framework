require 'spec_helper'

describe 'test app', type: :request do
    before do
      get url
    end

  context 'root' do
    let(:url) { '/v0/books' }

    it do
      expect(last_response.ok?).to be_truthy
      expect(last_response.body).to eq('Version 0 - Hello World!')
    end
  end

  context 'routing parameters' do
    let(:url) { '/v0/books/1' }

    it do
      expect(last_response.body).to eq('Version 0 - Routing parameter = 1')
    end
  end
end
