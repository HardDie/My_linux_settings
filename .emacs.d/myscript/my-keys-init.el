;; Add undo and redo tree
(require 'undo-tree)

;; HotKey
(defun my-keys-add-hotkey ()

	(add-to-list 'my-keys-list '("M-I" scroll-down))
	(add-to-list 'my-keys-list '("M-K" scroll-up))
	(add-to-list 'my-keys-list '("M-J" move-beginning-of-line))
	(add-to-list 'my-keys-list '("M-L" move-end-of-line))

	(add-to-list 'my-keys-list '("M-i" previous-line))
	(add-to-list 'my-keys-list '("M-k" next-line))
	(add-to-list 'my-keys-list '("M-j" backward-char))
	(add-to-list 'my-keys-list '("M-l" forward-char))

	(add-to-list 'my-keys-list '("M-o" forward-word))
	(add-to-list 'my-keys-list '("M-u" backward-word))
	(add-to-list 'my-keys-list '("M-O" forward-paragraph))
	(add-to-list 'my-keys-list '("M-U" backward-paragraph))

	(add-to-list 'my-keys-list '("M-h" move-beginning-of-line))
	(add-to-list 'my-keys-list '("M-H" move-end-of-line))

	(add-to-list 'my-keys-list '("M-n" beginning-of-buffer))
	(add-to-list 'my-keys-list '("M-N" end-of-buffer))

	(add-to-list 'my-keys-list '("M-2" delete-window))
	(add-to-list 'my-keys-list '("M-3" zoom-window-zoom))
	(add-to-list 'my-keys-list '("M-#" delete-other-windows))
	(add-to-list 'my-keys-list '("M-4" split-window-right))
	(add-to-list 'my-keys-list '("M-$" split-window-below))
	(add-to-list 'my-keys-list '("M-s" other-window))
	(add-to-list 'my-keys-list '("C-w" kill-buffer))

	(add-to-list 'my-keys-list '("C-M-j" shrink-window-horizontally))
	(add-to-list 'my-keys-list '("C-M-l" enlarge-window-horizontally))
	(add-to-list 'my-keys-list '("C-M-k" shrink-window))
	(add-to-list 'my-keys-list '("C-M-i" enlarge-window))

	(add-to-list 'my-keys-list '("M-f" delete-char))
	(add-to-list 'my-keys-list '("M-d" delete-backward-char))

	(add-to-list 'my-keys-list '("C-c C-c" kill-ring-save))
	(add-to-list 'my-keys-list '("C-v" yank))
	(add-to-list 'my-keys-list '("C-S-v" yank-pop))
	(add-to-list 'my-keys-list '("C-x C-x" kill-region))
	(add-to-list 'my-keys-list '("C-a" mark-whole-buffer))

	(add-to-list 'my-keys-list '("C-r" revert-buffer))
	(add-to-list 'my-keys-list '("C-z" undo-tree-undo))		;; Required undo-tree package
	(add-to-list 'my-keys-list '("C-S-z" undo-tree-redo))		;; Required undo-tree package
	(add-to-list 'my-keys-list '("M-/" undo-tree-visualize))

	(add-to-list 'my-keys-list '("C-o" find-file))
	(add-to-list 'my-keys-list '("C-s" save-buffer))
	(add-to-list 'my-keys-list '("C-S-s" write-file))

	(add-to-list 'my-keys-list '("M-a" execute-extended-command))

	(add-to-list 'my-keys-list '("C-f" projectile-find-file))
	(add-to-list 'my-keys-list '("C-S-f" projectile-grep))

	(add-to-list 'my-keys-list '("C-l" goto-line))
	(add-to-list 'my-keys-list '("M-y" isearch-forward))
	(add-to-list 'my-keys-list '("M-Y" isearch-backward))

	(add-to-list 'my-keys-list '("M-r" kill-word))
	(add-to-list 'my-keys-list '("M-e" backward-kill-word))
	(add-to-list 'my-keys-list '("M-g" kill-line))
	(add-to-list 'my-keys-list '("M-G" backward-kill-line))

	(add-to-list 'my-keys-list '("<C-iso-lefttab>" next-buffer))
	(add-to-list 'my-keys-list '("C-<tab>" previous-buffer))

;	(add-to-list 'my-keys-list '("M-C-x" eval-last-sexp))
;	(add-to-list 'my-keys-list '("M-<f4>" save-buffers-kill-terminal))

	(add-to-list 'my-keys-list '("C-b" bookmark-set))
	(add-to-list 'my-keys-list '("M-b" bookmark-jump))
	(add-to-list 'my-keys-list '("<f4>" bookmark-bmenu-list))

	(add-to-list 'my-keys-list '("C-;" comment-kill))

	(add-to-list 'my-keys-list '("C-n" next-history-element))
	(add-to-list 'my-keys-list '("C-p" previous-history-element))

	(add-to-list 'my-keys-list '("C-c p R" projectile-regenerate-tags))
	(add-to-list 'my-keys-list '("M->" pop-tag-mark))
	(add-to-list 'my-keys-list '("C-q" exchange-point-and-mark))
	(add-to-list 'my-keys-list '("C-`" quoted-insert))
)

;; Hook for search mode
(defun isearch-keybindings (my-key-map)
	(define-key my-key-map (kbd "M-y") 'isearch-repeat-forward)
	(define-key my-key-map (kbd "M-Y") 'isearch-repeat-backward))
(add-hook 'isearch-mode-hook (lambda () (isearch-keybindings isearch-mode-map)))

(provide 'my-keys-init)
