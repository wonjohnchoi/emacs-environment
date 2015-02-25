;; *********************
;; *** miscellaneous ***
;; *********************
;; Always end files in a newline.
(setq require-final-newline 't)
;; ...or ask to end in newline if needed
(setq require-final-newline 'query)
;; allow using 'erase-buffer'
(put 'erase-buffer 'disabled nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; (setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH")
(delete-selection-mode t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode 'set-newline-and-indent)
(add-hook 'js-mode 'set-newline-and-indent)



;; ***************
;; **** Theme ****
;; ***************
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/themes/")

(require 'color-theme)
(color-theme-initialize)
(color-theme-tomorrow-night)


;; ***************
;; *** Compile ***
;; ***************
(defun nodejs-run ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "node " (buffer-name))))
(global-set-key "\C-c\m" 'nodejs-run)

(defun python3-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python3 " (buffer-name))))
(global-set-key "\C-c\p" 'python3-compile)

(defun java-compile ()
  "Use compile to compile java programs"
  (interactive)
  (compile (concat "javac " (buffer-name))))
(global-set-key "\C-c\j" 'java-compile)

(defun java-run ()
  "Use compile to run java programs"
  (interactive)
  (compile (concat "java " (substring (buffer-name) 0 -5))))
(global-set-key "\C-c\k" 'java-run)

(defun python3-doctest ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python3 -m doctest " (buffer-name))))
(global-set-key "\C-c\[" 'python3-doctest)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode (quote (only . t)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#282a2e" :foreground "blue")))))

; copied from my cs164 .emacs file
(global-linum-mode 1)
(global-set-key (kbd "M-;") 'goto-line)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-\\") 'kill-region)

; allow to use M-up M-down for scrolling
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta down)] 'scroll-up)
(global-set-key [(meta up)] 'scroll-down)

(electric-pair-mode 1)
(xterm-mouse-mode 1)
(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
