(setq default-frame-alist
      (append (list
               '(width . 306)
               '(height . 76)
               '(top . 90)
               '(left . 60)
               )
              default-frame-alist))
;; 行番号をモードラインに表示
(line-number-mode t)
;; モードラインに列番号表示
(column-number-mode t)
;; モードラインのカスタマイズ 全体行数(行数,カラム数)
(setq my-mode-line-format "%d")
(if size-indication-mode
    (setq my-mode-line-format (concat my-mode-line-format " of %%I")))
(cond ((and (eq line-number-mode t) (eq column-number-mode t))
       (setq my-mode-line-format (concat my-mode-line-format "(%%l,%%c)")))
      ((eq line-number-mode t)
       (setq my-mode-line-format (concat my-mode-line-format "L%%l")))
      ((eq column-number-mode t)
       (setq my-mode-line-format (concat my-mode-line-format "C%%c")))
)
(setq mode-line-position
      '(:eval (format my-mode-line-format
                      (count-lines (point-max) (point-min))))
)

;; モードラインにディレクトリ名を表示
(let ((ls (member 'mode-line-modes
                  mode-line-format)))
  (setcdr ls
          (cons '(:eval (concat " ("
                                (abbreviate-file-name default-directory)
                                ")"))
                (cdr ls))))
;; 行番号を表示
(global-linum-mode t)
;; 垂直スクロール用のスクロールバーを付けない
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
;; 背景の透過
(add-to-list 'default-frame-alist '(alpha . (88 70)))
(when mac-p
  ;; http://macemacsjp.sourceforge.jp/index.php?MacFontSetting
;  (create-fontset-from-ascii-font "Menlo-10:weight=normal:slant=normal" nil "menlokakugo")
;  (set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
;  (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
;  (setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0)))
  (create-fontset-from-ascii-font "Menlo-9:weight=normal:slant=normal" nil "menloosaka")
  (set-fontset-font "fontset-menloosaka" 'unicode (font-spec :family "OsakaMono" ) nil 'append)
  (add-to-list 'default-frame-alist '(font . "fontset-menloosaka"))
  (setq face-font-rescale-alist '((".*Osaka.*" . 1.2) (".*Menlo.*" . 1.0)))
  (setq mac-allow-anti-aliasing t)

  ;; カーソル行をハイライト
  (defface hlline-face
    '((((class color)
        (background dark))
       (:background "LightSkyBlue4"))
      (((class color)
        (background light))
       (:background "ForestGreen"))
      (t ()))
    "*Face used by hl-line.")
  (setq hl-line-face 'hlline-face)
  (global-hl-line-mode)
)
(setq color-theme-load-all-themes nil)
(setq color-theme-libraries nil)
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (require 'color-theme-gray30)
     (color-theme-gray30)
     ))
(provide 'init_color)
