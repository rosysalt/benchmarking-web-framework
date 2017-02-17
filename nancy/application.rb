require_relative 'books'

module Benchmarker
  class Application < Nancy::Base
    <<-DOC
      only 1 file per resources
    DOC

    map '/' do
      run Books
    end
  end
end
