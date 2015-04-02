;;; package.el and use-package initialization
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(setq load-prefer-newer t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(require 'bind-key)

(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

(use-package powershell
  :commands powershell-mode
  :if (eq system-type 'windows-nt)
  :ensure t
  :mode "\\.ps1\\'")

(use-package ace-jump-mode
  :ensure t
  :bind ("C-z" . ace-jump-mode))

(use-package js2-mode
  :ensure t
  :mode ("\\.js$" . js2-mode)
  :config
  (add-hook 'js2-mode-hook (lambda ()
							 (local-set-key (kbd "C-M-a") 'js2-beginning-of-defun)
							 (local-set-key (kbd "C-M-e") 'js2-end-of-defun))))
(use-package fsharp-mode
  :ensure t
  :mode "\\.fs[iylx]?$")

;; load path
(add-to-list 'load-path "~/.emacs.d/modules")
(add-to-list 'load-path "~/.emacs.d/modules/configuration")
(add-to-list 'load-path "~/.emacs.d/modules/lang/lisp")

;; features
(require 'defuns)
(require 'recentf)
(require 'lisp-conf)
(require 'conf) ;; last

;; custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
