module Benchmarker
  class Get < Nancy::Base
    get '/books' do
      'Hello World!'
    end

    get '/books/:id' do
      "Routing parameter = #{params['id']}"
    end
  end
end
