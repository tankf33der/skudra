### Key features
* PicoLisp web [framework](http://software-lab.de/doc/app.html)
* Small memory footprint
* Multi directory hierarchy
* Limit maximum file size
* Supports for texts only
* Replaces older notes automatically, no collisions
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
* select directory root
```
$ pil dirtree.l /home/user/skudra-root
```
* modify *ServRoot, *DirRoot and *KBLimit as file size limit in [pastebin.l](pastebin.l)
* port number of (server) call as last line of pastebin.l should be equal to *ServRoot's port
* modify index.txt if you want, copy it to *DirRoot
* you could choose run nginx before pil
* start PicoLisp manually or setup [runit](http://smarden.org/runit/) or systemd
```
$ nohup pil /home/user/skudra/pastebin.l > /dev/null &
[1] 618124
```
* to kill daemon
```
$ killall picolisp
```
### Default index message
```
Welcome to pastebin service for sharing code, notes and snippets.

# send file
$ curl -F f=@/etc/issue pb1n.de
http://pb1n.de/?116cff

# send output via pipe
$ ip a | curl -F 'f=@-;' pb1n.de
http://pb1n.de/?02cddf

Max file size is 128KB
```
