;; Added Package.el.  This must come before configurations of
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" default)))
 '(package-selected-packages
   (quote
	(diff-hl lua-mode smart-mode-line-powerline-theme yasnippet zoom-window airline-themes powerline auto-complete-c-headers auto-complete projectile sr-speedbar color-theme yafolding persistent-soft undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Add path
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/myscript")

;; Init my settings
(require 'my-scripts)
(require 'my-settings)

;; Add my hotkey
(require 'my-keys-mode)
(my-keys-mode-init)

(put 'erase-buffer 'disabled nil)
