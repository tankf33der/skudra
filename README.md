### Key features
* PicoLisp web [framework](http://software-lab.de/doc/app.html)
* Small memory footprint
* multi directory hierarchy
* Limit maximum file size
* Support for texts only
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
* setup cron job to delete older pastes
```
find /home/user/skudra-root -type f -not -name "*.txt" -mtime +30 -exec rm -f {} \;
```

### Default index message
```
Welcome to pastebin service for sharing code, notes and snippets.

o) Share pastes:
// send file
$ curl -F 'f=@/etc/issue' 127.0.0.1:8080
http://127.0.0.1:8080/?116cff

// send output via pipe
$ ip a | curl -F 'f=@-;' 127.0.0.1:8080
http://127.0.0.1:8080/?02cddf

o) Pastes will be deleted via cron job monthly

o) No more features, you should definitely check similar services:
http://ix.io/
http://0x0.st/

o) Contact: mpech@envs.net
```
