module Benchmarker
  Application = Hanami::Router.new do
    get '/books', to: ->(env) do
      [
        200,
        {},
        ['Hello World!']
      ]
    end

    get '/books/:id', to: ->(env) do
      [
        200,
        {},
        ["Routing parameter = #{ env['router.params'][:id] }"]
      ]
    end

    post '/books', to: ->(env) do
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
