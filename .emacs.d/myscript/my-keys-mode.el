(setq my-keys-list nil)

(require 'my-keys-init)
(my-keys-add-hotkey)

(defvar my-keys-mode-map (make-sparse-keymap))

(define-minor-mode my-keys-mode
  "my-keys-mode"
  :lighter " my-keys"
  my-keys-mode-map)

(defadvice load (after my-keys-keybindings-priority)
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-mode))
      (let ((my-keys (assq 'my-keys-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist my-keys))))
(ad-activate 'load)

(defun turn-on-my-keys-mode ()
  (interactive)
  (my-keys-mode t))

(defun turn-off-my-keys-mode ()
  (interactive)
  (my-keys-mode -1))

(define-globalized-minor-mode global-my-keys-mode my-keys-mode turn-on-my-keys-mode)

(defun my-keys-hotheys (map)
  (dolist (k my-keys-list)
    (when k
      (let ((key (kbd (car k)))
            (func (car (cdr k))))
        (define-key map key func)
        (global-set-key key func)))))

(defun my-keys-mode-init ()
  (add-hook 'minibuffer-setup-hook 'turn-off-my-keys-mode)
  (my-keys-hotheys my-keys-mode-map)
  (global-my-keys-mode))
  
(provide 'my-keys-mode)
