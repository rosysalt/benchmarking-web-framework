module Benchmarker
  class Application < Hobbit::Base
    <<-DOC
      It's similar to nancy
    DOC

    get '/books' do
      'Hello World!'
    end

    get '/books/:id' do
      "Routing parameter = #{request.params[:id]}"
    end

    post '/books' do
      response['Content-Type'] = 'application/json'
      Rack::Utils.parse_nested_query(request.body.read).to_json
    end
  end
end
