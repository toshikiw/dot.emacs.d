(load-file (concat user-emacs-directory "lisp/cedet-1.1/common/cedet.el"))

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)
(defvar jde-interactive-make-arg-history ())
(setq jde-jdk "/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents")
(require 'jde)
(load-file (concat user-emacs-directory "lisp/jdee/lisp/jde-autoload.el"))
(autoload 'jde-mode "jde" "Java Development Environment for Emacs" t)
(setq auto-mode-alist (cons '("\.java$" . jde-mode) auto-mode-alist))

;;; hook
(add-hook 'jde-mode-hook
          '(lambda ()
             (setq fill-column 85)
             (auto-fill-mode t)
             (c-set-style "java")
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'topmost-intro-cont 0) ; アノテーションでの改行
             ; for Maven
             ;; compilationでエラーにリンクを貼るためにcompilation-error-regexp-alistにMavenの出力用の正規表現を追加している。
             (add-to-list 'compilation-error-regexp-alist
                          '("\\(/.+\\):\\[\\([0-9]+\\),\\([0-9]+\\)] .*" 1 2 3))
             ))

;; custom variables
(setq compilation-window-height 8)
(setq bsh-vm-args '("-Duser.language=en"))
(setq jde-find-file-regexp '("*.java" "*.jsp" "*.tag" "*.xml" "*.properties")) ; jde-findで対象にするファイルの正規表現
;; Ant
(setq jde-build-function '(jde-ant-build)) ; ビルドにantを利用する
(setq jde-ant-read-target t) ; targetを問い合わせる
(setq jde-ant-enable-find t) ; antに-findオプションを指定する
;; code
(setq jde-import-auto-sort t)
(setq jde-wiz-get-set-variable-prefix "") ; Getter/Setterの引数プレフィックス
(setq jde-wiz-get-javadoc-template '("/**" "* %nを返します。" "* @return %nの値" "*/"))
(setq jde-wiz-set-javadoc-template '("/**" "* %nを設定します。" "* @param %p 設定する値" "*/"))
;;; custom functions
(defun jde-epn-get-simple-class-name ()
  "カレントバッファの単純クラス名を返します。"
  (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
(defun jde-epn-get-class-name ()
  "カレントバッファの完全修飾クラス名を返します。"
  (concat (jde-parse-get-package-name) "." (jde-epn-get-simple-class-name)))
(defun jde-epn-toggle-main-test ()
  "メインクラスとテストクラスのソースを切り替えます。"
  (interactive)
  (let* ((cname
          (jde-epn-get-class-name))
         (tname
          (if (string= (substring cname -4) "Test")
              (substring cname 0 -4)
            (concat cname "Test"))))
    (condition-case err
        (let ((tfile
               (jde-find-class-source-file tname)))
          (find-file tfile))
      (error (message "Could not find source file for \"%s\" in this project's source path." tname)))))
(defun jde-epn-organize-imports ()
  "必要なimport文の追加と不必要なimport文の削除を行います。"
  (interactive)
  (jde-import-all)
  (jde-import-kill-extra-imports))
(defun jde-epn-toggle-method-body ()
  "メソッドのボディ部の表示/非表示を切り替える。"
  (interactive)
  (if selective-display
      (set-selective-display nil)
    (set-selective-display 5)))
(defun jde-epn-list-class-methods ()
  "メソッドの一覧を表示(検索)"
  (interactive)
  (let ((list-matching-lines-face nil))
  (occur "\\s-\\{4\\}\\(\\(public\\)\\|\\(protected\\)\\|\\(private\\)\\)[^=;]+(")))

(require 'generic-x)
(add-to-list 'auto-mode-alist '("\\.properties\\'" . java-properties-generic-mode))
(provide 'init_jdee)
