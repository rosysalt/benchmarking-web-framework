require_relative 'support/benchmarker'
require_relative 'single_experiment'

require 'fileutils'

FRAMEWORKS = %i(cuba grape rails hanami-router hobbit nancy rack rack-app roda)

# Create directory if not existed
FRAMEWORKS.each do |fw|
  directory = File.join('results', fw.to_s)
  unless File.directory?(directory)
    Dir.mkdir(directory)
  end
end

# Copy old result to a safer place
Dir.glob('results/summary/*.txt').each do |f|
  new_path = File.join('results', 'summary', 'old', File.basename(f))
  File.rename(f, new_path)

  File.delete(f) if File.exists?(f)
end

# Run the experiment
class BenchmarkerGet < Benchmarker
  def wrk_command
    "wrk --threads 2 --duration 1 http://localhost:9292/books"
  end
end

class BenchmarkerGetDynamic < Benchmarker
  def wrk_command
    "wrk --threads 2 --duration 1 http://localhost:9292/books/3"
  end
end

class BenchmarkerPost < Benchmarker
  def wrk_command
    "wrk --threads 2 --duration 1 -s ./scripts/post.lua http://localhost:9292/books"
  end
end

FRAMEWORKS.each do |app|
  Experiment.new(BenchmarkerGet, app, "get")
  Experiment.new(BenchmarkerGetDynamic, app, "get_dynamic")
  Experiment.new(BenchmarkerPost, app, "post")
end

# Copy the experiment result to plot directory for visualization
Dir.glob('results/summary/*.txt').each do |f|
  new_path = File.join('plot', 'data', File.basename(f))
  puts new_path
  FileUtils.copy(f, new_path)
end
