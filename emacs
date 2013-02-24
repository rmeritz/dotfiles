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

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))

;; pip install flake8
(setq flymake-python-pyflakes-executable "flake8")
(add-to-list 'load-path "~/.emacs.d/flymake-python-pyflakes")
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(load-file "~/.emacs.d/flymake-python-pyflakes/flymake-customizations.el")

;; pip install epc jedi
(require 'auto-complete)
(setq jedi:setup-keys t)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'auto-complete-mode)
(custom-set-faces
 '(flymake-errline ((((class color)) (:background "red"))))
 '(flymake-warnline ((((class color)) (:underline "red")))))
