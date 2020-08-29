;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
   (setq doom-font (font-spec :family "Monofur Nerd Font Mono" :size 32))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-outrun-electric)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                          :time-grid t
                                          :scheduled today)
                                  (:name "Due today"
                                          :deadline today)
                                  (:name "Important"
                                          :priority "A")
                                  (:name "overdue"
                                          :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                         :tag "bo")))

  :config
  (org-super-agenda-mode))
(after! org
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0)))


(after! org-superstar
  (setq org-superstar-headline-bullets-list '("☕" "☀" "☎" "☞" "☭" "☯" "☮")org-superstar-prettify-item-bullets t))

(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'web-mode-hook 'skewer-mode)
(display-time-mode 1)

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer ; optional
        rustic-lsp-client 'eglot))
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}"))
(setq fancy-splash-image "~/Pictures/emacs.png")
(after! flyspell (require 'flyspell-lazy) (flyspell-lazy-mode 1))

(setq auto-save-default t)

(setq ispell-dictionary "en-custom")
(setq ispell-personal-dictionary (expand-file-name ".ispell_personal" doom-private-dir))

(setq which-key-idle-delay 0.25)
(after! org (add-hook 'org-mode-hook 'turn-on-flyspell))

(setq lsp-haskell-process-path-hie "hie-wrappper")
(add-hook 'haskell-mode-hook #'lsp)
