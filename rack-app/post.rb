require_relative 'common'

module Benchmarker
  class Post < Common
    post 'books' do
      json_string = request.body.read
      json_body = Rack::Utils.parse_nested_query(json_string)
      json_body.to_json
    end
  end
end
