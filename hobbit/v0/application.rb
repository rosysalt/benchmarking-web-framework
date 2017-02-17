require_relative 'tea'

module Benchmarker
  module V0
    class Application < Hobbit::Base
      get '/books' do
        'Version 0 - Hello World!'
      end

      get '/books/:id' do
        "Version 0 - Routing parameter = #{request.params[:id]}"
      end

      map('/tea') { run Tea.new }
    end
  end
end
