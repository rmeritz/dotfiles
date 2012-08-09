(setq inhibit-startup-message t)
(show-paren-mode 1)
(require 'linum)
(global-linum-mode)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(set-face-attribute 'default nil :height 110)

(add-to-list 'load-path "/usr/share/emacs23/site-lisp/emacs-goodies-el")
(require 'color-theme)
    (color-theme-initialize)
    (color-theme-dark-laptop)

(global-auto-revert-mode 1)

;;sudo
(require 'sudo-save)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Language environment
;; use latin-1
(set-terminal-coding-system 'iso-8859-1)
(setq default-buffer-file-coding-system 'iso-8859-1)
(prefer-coding-system 'iso-8859-1)
(set-language-environment "Latin-1")
(setq file-buffer-coding 'iso-8859-1)

;;Remove irritating white space;;;;;;;;;
;;(global-whitespace-mode 1)

;;don't use tabs;;;;;;;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)
(setq erlang-indent-level 2)
(local-set-key [return] 'newline-and-indent)

;;grep for text in the code;;;;;;;;;;;;;
(global-set-key (kbd "C-c g") 'vc-git-grep)

;; Distel ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/distel/elisp/")
(require 'distel)
(distel-setup)
(setq erl-nodename-cache 'distel\@rebeccameritz)
(setq erlookup-roots '("~/git/klarna/dev/lib"))

;; Toggle Window Split ;;;;;;;;;;;;;;;;;;;;;,,

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x C-a") 'delete-trailing-whitespace)

(global-set-key (kbd "C-c t") 'toggle-window-split)

(global-set-key (kbd "C-c l") 'load-file)

(global-set-key (kbd "C-c t") 'toggle-window-split)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((erlang-indent-level . 2)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
