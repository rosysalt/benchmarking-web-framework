module Benchmarker
  class Application < Cuba; end

  Application.define do
    on get do
      on 'books' do
        on ':id' do |id|
          res.write "Routing parameter = #{id}"
        end

        res.write 'Hello World!'
      end
    end

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
