module Benchmarker
  class HelloWorld
    def call(env)
      if env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'] == '/'
        [
          200,
          {"Content-Type" => "text/html"},
          ["Hello World!"]
        ]
      elsif env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'] == '/gem'
        [
          200,
          {"Content-Type" => "text/html"},
          ["simply a Rack app"]
        ]
      elsif env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'] == '/books'
        [
          200,
          {"Content-Type" => "text/html"},
          ['Hello World!']
        ]
      elsif env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'].match(/\/books\/(.+)/)
        id = env['PATH_INFO'].match(/\/books\/(.+)/)[1]

        [
          200,
          {"Content-Type" => "text/html"},
          ["Routing parameter = #{id}"]
        ]
      elsif env['REQUEST_METHOD'] == 'POST' && env['PATH_INFO'] == '/books'
        request = Rack::Request.new(env)
        json_string = request.body.read
        json_body = Rack::Utils.parse_nested_query(json_string)

        [
          200,
          {"Content-Type" => "application/json"},
          [json_body.to_json]
        ]
      else
        debugger
        [
          404,
          {"Content-Type" => "text/html"},
          [""]
        ]
      end
    end
  end

  Application = HelloWorld.new
end

