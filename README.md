# dot.emacs.d

.emacs.d をgithub化してみたので説明を追加
基本的に個人用です。

## ディレクトリ構造

* init.el
  emacs初期化ファイル
* lisp
  手動インストールされたelisp置き場
  (レポジトリ外)
* elpa
  [Marmalade](http://marmalade-repo.org/)からインストールされたelisp置き場
  (レポジトリ外)
* start.d
  init.elから読み込まれる各種設定ファイル置き場

## 手動インストールしたelisp
随時更新(するかも...)

* cedet
* hi-list.el
* ispell.el
* package.el
* color-theme
* elib
* dabbrev-ja.el
* emacs-w3m
* html-helper-mode
* jdee
* ddskk

## package install(elpa)
多分更新しない...

* anything-1.287
* anything-config-0.4.1
* auto-complete-1.4
* clojure-mode-1.11.5
* concurrent-0.3.1
* ctable-0.1.0
* deferred-0.3.1
* edbi-0.1.0
* epc-0.1.0
* php-mode-1.5.0
* popup-0.5
* rw-hunspell-0.2
* rw-ispell-0.1
* rw-language-and-country-codes-0.1
* session-2.2.1
* slime-20100404.1
* slime-repl-20100404

## elispメモ
備忘録

### JDEEのbeanshellについて

Macの場合、tools.jarが存在しないため、bshを利用できない
[JDEEの導入](http://sakito.jp/moin/moin.cgi/JDEE#head-0c1a99961fd1e040c94b8f82d3394f0ed869c8c0)を見てjde-get-tools-jarを修正する

一部転記
> 修正は、jde/lisp/jde.elのjde-get-tools-jarの中(366行目)の"Classes/classes.jarを
> 
> <pre>/System/Library/Frameworks/JavaVM.framework/Versions/1.3.1/Classes/classes.jar</pre>
> 
> のように書きかえておきます。 
