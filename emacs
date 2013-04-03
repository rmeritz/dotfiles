(require 'package)
(package-initialize)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")
                          ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq inhibit-startup-message t)
(show-paren-mode 1)
(require 'linum)
(global-linum-mode)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Needed for color-theme to work in emacs24
(defun plist-to-alist (the-plist)
  (defun get-tuple-from-plist (the-plist)
    (when the-plist
      (cons (car the-plist) (cadr the-plist))))
  (let ((alist '()))
    (while the-plist
      (add-to-list 'alist (get-tuple-from-plist the-plist))
      (setq the-plist (cddr the-plist)))
  alist))

;; M-x package-install color-theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

;; sudo apt-get install flake8
;; git clone git@github.com:rmeritz/flymake-python-pyflakes.git
;; pip install flake8
(setq flymake-python-pyflakes-executable "flake8")
(add-to-list 'load-path "~/.emacs.d/flymake-python-pyflakes")
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(load-file "~/.emacs.d/flymake-python-pyflakes/flymake-customizations.el")

;; M-x package-install jedi auto-complete flymake
;; pip install epc jedi
(require 'auto-complete)
(setq jedi:setup-keys t)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'auto-complete-mode)
(custom-set-faces
 '(flymake-errline ((((class color)) (:background "red"))))
 '(flymake-warnline ((((class color)) (:underline "red")))))

(global-set-key (kbd "C-c #") 'comment-region)
(global-set-key (kbd "C-x #") 'uncomment-region)

;; git clone git://github.com/antonj/scss-mode.git
(setq exec-path (cons (expand-file-name "/usr/local/bin") exec-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-hook 'scss-mode-hook 'flymake-mode)
(setq scss-compile-at-save nil)

(setq ac-ignore-case nil)

 (setq load-path (cons  "/usr/lib/erlang/lib/tools-2.6.7/emacs"
      load-path))
      (setq erlang-root-dir "/usr/lib/erlang")
      (setq exec-path (cons "/usr/lib/erlang/bin/" exec-path))
(require 'erlang-start)

 ;; git clone git://github.com/tjarvstrand/edts.git
 ;; cd edts; make
(add-to-list 'load-path "~/.emacs.d/edts")
(require 'edts-start)
