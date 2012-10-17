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
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(setenv "PATH" "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin")
(delete-selection-mode t)

(custom-set-variables
 '(inhibit-startup-screen t)
'(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


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

(setq compilation-scroll-output t)

(setq js-indent-level 2)
