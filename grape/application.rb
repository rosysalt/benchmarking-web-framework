module Benchmarker
  class Application < Grape::API
    resources :books do
      get do
        'Hello World!'
      end

      route_param :id do
        get do
          "Routing parameter = #{params[:id]}"
        end
      end

      post do
        content_type 'application/json'
        status 200
        Rack::Utils.parse_nested_query(request.body.read)
      end
    end
  end
end
