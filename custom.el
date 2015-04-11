(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wombat)))
 '(delete-selection-mode t)
 '(dired-auto-revert-buffer (quote dired-directory-changed-p))
 '(dired-isearch-filenames (quote dwim))
 '(dired-listing-switches "-alGh --group-directories-first")
 '(dired-recursive-copies (quote always))
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-enable-regexp t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote emacs-lisp-mode))
 '(initial-scratch-message "")
 '(ispell-check-comments (quote exclusive))
 '(ispell-dictionary "british")
 '(kill-do-not-save-duplicates t)
 '(kill-whole-line t)
 '(mark-even-if-inactive t)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(tab-width 4)
 '(track-eol t)
 '(word-wrap t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 130 :family "Source Code Pro"))))
 '(isearch ((t (:background "dark orange" :foreground "white"))))
 '(isearch-fail ((t (:background "red" :foreground "white"))))
 '(lazy-highlight ((t (:background "gold"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "steel blue"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "pale goldenrod"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "turquoise"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "salmon"))))
 '(ruler-mode-comment-column ((t (:inherit ruler-mode-default :foreground "black"))) t)
 '(ruler-mode-current-column ((t (:inherit ruler-mode-default :foreground "black" :weight bold))) t)
 '(ruler-mode-default ((t (:inherit default :background "gray93" :foreground "grey64" :box (:line-width 1 :color "grey76" :style released-button)))) t)
 '(ruler-mode-fill-column ((t (:inherit ruler-mode-default :foreground "black"))) t)
 '(ruler-mode-pad ((t (:inherit ruler-mode-default :background "grey93"))) t))
