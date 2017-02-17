require_relative 'get'
require_relative 'post'

module Benchmarker
  class Application < Cuba; end

  Application.define do
    on get do
      run Get
    end

    on post do
      run Post
    end
  end
end
