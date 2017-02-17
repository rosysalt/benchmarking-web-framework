require 'rack/app'
require_relative 'get'
require_relative 'post'

require_relative 'v0/get_index'
require_relative 'v0/get_show'

module Benchmarker
  class Application < Rack::App
    mount Get
    mount Post

    namespace '/v0' do
      mount V0::GetIndex
      mount V0::GetShow
    end

    after do
      puts "\nXXXX After Application XXXX\n"
    end

    get '/gem' do
      'rack-app'
    end

    # use Rack::App::Middlewares::HeaderSetter, "Content-type" => "application/json"
  end
end
