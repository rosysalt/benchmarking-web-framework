require_relative 'support/speed_summary_table'
require_relative 'support/table_helpers'

class Experiment
  attr_reader :benchmarker_klass, :framework_name, :output_path, :prefix, :times

  def initialize(benchmarker_klass, framework_name, prefix, times = 10)
    @benchmarker_klass = benchmarker_klass
    @framework_name = framework_name
    @prefix = prefix
    @output_path = "results/#{framework_name}/#{prefix}"
    @times = times

    run
  end

  def redirect_stream(stream, path)
    old_stream = stream.dup
    stream.reopen(path)
    stream.sync = true
  yield
  ensure
    stream.reopen(old_stream)
  end

  def run
    redirect_stream(STDOUT, output_path) do
      (1..times).each do
        ENV['TESTING_APP'] = framework_name.to_s
        app = File.join(Dir.pwd, 'config.ru')
        benchmarker_klass.new(app).run
      end
    end

    content = %x(egrep '\\*|Request' "#{output_path}")

    summary_table = SpeedSummaryTable.new(content)

    # write raw experiment results
    File.open("#{output_path}_summary.md", 'w') do |f|
      f.puts summary_table.render_markdown
    end

    # calculate statistical metrics for all the repetitions
    puts summary_table.render_statistical_metrics
    summary_output_path = "results/#{framework_name}/#{prefix}.stat"

    File.open(summary_output_path, 'w') do |f|
      f.puts summary_table.render_statistical_metrics
    end

    # append to summary file
    summary_for_all_output_path = "results/summary/#{prefix}.txt"
    File.open(summary_for_all_output_path, 'a') do |f|
      f.puts "#{framework_name}\t#{summary_table.statistical_metrics_table}"
    end
  end
end
