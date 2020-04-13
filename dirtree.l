`(== 64 64)
(de dirpath NIL
   (glue
      ","
      (mapcar
         '((N) (lowc (pad 2 (hex N))))
         (range 0 255) ) ) )
(ifn (argv)
   (prinl "run \"dirtree.l \<path\>\"")
   (prinl (dirpath))
   (for A (range 0 255)
   #{
      (for B (range 0 255)
         #(call 'mkdir '-p (pack @ (dirpath A B)))
      )
   )
   }#
   ) # for
)
(bye)
