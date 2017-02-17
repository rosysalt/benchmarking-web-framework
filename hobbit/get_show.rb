module Benchmarker
  class GetShow < Hobbit::Base
    <<-DOC
      It's similar to nancy
    DOC

    get '/books/:id' do
      "Routing parameter = #{request.params[:id]}"
    end
  end
end
