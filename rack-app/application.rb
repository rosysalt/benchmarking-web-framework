require 'rack/app'

class Application < Rack::App
  get '/' do
    'Hello World!'
  end
end
