### Key features
* PicoLisp web [framework](http://software-lab.de/doc/app.html)
* Small memory footprint
* multi directory hierarchy
* Blake2b hash for uniqueness ([monocypher](https://monocypher.org) library
via [mmap](https://en.wikipedia.org/wiki/Mmap) syscall)

### Installation
* get ready PicoLisp installation (64bit mode)
* install monocypher
```
$ ldconfig -p | grep monocypher
    libmonocypher.so.3 (libc6,x86-64) => /usr/local/lib/libmonocypher.so.3
    libmonocypher.so (libc6,x86-64) => /usr/local/lib/libmonocypher.so
```
*
