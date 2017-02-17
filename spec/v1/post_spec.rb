require_relative 'spec_helper'

describe 'test post method', type: :request do
  let (:post_body) do
    {
      title: 'Tiny Beautiful',
      author: 'Cheryl Strayed',
      comments: [
        {
          content: 'very good',
          commenter: 'alice'
        },
        {
          content: 'super fantastic',
          commeter: 'bob'
        }
      ],
      info: {
        published_year: '2014',
        published_by: 'ABCorp'
      }
    }
  end

  before do
    post url, post_body
  end

  context 'root' do
    let(:url) { '/books' }

    it do
      expect(last_response.ok?).to be_truthy
      expect(last_response.header['Content-Type']).to eq('application/json')

      json_response = JSON.parse(last_response.body, symbolize_names: true)
      expect(json_response).to eq(post_body)
    end
  end
end
