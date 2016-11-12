
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(provide 'my-scripts)

(defun reformat-region (&optional b e)
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
