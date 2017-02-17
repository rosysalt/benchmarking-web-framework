require_relative 'get'
require_relative 'post'
require_relative 'v0/get'

module Benchmarker
  Application = Hanami::Router.new do
    get '/books', to: ->(env) { Get.index(env) }

    get '/books/:id', to: ->(env) { Get.show(env) }

    post '/books', to: ->(env) { Post.post(env) }
  end
end
