require_relative 'get'
require_relative 'post'

module Benchmarker
  class Application < Nancy::Base
    <<-DOC
      only 1 file per resources
    DOC

    post '/books' do
      response['Content-Type'] = 'application/json'
      Rack::Utils.parse_nested_query(request.body.read).to_json
    end

    map '/' do
      run Get
    end
  end
end