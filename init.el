(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

; packages required
(use-package magit
  :ensure t)
(use-package iedit
  :ensure t)
(use-package multiple-cursors
  :ensure t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t)
(use-package web-mode)
(use-package stylus-mode)
(use-package tickscript-mode)
(use-package vue-mode)
(use-package flycheck
  :ensure t)


(windmove-default-keybindings)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x l") 'magit-log-all-branches)
(global-set-key (kbd "C-x C-a") 'string-insert-rectangle)

(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
(setq tab-stop-list (number-sequence 2 120 2))
(setq-default indent-tabs-mode nil)

(setq c-default-style "java"
      c-basic-offset 2)

(global-set-key (kbd "<delete>") 'delete-char)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)

(defun comment-eclipse ()
  (interactive)
  (let ((start (line-beginning-position))
	(end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
		    (goto-char (region-beginning))
		    (beginning-of-line)
		    (point))
	    end (save-excursion
		  (goto-char (region-end))
		  (end-of-line)
		  (point))))
    (comment-or-uncomment-region start end)))
(global-set-key (kbd "C-/") 'comment-eclipse)

(global-set-key (kbd "C-;") 'iedit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(package-selected-packages
   (quote
    (php-mode cmake-mode stylus-mode vue-mode flycheck tickscript-mode web-mode mc-extras magit color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-font "Inconsolata-13")

(global-display-line-numbers-mode 1)
(setq inhibit-startup-screen t)
;;(neotree-show)
;;(neotree-dir "~/workspace")

(require 'stylus-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;;allow web mode for jsx in .js files
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

;multiple-cursors key bindings
(global-set-key (kbd "C->") 'mc/mark-next-like-this) ;stops enter working
(global-set-key (kbd "M->") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-S->") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-r") 'mc/mark-all-in-region-regexp)

(add-to-list 'load-path "path-to-tickscript-mode")
(require 'tickscript-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq indent-tabs-mode nil
      js-indent-level 2)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'scad-mode)
