
;; get rid of default vc
;; (delete 'Git vc-handled-backends)

;; recentf
;; Maintain a list of recent files. C-x C-r to open from that list
(recentf-mode t)
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
;;; Echo unfinished commands after 0.1 seconds
(setq echo-keystrokes 0.1)
;;; Easily navigate Pascalcase words
(global-subword-mode)
;;; Turn off scrollbars
(scroll-bar-mode -1)
;; tooltips and menubar off
(tooltip-mode -1)
(tool-bar-mode -1)
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
;; Shorter yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)
;; Show line numbers
(global-linum-mode 1)

;; Keys
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-d") 'delete-region)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-\\") 'indent-region)
(global-set-key (kbd "C-;") 'comment-region)
(global-set-key (kbd "C-M-;") 'uncomment-region)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)


;; default directory
(setq default-directory (substitute-in-file-name "$HOME"))


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
