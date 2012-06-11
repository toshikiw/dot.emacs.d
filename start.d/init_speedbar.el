(setq speedbar-use-images nil)
(setq speedbar-frame-parameters '((minibuffer)
                                  (width . 40)
                                  (border-width . 0)
                                  (menu-bar-lines . 0)
                                  (tool-bar-lines . 0)
                                  (unsplittable . t)
                                  (left-fringe . 0)))
(setq speedbar-default-position 'left-right)
(setq speedbar-hide-button-brackets-flag t)

;; 拡張子
(add-hook 'speedbar-mode-hook
          '(lambda ()
             (speedbar-add-supported-extension '("js" "as" "html" "css" "php" "properties" "rst" "org" "ml" "scala"))))
(provide 'init_speedbar)
