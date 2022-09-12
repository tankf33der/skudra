(load "@lib/http.l")
(allowed NIL "!pastebin" f)
(setq
   *ServRoot "http://pb1n.de/"
   *DirRoot "/home/mpech/skudra-root/"
   *KBLimit (* 128 1024) )
(de mmap (L F)
   (native "@" "mmap" 'N 0 L 1 2 F 0) )
(de munmap (A L)
   (native "@" "munmap" 'N A L) )
(de blake (M S)
   (use R
      (native
         "libmonocypher.so"
         "crypto_blake2b_general"
         NIL
         (cons 'R (cons (cons 3 'B 3)))
         3
         0
         0
         M
         S )
      (lowc
         (pack
            (mapcar
               '((B) (pad 2 (hex B)))
               R ) ) ) ) )
(de sendfile (F)
   (httpHead "text/plain; charset=utf-8")
   (ht:Out *Chunked (in (pack *DirRoot F) (echo))) )
(de fullname (F)
   (let F (chop F)
      (when (= 6 (length F))
         (pack
            (cut 2 'F)
            "/"
            (cut 2 'F)
            "/"
            F ) ) ) )
(de pastebin @
   (if *Post
      (let F (get 'f 'http)
         (ifn F
            (respond "Wrong\n")
            (let
               (F (tmp F)
                  S (car (info F))
                  D NIL
                  M NIL
                  H NIL )
               (if (> S *KBLimit)
                  (respond "Wrong size\n")
                  (setq
                     D (open F T)
                     M (mmap S D)
                     H (blake M S) )
                  (munmap M S)
                  (close D)
                  (unless (info (pack *DirRoot (fullname H)))
                     (call 'mv F (pack *DirRoot (fullname H))) )
                  (respond (pack *ServRoot "?" H "\n")) ) ) ) )
      (let P (next)
         (ifn P
            (sendfile "index.txt")
            (let P (fullname P)
               (if (and P (info (pack *DirRoot P)))
                  (sendfile P)
                  (http404) ) ) ) ) ) )
(server 8080 "!pastebin")
(wait)
