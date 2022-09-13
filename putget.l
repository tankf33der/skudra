(de post (F)
   (in (list 'curl "-F" (pack "f=@" F) "pb1n.de")
   )
)

(setq
   R (in "/dev/urandom" (rd 8))
   F (tmp "random") )
(out F (println R))
(post F)
(println 'R R)


(msg 'ok)
(bye)
