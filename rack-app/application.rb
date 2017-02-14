require 'rack/app'
require_relative 'get'
require_relative 'post'

module Benchmarker
  class Application < Rack::App
    mount Benchmarker::Get
    mount Benchmarker::Post

    after do
      puts "\nXXXX After Application XXXX\n"
    end

    get '/gem' do
      'rack-app'
    end

    # use Rack::App::Middlewares::HeaderSetter, "Content-type" => "application/json"
  end
end
