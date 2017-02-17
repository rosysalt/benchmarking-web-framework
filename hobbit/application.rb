require_relative 'v0/application'

module Benchmarker
  class Application < Hobbit::Base
    <<-DOC
      It's similar to nancy

      If we have some completely different routes, then it's possible to split resources into
      different files.
        Ex:

          map('books/find') { run Book.find.new }
          map('books/show') { run Book.show.new }

      It seems impossible for me to split the RESTful resources into different files.

      In Ludwig, we have the advantage of completely different endpoints, so Hobbit will still work
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

    map('/v0') { run V0::Application.new }
  end
end
