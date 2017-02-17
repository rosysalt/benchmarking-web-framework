require_relative 'get_index'
require_relative 'get_show'

module Benchmarker
  class Books < Hobbit::Base
    map 'books'
  end
end
