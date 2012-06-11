(require 'tempo)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist 
      (append 
       '(
         ("\\.html$" . html-helper-mode)
         ("\\.tpl$" . html-helper-mode)
         ) auto-mode-alist)
)
(add-hook 'html-helper-mode-hook
          (lambda ()
            (mapcar 
             (function (lambda (l) (define-key html-helper-mode-map (car l) (nth 1 l))))
             '(
               ("\M-\C-f" forward-sexp)
               ("\M-\C-b" backward-sexp)
               )))
)

(provide 'init_html_helper)