;; Add required path
(add-to-list 'package-archives '("melpa0" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa1" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa2" . "https://stable.melpa.org/packages/") t)

;; Disable tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Tab 4 symbol
(defun my:indent-tabs ()
    (setq-default indent-tabs-mode t)
    (setq-default tab-width 4)
    (setq-default c-basic-offset 4)
    (setq-default standart-indent    4)
    (setq-default lisp-body-indent   4)
    (setq lisp-indent-function  'common-lisp-indent-function)
	(setq-default indent-tabs-mode t)
)
(add-hook 'c++-mode-hook 'my:indent-tabs)
(add-hook 'c-mode-hook 'my:indent-tabs)
(add-hook 'js-mode-hook 'my:indent-tabs)
(add-hook 'lua-mode-hook 'my:indent-tabs)

(defun my:indent-tabs-html ()
    (setq-default indent-tabs-mode t)
    (setq-default tab-width 2)
    (setq-default c-basic-offset 2)
    (setq-default standart-indent    2)
    (setq-default lisp-body-indent   2)
    (setq lisp-indent-function  'common-lisp-indent-function)
	(setq-default indent-tabs-mode t)
)
(add-hook 'html-mode-hook 'my:indent-tabs-html)

;; Delete full string instance
(setq kill-whole-line t)

;; Disable autosave
(setq make-backup-files        nil);
(setq auto-save-list-file-name nil);
(setq auto-save-default        nil);

;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк


;; Enable sr-speedbar
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)		;; Required sr-speedbar package

;; Enable show only file buffer
(require 'bs)
(setq bs-configurations
      '(("files" "*scratch*\\|*shell*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))
(global-set-key (kbd "M-q") 'bs-show)

;; Enable color scheme
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-hober)


;; Set font
(add-to-list 'default-frame-alist '(font . "Hack-14"))
(set-default-font "Hack-14")

;; Enable CUA
;(cua-mode t)
;(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;(transient-mark-mode 1)               ;; No region when it is not highlighted
;(setq cua-keep-region-after-copy t)

;; Show-paren-mode settings
(show-paren-mode t)                 ;; включить выделение выражений между {},[],()
(setq show-paren-style 'mixed)      ;; выделить цветом выражения между {},[],()

;; Delete selection
(delete-selection-mode t)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode     -1) ;; отключаем графическое меню
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

;; Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева

;; Display file size/time in mode-line
;(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
;(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах

;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; Yafolding
(defvar yafolding-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<C-S-return>") 'yafolding-hide-parent-element)
    (define-key map (kbd "<C-M-return>") 'yafolding-toggle-all)
    (define-key map (kbd "<C-return>") 'yafolding-toggle-element)
    map))
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

;; Imenu
;(require 'imenu)
;(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
;(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
;(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu на F6

;; Save session
;(desktop-save-mode t)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.8")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8/backward")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include")
)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; On semantic mode
;; (semantic-mode 1)
;; (defun my:add-semantic-to-autocomplete() 
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;; )
;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; (global-ede-mode 1)
;; ;(ede-cpp-root-project "my project" :file "~/cpp_proj/main.cpp" :include-path '("/src"))
;; (global-semantic-idle-scheduler-mode 1)

;; For whitespace-mode
(setq whitespace-style '(face trailing tabs spaces lines newline empty
                         space-mark tab-mark newline-mark))
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (space-mark 160 [164] [95])
        (newline-mark 10 [182 10])
        (tab-mark 9 [187 9] [92 9])))

(provide 'my-settings)

;; For working tags
(setq projectile-tags-command "ctags -Re -f \"%s\" %s")

;; Powerline
(require 'airline-themes)
(load-theme 'airline-dark)
(setq powerline-default-separator 'slant)

(setq powerline-utf-8-separator-left        #xe0b0
      powerline-utf-8-separator-right       #xe0b2
      airline-utf-glyph-separator-left      #xe0b0 
      airline-utf-glyph-separator-right     #xe0b2
      airline-utf-glyph-subseparator-left   #xe0b1
      airline-utf-glyph-subseparator-right  #xe0b3
      airline-utf-glyph-branch              #xe0a0
      airline-utf-glyph-readonly            #xe0a2
      airline-utf-glyph-linenumber          #xe0a1)

;; Yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet-0.11.0/snippets"))
(yas-reload-all)
(add-hook 'c++-mode-hook 'yas-minor-mode)
(add-hook 'c-mode-hook 'yas-minor-mode)

;; Diff highlight
(global-diff-hl-mode)
(diff-hl-flydiff-mode 1)

;; Highlight #if 0 ... #endif
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
        'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
        'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay              nil
      company-minimum-prefix-length   2
      company-show-numbers            t
      company-tooltip-limit           20
      company-dabbrev-downcase        nil
      company-backends                '((company-irony company-gtags))
      )

;; smart tabs
(smart-tabs-insinuate 'c 'javascript 'c++)

;; patch for projectile
;(setq projectile-tags-command "ctags-exuberant -Re -f \"%s\" %s")

;transparents
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))

;; Disable auto indent
(setq electric-indent-mode nil)

;; Unset mouse buttons
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))

;; Enable gtags mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
