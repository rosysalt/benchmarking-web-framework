require_relative 'spec_helper'

describe 'test rack-app', type: :request do
    before do
      get url
    end

  context 'root' do
    let(:url) { '/books' }

    it do
      expect(last_response.ok?).to be_truthy
      expect(last_response.body).to eq('Hello World!')
    end
  end

  context 'routing parameters' do
    let(:url) { '/books/1' }

    it do
      expect(last_response.body).to eq('Routing parameter = 1')
    end
  end
end
