require_relative '../common'

module Benchmarker
  module V0
    class GetIndex < Common
      get '/books' do
        'Version 0 - Hello World!'
      end
    end
  end
end
