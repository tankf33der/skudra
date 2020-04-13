(setq
   *ServRoot "http://127.0.0.1:8080/"
   *DirRoot "/home/mpech/skudra-root/" )
(de sendfile (F)
   (httpHead "text/plain; charset=utf-8")
   (ht:Out *Chunked (in (pack *DirRoot F) (echo))) )
(de fullname (F)
   (let F (chop F)
      (when (= 8 (length F))
         (pack
            (cut 2 'F)
            "/"
            (cut 2 'F)
            "/"
            F ) ) ) )
(if *Post
   NIL
   (let P (next)
      (ifn P
         (sendfile "index.txt")
         (let P (fullname P)
            (if (and P (info (pack *DirRoot P)))
               (sendfile P)
               (http404) ) ) ) ) )
