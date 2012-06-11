(require 'filecache)
(defun add-to-directory-list (&rest paths &optional excludes)
  (setq mylam (args body)
    `(lambda (,@args)
       (lexical-let (callee)
         (setq calle (lambda (, @args), @body))
         (funcall callee ,@argsyms)
         )
       )
    )
  (let (paths excludes))
)
;; ディレクトリを追加
;; ディレクトリの更新は filecachedir.sh を使う
(load-file "~/.emacs.d/filecachedir.el")
;(require 'filecachedir)
(file-cache-add-directory-list
 my-filedir)
;(file-cache-add-directory-list
;  (list "~/work"))
;(file-cache-add-file-list
; (list "~/memo/memo.txt")) ;; ファイルを追加
;(define-key minibuffer-local-completion-map "\C-c\C-i"
;  'file-cache-minibuffer-complete)
(provide 'init_filecache)