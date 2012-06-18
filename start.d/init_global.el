(setq inhibit-startup-message t)
;; バックアップファイルを作らない。
(setq make-backup-files nil)
;; TAB はスペース 4 個ぶんを基本
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; 動的略語補完dabbrev-jaのload
;(load "dabbrev-ja")

;; 矩形選択を簡単に
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; trampを有効に
(require 'tramp)
;; magitを有効に
(when mac-p
  (setq magit-git-executable "/usr/local/git/bin/git")
)
(require 'magit)
(require 'magit-svn)
(provide 'init_global)