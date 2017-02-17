module Benchmarker
  class Application < Nancy::Base
    get '/books' do
      'Hello World!'
    end

    get '/books/:id' do
      "Routing parameter = #{params['id']}"
    end

    post '/books' do
      response['Content-Type'] = 'application/json'
      Rack::Utils.parse_nested_query(request.body.read).to_json
    end
  end
end
