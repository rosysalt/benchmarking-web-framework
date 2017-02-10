# TESTING_APP = 'rack'
TESTING_APP = 'rack-app'

# require "#{TESTING_APP}/application"

require File.join(Dir.pwd, "#{TESTING_APP}", 'application')

run Application
