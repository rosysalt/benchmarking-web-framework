module Benchmarker
  class Get < Roda
    route do |r|
      r.get 'books' do
        'Hello World!'
      end

      r.get 'books', :id do |id|
        "Routing parameter = #{id}"
      end
    end
  end
end
