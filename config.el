  (setq doom-font (font-spec :family "VictorMono Nerd Font Mono" :size 32))
  (setq doom-theme 'doom-solarized-light)
  (setq display-line-numbers-type 'relative)
  (setq edebug-print-length 'nil)

(setq fancy-splash-image "~/Pictures/emacs.png")

(setq auto-save-default t)
(setq which-key-idle-delay 0.25)
(display-time-mode 1)

;;(setq ispell-dictionary "en-custom")
;;(setq ispell-personal-dictionary (expand-file-name ".ispell_personal" doom-private-dir))

(after! lsp-ui
  (setq lsp-ui-doc-enable 1)
  (setq! lsp-ui-doc-delay 0)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-max-width 200)
  (setq lsp-ui-doc-max-height 50)
  (setq lsp-ui-doc-use-webkit nil)
  (setq lsp-ui-doc-border 'unspecified)
  (setq! lsp-ui-peek-enable t))
(after! lsp
  (setq lsp-enable-symbol-highlighting nil))

(use-package! info-colors
  :hook (Info-selection . info-colors-fontify-node))

(set-popup-rules! '(("\\*info\\*" :ignore t)))

(setq org-directory "~/org/")

(after! org
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  (setq org-src-fontify-natively t)
 ;; (add-hook 'org-mode-hook 'turn-on-flyspell)
  (setq org-startup-folded t))

;;(use-package! org-super-agenda
 ;; :after org-agenda
 ;; :init
  ;;setq org-super-agenda-groups '((:name "Today"
 ;;                                         :time-grid t
   ;;                                       :scheduled today)
    ;;                              (:name "Due today"
     ;;                                     :deadline today)
      ;;                            (:name "Important"
        ;;                                  :priority "A")
           ;;                       (:name "overdue"
         ;;                                 :deadline past)
       ;;                           (:name "Due soon"
     ;;                                    :deadline future)
   ;;                               (:name "Big Outcomes"
         ;;                                :tag "bo")))
 ;; :config

(after! org-superstar
  (setq org-superstar-headline-bullets-list'("☕" "☀" "☎" "☞" "☭" "☯" "☮") org-superstar-prettify-item-bullets t))

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))
