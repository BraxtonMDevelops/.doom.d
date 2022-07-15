(setq doom-font (font-spec :family "Rec Mono Duotone" :size 28)
      doom-variable-pitch-font (font-spec :family "Recursive Sans Casual Static" :size 31)
      doom-theme 'doom-dracula
      display-line-numbers-type 'relative
      gamegrid-glyph-height-mm 10
      edebug-print-length 'nil
      global-emojify-mode 'nil
      auth-sources '("~/.authinfo"))

(custom-set-faces! '(mode-line-active :inherit mode-line))
;(setq doom-theme 'doom-solarized-light)
(setq display-line-numbers-type 'relative)
;(setq edebug-print-length 'nil)
;(setq global-emojify-mode 'nil)

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

(setq lsp-clients-lua-language-server-bin (replace-regexp-in-string "[()]" "" (format "%s" (file-expand-wildcards "/nix/store/*-sumneko-lua-language-server-*/share/lua-language-server/bin/lua-language-server")))
      lsp-clients-lua-language-server-main-location (replace-regexp-in-string "[()]" "" (format "%s" (file-expand-wildcards "/nix/store/*-sumneko-lua-language-server-*/share/lua-language-server/bin/main.lua"))))

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

(setq org-directory "~/Org/")

(after! org
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  (setq org-src-fontify-natively t
        org-ellipsis " ▾"
        org-startup-folded t
        org-hide-emphasis-markers 1)) ; replacing org-hide-emphasis-markers with org-appear.
    (remove-hook 'org-mode-hook 'org-cdlatex-mode)
    ;; Temporary bit of code to keep cd-latex-mode out of the way when I don't want it, as its bind is a bit painful.

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
  (setq org-superstar-headline-bullets-list'("🍺" "📀" "📠" "👉" "🔭" "🔮" "☄️") org-superstar-prettify-item-bullets t))

(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autolinks t)
  (run-at-time nil nil #'org-appear--set-elements))

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (map! :map nov-mode-map
        :n "RET" #'nov-scroll-up)

  (defun doom-modeline-segment--nov-info ()
    (concat
     " "
     (propertize
      (cdr (assoc 'creator nov-metadata))
      'face 'doom-modeline-project-parent-dir)
     " "
     (cdr (assoc 'title nov-metadata))
     " "
     (propertize
      (format "%d/%d"
              (1+ nov-documents-index)
              (length nov-documents))
      'face 'doom-modeline-info)))

  (advice-add 'nov-render-title :override #'ignore)

  (defun +nov-mode-setup ()
    (face-remap-add-relative 'variable-pitch
                             :family "Merriweather"
                             :height 1.4
                             :width 'semi-expanded)
    (face-remap-add-relative 'default :height 1.3)
    (setq-local line-spacing 0.2
                next-screen-context-lines 4
                shr-use-colors nil)
    (require 'visual-fill-column nil t)
    (setq-local visual-fill-column-center-text t
                visual-fill-column-width 81
                nov-text-width 80)
    (visual-fill-column-mode 1)
    (hl-line-mode -1)

    (add-to-list '+lookup-definition-functions #'+lookup/dictionary-definition)

    (setq-local mode-line-format
                `((:eval
                   (doom-modeline-segment--workspace-name))
                  (:eval
                   (doom-modeline-segment--window-number))
                  (:eval
                   (doom-modeline-segment--nov-info))
                  ,(propertize
                    " %P "
                    'face 'doom-modeline-buffer-minor-mode)
                  ,(propertize
                    " "
                    'face (if (doom-modeline--active) 'mode-line 'mode-line-inactive)
                    'display `((space
                                :align-to
                                (- (+ right right-fringe right-margin)
                                   ,(* (let ((width (doom-modeline--font-width)))
                                         (or (and (= width 1) 1)
                                             (/ width (frame-char-width) 1.0)))
                                       (string-width
                                        (format-mode-line (cons "" '(:eval (doom-modeline-segment--major-mode))))))))))
                  (:eval (doom-modeline-segment--major-mode)))))

  (add-hook 'nov-mode-hook #'+nov-mode-setup))
