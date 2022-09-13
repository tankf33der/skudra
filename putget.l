(load "@lib/http.l")
(de post (F)
   (in (list "curl" "--no-progress-meter" "-F" (pack "f=@" F) "pb1n.de")
      (line T) ) )
(de getLine (U)
   (let P
      (pack
         "?"
         (cadr (split (chop U) "?")) )
      (client "pb1n.de" 80 P
         (until (eof)
            (line T) ) ) ) )
(setq
   R (in "/dev/urandom" (rd 8))
   F (tmp "random") )
(out F (println R))
# Ready!
(let
   (P (post F)
      G (format (getLine P)) )
   (unless (= G (inc R))
      (mail "localhost" 25
         "mpech@envs.net"
         "mpech@envs.net"
         "putget comparison failed"
         NIL
         (prinl P G R) ) )
(msg 'ok)
(bye)
