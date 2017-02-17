module Benchmarker
  class Post
    def self.post(env)
      request = Rack::Request.new(env)
      json_body = Rack::Utils.parse_nested_query(request.body.read).to_json
      [
        200,
        {'Content-Type' => 'application/json'},
        [json_body]
      ]
    end
  end
end
