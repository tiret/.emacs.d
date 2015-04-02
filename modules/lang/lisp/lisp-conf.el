;; elisp
(require 'paredit)
(require 'rainbow-delimiters)
(require 'eldoc)

(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (eldoc-mode 1)
				  (paredit-mode +1)
				  (rainbow-delimiters-mode)))

(provide 'lisp-conf)
