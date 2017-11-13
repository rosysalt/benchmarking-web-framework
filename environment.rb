require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# TESTING_APP = 'rack'
# TESTING_APP = 'rack-app'
# TESTING_APP = 'roda'
# TESTING_APP = 'cuba'
# TESTING_APP = 'hanami-router'
TESTING_APP ||= ENV['TESTING_APP'] || 'rails'

puts '==============='
puts "Running #{TESTING_APP}"
puts '==============='

require File.join(Dir.pwd, "#{TESTING_APP}", 'application')

module Benchmarker
  class << self
    def application
      Benchmarker::Application
    end
  end
end
