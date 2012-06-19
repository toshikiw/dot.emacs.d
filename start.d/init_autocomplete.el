(setq ac-dictionary-directories "~/.emacs.d/ac-dict")
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(add-to-list 'ac-dictionary-directories)
;; 自動で補完しない
(setq ac-auto-start nil)
(require 'auto-complete-config)
(ac-config-default)
;; 自動補完のキー割当て
(define-key ac-mode-map (kbd "M-/") 'auto-complete)

;; eshell setting
(require 'pcomplete)
(add-to-list 'ac-modes 'eshell-mode)
(ac-define-source pcomplete
  '((candidates . pcomplete-completions))
)
;(defun my-ac-eshell-mode ()
;  (setq ac-sources
;        '()))
(provide 'init_autocomplete)