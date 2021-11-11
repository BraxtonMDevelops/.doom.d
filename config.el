(setq doom-font (font-spec :family "VictorMono Nerd Font Mono" :size 32))
(setq doom-theme 'doom-gruvbox-light)
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

(set-popup-rules! '(("^\\*info\\*$" ; Info buffers
                     :ignore t)))

(use-package! keycast
  :commands keycast-mode
  :config
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast--update t)
          (add-to-list 'global-mode-string '("" mode-line-keycast " ")))
      (remove-hook 'pre-command-hook 'keycast--update)
      (setq global-mode-string (remove '("" mode-line-keycast " ") global-mode-string))))
  (custom-set-faces!
    '(keycast-command :inherit doom-modeline-debug
                      :height 0.9)
    '(keycast-key :inherit custom-modified
                  :height 1.1
                  :weight)))

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
                                 '(coding-category-undecided coding-category-utf-8))
                           (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
                t)))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

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
