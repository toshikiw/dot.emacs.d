(when (require 'package nil t)
  (setq package-archives 
        '(
          ("marmalade" . "http://marmalade-repo.org/packages/")
          ("ELPA" . "http://tromey.com/elpa/")
          ("GNU" . "http://elpa.gnu.org/packages/")
          ))
        ;(append (list
        ;         '("ELPA" . "http://tromey.com/elpa/")
        ;         '("marmalade" . "http://marmalade-repo.org/packages/"))
        ;        package-archives))
  (package-initialize)
)
(provide 'init_marmalade)