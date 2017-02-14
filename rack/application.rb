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
      else
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

