;; anything
(when (require 'anything-config nil t)
  ;(require 'anything-startup)
  (global-set-key (kbd "C-;") 'anything)
  (setq anything-sources
        '(
          anything-c-source-buffers
          anything-c-source-files-in-current-dir
          anything-c-source-file-name-history
          anything-c-source-filelist
          anything-c-source-locate
          anything-c-source-file-cache
          anything-c-source-bookmarks
          anything-c-source-emacs-commands
          )
        )
  ;; recentf
  (require 'recentf)
  (setq recentf-max-saved-items 1000)
  (recentf-mode 1)
  ;; locate db
  (let ((locatedb (concat (getenv "HOME") "/Library/Caches/com.apple.locate.db")))
    (when (file-readable-p locatedb)
      (setenv "LOCATE_PATH" locatedb)
      )
    )
)
(provide 'init_anything)