module Benchmarker
  class Application < Roda
    route do |r|
      r.get "books" do
        'Hello World!'
      end

      r.get "books", :id do |id|
        "Routing parameter = #{id}"
      end

      r.post "books" do
        json_string = request.body.read
        json_body = Rack::Utils.parse_nested_query(json_string)
        response['Content-Type'] = 'application/json'
        json_body.to_json
      end
    end
  end
end
