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
* select directory root
```
$ pil dirtree.lv /home/user/skudra-root
```
* modify *ServRoot, *DirRoot and *KBLimit as file size limit in [pastebin.l](pastebin.l)
* modify index.txt if you want, copy it to *DirRoot
* you could choose run nginx before pil
* start PicoLisp
```
$ nohup pil @lib/http.l @lib/xhtml.l @lib/form.l --server 8080 pastebin.l &
[1] 618124
```
* to kill daemon
```
$ killall picolisp
```
* setup cron job to delete older pastes
```
find /home/user/skudra-root -type f -mtime +30 -exec rm -f {} \;
```
