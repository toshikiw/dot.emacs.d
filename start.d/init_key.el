(when mac-p
  ;; http://macemacsjp.sourceforge.jp/index.php?CocoaEmacs#fc72ad9e
  ;; システムへ修飾キーを渡さない
  (setq mac-pass-control-to-system nil)
  (setq mac-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)

  ;; metaキーの変更
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  ;; フレーム移動をCommand-`に設定
  (global-set-key (kbd "M-`") 'other-frame)
  ;; ドラッグ&ドロップでファイルを開く
  (define-key global-map [ns-drag-file] 'ns-find-file)
)
(provide 'init_key)