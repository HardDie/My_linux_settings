
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(provide 'my-scripts)

(defun reformat-region (&optional b e)
	"Reformat region on Google style"
    (interactive "r")
    (when (not (buffer-file-name))
      (error "A buffer must be associated with a file in order to use REFORMAT-REGION."))
    (when (not (executable-find "clang-format"))
      (error "clang-format not found."))
    (shell-command-on-region b e
                                                "clang-format -style=Google"
                                                (current-buffer) t)
    (indent-region b e)
    )

(defun my-c-mode-font-lock-if0 (limit)
	(save-restriction
		(widen)
		(save-excursion
			(goto-char (point-min))
			(let ((depth 0) str start start-depth)
				(while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
					(setq str (match-string 1))
					(if (string= str "if")
						(progn
							(setq depth (1+ depth))
							(when (and (null start) (looking-at "\\s-+0"))
								(setq start (match-end 0)
									  start-depth depth)))
						(when (and start (= depth start-depth))
							(c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
							(setq start nil))
						(when (string= str "endif")
							(setq depth (1- depth)))))
				(when (and start (> depth 0))
					(c-put-font-lock-face start (point) 'font-lock-comment-face)))))
	nil)
(defun my-c-mode-common-hook ()
	(font-lock-add-keywords
	 nil
	 '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))
