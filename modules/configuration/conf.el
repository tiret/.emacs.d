;;; Echo unfinished commands after 0.1 seconds
(setq echo-keystrokes 0.1)

;;; Easily navigate Pascalcase words
(global-subword-mode)

;;; Turn off scrollbars
(scroll-bar-mode -1)

;; get rid of default vc
;; (delete 'Git vc-handled-backends)

;; recentf
;; Maintain a list of recent files. C-x C-r to open from that list
(recentf-mode t)
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;; END recentf

;; Various settings
(blink-cursor-mode nil)
(show-paren-mode 1)
(setq disabled-command-function nil)

;; Don't record sessions
(setq auto-save-list-file-prefix nil)

;; Autosave cleanup
(setq delete-auto-save-files t)
;; No backup
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq undo-no-redo t)
(setq debug-on-error t)
(setq inhibit-startup-screen t)
;; No beep
(setq visible-bell t)
;; tooltips and menubar off
(tooltip-mode -1)

;; Keys
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-d") 'delete-region)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)
(global-set-key (kbd "M-u") 'my-upcase)
(global-set-key (kbd "M-l") 'my-downcase)
(global-set-key (kbd "M-c") 'my-capitalize)
(global-set-key (kbd "C-M-\\") 'indent-region)
(global-set-key (kbd "C-;") 'comment-region)
(global-set-key (kbd "C-M-;") 'uncomment-region)
(global-set-key "\C-ci" 'ido-goto-symbol)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)
(global-set-key (kbd "C-\\") 'undo-tree-redo)

;; Shorter yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode nil)

;; default directory
(setq default-directory (substitute-in-file-name "$HOME"))

;; Show line numbers
(global-linum-mode 1)

;; Aliases
(defalias 'rg 'rgrep)
(defalias 'rr 'query-replace-regexp)
(defalias 'z 'zap-to-char)
(defalias '.r 'point-to-register)
(defalias 'j 'jump-to-register)

(add-hook 'sgml-mode-hook (lambda ()
							(zencoding-mode)
							(substitute-key-definition 'zencoding-expand-line 'newline-and-indent zencoding-mode-keymap)
							(local-set-key (kbd "C-t") 'zencoding-expand-line)))

(provide 'conf)
