require_relative 'support/benchmarker'
require_relative 'support/speed_summary_table'

def redirect_stream(stream, path)
  old_stream = stream.dup
  stream.reopen(path)
  stream.sync = true
  yield
ensure
  stream.reopen(old_stream)
end

redirect_stream(STDOUT, 'test.log') do
  ENV['TESTING_APP'] = 'hobbit'

  APPS = %i(hobbit rack-app cuba roda rack hanami-router nancy)

  APPS.each do |app|
    app = File.join(Dir.pwd, 'config.ru')
    Benchmarker.new(app).run
  end
end

content = %x(egrep '\\*|Request' test.log)

summary_table = SpeedSummaryTable.new(content)
File.open('results/speed.md', 'w') do |f|
  f.puts summary_table.render_markdown
end
puts summary_table.render
summary_table.replace_readme('speed_table')
