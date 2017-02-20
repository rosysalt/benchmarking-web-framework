Each web framework is evaluated 10 times, each time 10 second to see how many request it can handle. The starting point is in the file `simulate.sh`, the script itself will run the Ruby program to output how many requests each web framework handle per minute.

Web frameworks to test:
- [rack](https://github.com/rack/rack)
- [roda](https://github.com/jeremyevans/roda)
- [rack-app](https://github.com/rack-app/rack-app)
- [hanami-router](https://github.com/hanami/router)
- [hobbit](https://github.com/patriciomacadden/hobbit)
- [cuba](https://github.com/soveran/cuba)
- [nancy](https://github.com/guilleiguaran/nancy)

Tasks:
- Basic GET request (/books)
- Dynamic GET request (/books/:id)
- POST

All the web framework are tested against 3 tasks. And to make the result fair, each task is run 10 times for each web framework.

### Results

Text result: `plot/data`

Visualization
![alt text][viz]

[viz]: https://github.com/npxquynh/benchmarking-web-framework/blob/master/plot/throughput_webframework.png "Number of requests per second between Ruby web frameworks"

### How to run the experiment
```
sh simulation.sh
```
By the end of the experiment, there are 3 `*.txt` file created in `results/summary`. They contains statistic metrics for each web framework:

0. Average number of requests per second
0. Standard deviation
0. Max
0. Min

### Plot the result

```
gnuplot plot/plot.sh
```


### References

The majority of the code in folder `bench` is taken from [Bech Micro - by Luislavena](https://github.com/luislavena/bench-micro).
