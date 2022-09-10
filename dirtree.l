(de dirpath (A B)
   (list
      (lowc (pad 2 (hex A)))
      "/"
      (lowc (pad 2 (hex B))) ) )
(ifn (argv)
   (prinl "run \"dirtree.l \<path\>\"")
   (for A (range 0 255)
      (for B (range 0 255)
         (call
            'mkdir
            '-p
            (pack (argv) "/" (dirpath A B)) ) ) ) )
(bye)
