(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(setq history-length 4000) ;; そもそものミニバッファ履歴リストの最大長
(setq session-initialize '(de-saveplace session keys menus places)
      session-globals-include '((kill-ring 500)             ;; kill-ring の保存件数
                                (session-file-alist 50 t)   ;; カーソル位置を保存する件数
                                (file-name-history 2000)))  ;; ファイルを開いた履歴を保存する件数

;; minibuffer history から重複を排除する
(defun minibuffer-delete-duplicate ()
  (let (list)
    (dolist (elt (symbol-value minibuffer-history-variable))
      (unless (member elt list)
        (push elt list)))
    (set minibuffer-history-variable (nreverse list))))
(add-hook 'minibuffer-setup-hook 'minibuffer-delete-duplicate)

;; kill-ring 内の重複を排除する
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))

;; バッファでの同名ファイルに識別子を付与する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; バッファ名が重複しなくてもディレクトリ名を付与する
(setq uniquify-min-dir-content 2)
;; uniquify-ignore-buffers-re を設定すると対象外のバッファを指定できるがデフォルトで特殊バッファは基本よける
(provide 'init_session)