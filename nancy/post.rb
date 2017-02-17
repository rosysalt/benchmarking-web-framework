module Benchmarker
  class Post < Nancy::Base
    post '/books' do
      response['Content-Type'] = 'application/json'
      Rack::Utils.parse_nested_query(request.body.read).to_json
    end
  end
end
