# Kill the running puma server
# Start the benchmarking

pkill -9 -f puma
ruby ./bench/summary_speed.rb
