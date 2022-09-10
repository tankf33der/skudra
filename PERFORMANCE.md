```
$ wrk -t12 -c400 -d30s http://127.0.0.1:8080/?d1e7bf
Running 30s test @ http://127.0.0.1:8080/?d0eebf
  12 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     8.30ms   69.11ms   1.89s    97.89%
    Req/Sec   760.38    611.12     4.09k    68.05%
  209216 requests in 30.06s, 44.69MB read
  Socket errors: connect 0, read 209210, write 0, timeout 34
Requests/sec:   6960.83
Transfer/sec:      1.49MB
```
