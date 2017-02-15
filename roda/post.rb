module Benchmarker
  class Post < Roda
    route do |r|
      r.post "books" do
        json_string = request.body.read
        json_body = Rack::Utils.parse_nested_query(json_string)
        response['Content-Type'] = 'application/json'
        json_body.to_json
      end
    end
  end
end
