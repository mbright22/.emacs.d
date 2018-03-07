(setq inhibit-startup-screen t)
(set-frame-font "Inconsolata-12" nil t)
;; load emacs 24's package system. Add MELPA repository.

(when (>= emacs-major-version 24)

  (require 'package)

  (add-to-list

   'package-archives

   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable

   '("melpa" . "http://melpa.milkbox.net/packages/")

   t))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(setq-default tab-width 2)
(setq-default tab-stop-list (number-sequence 2 200 2))
(setq-default indent-tabs-mode nil) ; indent with spaces
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)

;;(defun my-generate-tab-stops (&optional width max)
;;  "Return a sequence suitable for `tab-stop-list'."
;;  (let* ((max-column (or max 200))
;;         (tab-width (or width tab-width))
;;         (count (/ max-column tab-width)))
;;    (number-sequence tab-width (* tab-width count) tab-width)))
;;

;;(setq tab-width 2) ; Set indent to 2 spaces
;;(setq tab-stop-list (my-generate-tab-stops))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(package-selected-packages
   (quote
    (haskell-mode haskell-emacs markdown-mode flycheck multiple-cursors web-mode color-theme-sanityinc-tomorrow mc-extras diff-hl magit ##)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))

 '(tab-stop-list (number-sequence 2 200 2))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.re\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[s]?css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.styl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(setq web-mode-content-types-alist '(("jsx"  . ".*\\.js[x]?\\'")))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
)

(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'after-init-hook (lambda () (require 'diff-hl)))
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

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

;; (global-linum-mode t)
(global-diff-hl-mode t)

;;multiple-cursors key bindings
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;(global-set-key (kbd "M-m n") 'mc/mark-next-like-this)
;;(global-set-key (kbd "M-m p") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "C-S-m") 'mc/mark-all-like-this)
;;(global-set-key (kbd "C-S-r") 'mc/mark-all-in-region-regexp)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x l") 'magit-log-all-branches)
(global-set-key (kbd "C-x C-a") 'string-insert-rectangle)

(setq backup-inhibited t) ;disable backup
(setq auto-save-default nil) ;disable auto save
(tool-bar-mode -1)
(menu-bar-mode -1)
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
(global-unset-key (kbd "C-z"))

;;Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
