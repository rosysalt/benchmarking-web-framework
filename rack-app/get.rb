require_relative 'common'

module Benchmarker
  class Get < Common
    get '/books' do
      'Hello World!'
    end

    get 'books/:id' do
      "Routing parameter = #{params['id']}"
    end
  end
end
