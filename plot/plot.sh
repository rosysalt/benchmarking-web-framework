set terminal png # pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 500, 350
set output 'plot/throughput_webframework.png'
set boxwidth 0.5
set style fill solid
set style histogram errorbars gap 2 lw 1
set style data histograms

set yrange [0:12000]
set xtics rotate by -45

set title "Average number of requests per second"
set xlabel "Ruby web frameworks"

plot 'plot/data/get.txt' using 2:3:xtic(1) ti "GET (books)" linestyle 1, \
     'plot/data/get_dynamic.txt' using 2:3:xtic(1) ti "GET Dynamic (books/:id)" linestyle 2, \
     'plot/data/post.txt' using 2:3:xtic(1) ti "POST (books)" linestyle 3
