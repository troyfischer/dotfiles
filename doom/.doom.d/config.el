;; [[file:../org/README/README.org::*Doom Config][Doom Config:1]]
;; General
(setq user-full-name "Troy Fischer"
      user-mail-address "troytfischer@gmail.com"
      display-line-numbers-type 'relative
      doom-theme 'doom-dracula
      password-cache-expiry nil  ;; only type password once
      delete-by-moving-to-trash t ;; move files to trash instead of perma deletion
      doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 24))
(delq! t custom-theme-load-path) ;; remove default emacs themes

;; Org
(use-package org
  :config
  (setq org-hide-emphasis-markers t) ;; hides emphasis markers
  (setq org-startup-folded t) ;; start org files folded
  (setq org-directory "~/org/") ;; main org directory
  (setq org-ellipsis "…") ;; nicer looking ellipsis
  (setq org-agenda-files (directory-files-recursively org-directory "\\.org$")) ;; regex for possible files with TODOs
  ;;(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")) ;; nicer looking bullets, requires org-superstar
  (org-add-link-type "mpv" (lambda (path) (browse-url-xdg-open path)))) ;; adds the ability to open a link to a video file with mpv
;; Doom Config:1 ends here
