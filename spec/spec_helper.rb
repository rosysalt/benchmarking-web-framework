require 'webmock/rspec'
ENV['RACK_ENV'] ||= 'test'

require File.join(Dir.pwd, 'environment')

def app
  Benchmarker.application
end

RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Rack::Test::Methods, type: :request
end
