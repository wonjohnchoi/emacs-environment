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

;; ************************
;; **** Syntax Checker ****
;; ************************
(defun flymake-simple-make-java-init())
(defun flymake-simple-java-cleanup())

;; PyFlakes (http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/)
(add-to-list 'load-path "~/.emacs.d/flymake")

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "~/.emacs.d/flymake/pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)
(load-library "flymake-cursor")


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

;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; offset customizations not in my-c-style
;; This will take precedence over any setting of the syntactic symbol
;; made by a style.
(setq c-offsets-alist '((member-init-intro . ++)))

;; Create my personal style.
(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "PERSONAL")
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline, but not hungry-delete
  (c-toggle-auto-newline 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
