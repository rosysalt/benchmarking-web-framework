module Benchmarker
  class Post < Cuba
  end

  Post.define do
    on post do
      on 'books' do
        json_string = req.body.read
        json_body = Rack::Utils.parse_nested_query(json_string)

        res['Content-Type'] = 'application/json'
        res.write json_body.to_json
      end
    end
  end
end
