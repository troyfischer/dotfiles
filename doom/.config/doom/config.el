;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Troy Fischer"
      user-mail-address "troytfischer@gmail.com"
      display-line-numbers-type t
      doom-theme 'wombat
      password-cache-expiry nil   ;; only type password once
      delete-by-moving-to-trash t ;; move files to trash instead of perma deletion
      doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 24))
;; transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

(setq +doom-dashboard-banner-file (expand-file-name "default-emacs.svg" doom-private-dir))  ;; use custom image as banner

(use-package! dired-x
  :config
  (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$") ;; hides dotfiles
        dired-deletion-confirmer #'y-or-n-p
        dired-open-extensions '(("mkv" . "mpv")
                                ("mp4" . "mpv"))))

(setq evil-kill-on-visual-paste nil) ;; pasting in visual state does not add replaced text to kill ring

(use-package! lsp-java
  :config
  (setq lsp-java-code-generation-hash-code-equals-use-java7objects t))

(use-package! lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

(use-package! pyvenv
  :config
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(setq org-directory "~/org/"
      org-agenda-files '("~/org/agenda/agenda.org")
      org-agenda-span 30
      org-hide-emphasis-markers nil)
;; disable org mode auto complete suggestions
(add-hook 'org-mode-hook (lambda () (company-mode -1)))

(map! :map vertico-map "C-l" #'vertico-exit) ;; allow C-l to select an item

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
