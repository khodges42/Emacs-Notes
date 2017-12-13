

;; Melpa is the defacto package repo for Emacs. 
;;
(require 'package) 
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


;;;; Emacs the way stallman wanted it (removes menu bar, toolbar, scrollbar)
;;
  (menu-bar-mode -1)
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode)
(horizontal-scroll-bar-mode -1))


;;;; Global Linum Mode (numbers all lines. You can turn off by M-x Linum-mode)
;;
(global-linum-mode 1)


;;;; Python Mode
;;
(defvar pyPackages
  '(better-defaults
   elpy))


;;;; Cool hacker transparency
;;
(set-frame-parameter (selected-frame) 'alpha '(94 . 83))
(add-to-list 'default-frame-alist '(alpha . (94 . 83)))


;;;; trees
;;
(require 'neotree)
(global-set-key [C-tab] 'neotree-toggle)


;;;; ido mode
;;
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;;;; Themes. You can replace the 'rebecca with any theme you have installed.
;;
(add-hook 'emacs-startup-hook
	  (lambda()
	    (load-theme 'rebecca)
	    ))


;;;; Winner Mode
;;
(when (fboundp 'winner-mode)
  (winner-mode 1))


;;;; Hippie Expand
;;
 (global-set-key (kbd "M-/") 'hippie-expand)


;;;;;; Macros
;;
;;
;;;; Split 4 automatically splits into 4 windows.
(fset 'split4
   [?\C-x ?2 ?\C-x ?3 S-down ?\C-x ?3])
(global-set-key (kbd "M-4") 'split4)
