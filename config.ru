require_relative 'environment'

puts ENV['RACK_ENV']
puts 'XXXXX'

run Benchmarker.application
