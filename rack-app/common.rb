module Benchmarker
  class Common < Rack::App
    after do
      puts "\nXXXX After Common XXXX\n"
      response.set_header('Content-Type', 'application/json')
    end
  end
end
