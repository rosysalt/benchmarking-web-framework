require_relative '../common'

module Benchmarker
  module V0
    class GetShow < Common
      get 'books/:id' do
        "Version 0 - Routing parameter = #{params['id']}"
      end
    end
  end
end
