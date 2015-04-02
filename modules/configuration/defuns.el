;; Defuns
(defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

(defvar current-font-size 120)
(defun decrease-font-size()
  (interactive)
  (setq current-font-size (- current-font-size 10))
  (set-face-attribute 'default nil :height current-font-size))

(defun increase-font-size()
  (interactive)
  (setq current-font-size (+ current-font-size 10))
  (set-face-attribute 'default nil :height current-font-size))

(defun back-to-indentation-or-beginning ()
   (interactive)
   (if (= (point) (save-excursion (back-to-indentation) (point)))
       (beginning-of-line)
     (back-to-indentation)))

(defun set-newline-and-indent ()
	(local-set-key (kbd "RET") 'newline-and-indent))

(defun region-marked-p ()
      (and transient-mark-mode mark-active))

(defun my-upcase ()
 (interactive)
 (if (region-marked-p) (upcase-region (region-beginning) (region-end)) (upcase-word 1)))
     
(defun my-downcase ()
  (interactive)
  (if (region-marked-p) (downcase-region (region-beginning) (region-end)) (downcase-word 1)))
     
(defun my-capitalize ()
  (interactive)
  (if (region-marked-p)
      (save-excursion
	(let ((beg (region-beginning))
	      (end (region-end)))
	  (goto-char beg)
	  (while (< (point) end)
	    (capitalize-word 1))))
    (capitalize-word 1)))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun bg/fix-dot ()
  "Function which substitutes a hyphen with a dot, to facilitate completion"
  (interactive)
  (let ((bound (save-excursion
				 (back-to-indentation-or-beginning)
				 (point))))
	(search-backward "-" bound t)
	(delete-char 1)
	(insert ".")
	(move-end-of-line nil)))

(provide 'defuns)
