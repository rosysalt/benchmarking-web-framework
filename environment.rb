require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# TESTING_APP = 'rack'
# TESTING_APP = 'rack-app'
TESTING_APP = 'roda'
require File.join(Dir.pwd, "#{TESTING_APP}", 'application')

module Benchmarker
  class << self
    def application
      Benchmarker::Application
    end
  end
end
