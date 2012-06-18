;; 常に履歴を保存
(setq eshell-ask-to-save-history 'always)
;; 履歴の重複を削除
(setq eshell-hist-ignoredups t)
;; elisp と同じコマンドがある場合 elispのコマンドを実行
(setq eshell-prefer-lisp-functions t)
(define-key global-map (kbd "C-z") 'eshell)
;; M-r でインクリメンタルサーチ
(add-hook 'eshell-mode-hook
          '(lambda ()
             (define-key eshell-mode-map (kbd "M-r") 'eshell-isearch-backward))
)
(provide 'init_eshell)