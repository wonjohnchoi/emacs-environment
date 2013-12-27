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
(add-to-list 'load-path "~/.emacs.d/auctex-11.86-e23.3-msw/")
(add-to-list 'load-path "~/.emacs.d/auctex-11.86-e23.3-msw/site-lisp/")

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

;(setq compilation-scroll-output t)
(if (eq system-type 'windows-nt)
    ;; windows
    (defun latex-pdf-reload ()
      "Use compile to generate pdf using latex and"
      "reload the pdf file on background"
      (interactive)
      ;(compile (concatenate 'string "pdflatex " (buffer-name) "& start "" \"C:\\Program Files (x86)\\Adobe\\Reader 11.0\\Reader\\AcroRd32.exe\" " (substring (buffer-name) 0 -4) ".pdf")))
      (compile (concatenate 'string "pdflatex " (buffer-name))))
      ;"& start "" \"C:\Program Files (x86)\\Evince-2.32.0.145\\bin\\evince.exe\" " (substring (buffer-name) 0 -4) ".pdf")))
      
  ;; something else (mac os, linux)
  (defun latex-pdf-reload ()
    "Use compile to generate pdf using latex and"
    "reload the pdf file on background"
    (interactive)
    (compile (concatenate 'string "pdflatex " (buffer-name) "; open " (substring (buffer-name) 0 -4) ".pdf; open -a Aquamacs.app")))
)
(global-set-key "\C-t" 'latex-pdf-reload)
(require 'tex-site)
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
 )

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


; octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
