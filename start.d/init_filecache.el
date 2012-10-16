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
(let ((prg (concat user-emacs-directory "filecachedir.sh")))
  (when (file-readable-p prg)
    ;; ディレクトリを追加
    ;; ディレクトリの更新は filecachedir.sh を使う
    (call-process prg nil nil nil "")
    (load-file "~/.emacs.d/filecachedir.el")
    (file-cache-add-directory-list
     my-filedir)
    )
  )
;(file-cache-add-directory-list
;  (list "~/work"))
;(file-cache-add-file-list
; (list "~/memo/memo.txt")) ;; ファイルを追加
;(define-key minibuffer-local-completion-map "\C-c\C-i"
;  'file-cache-minibuffer-complete)
(provide 'init_filecache)