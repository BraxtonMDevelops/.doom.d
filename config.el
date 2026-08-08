(setq ;doom-font (font-spec :family "VictorMono Nerd Font" :size 24)
      doom-variable-pitch-font (font-spec :family "Jost*" :size 33)
      ;;doom-unicode-font(font-spec :family "Noto Color Emoji")
      doom-emoji-font(font-spec :family "Noto Color Emoji")
      doom-theme 'doom-monokai-ristretto
      display-line-numbers-type 'relative
      ;gamegrid-glyph-height-mm 10
      ;edebug-print-length 'nil
      global-emojify-mode 't
      auth-sources '("~/.authinfo"))
;(custom-set-faces! '(mode-line-active :inherit mode-line))

(setq fancy-splash-image "~/.config/doom/emacs.png")

(if (eq system-type 'darwin)
    (setq doom-font (font-spec :family "Maple Mono NF" :size 24))
    (setq doom-font (font-spec :family "Maple Mono NF" :size 22)))

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

(setq lsp-clients-lua-language-server-bin (replace-regexp-in-string "[()]" "" (format "%s" (file-expand-wildcards "/nix/store/*-lua-language-server-*/share/lua-language-server/bin/lua-language-server")))
	lsp-clients-lua-language-server-main-location (replace-regexp-in-string "[()]" "" (format "%s" (file-expand-wildcards "/nix/store/*-lua-language-server-*/share/lua-language-server/bin/main.lua"))))

(set-popup-rules! '(("^\\*info\\*$" ; Info buffers
                     :ignore t)))

(use-package! info-colors
  :hook (Info-selection . info-colors-fontify-node))

(when (eq system-type 'darwin)
  (setq mac-option-modifier nil
        mac-command-modifier 'meta))

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

(after! org-modern
  (setq org-modern-star 'replace)
  (setq org-modern-replace-stars '("🍺" "📀" "📠" "👉" "🔭" "🔮" "🛬")))

(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autolinks t)
  (run-at-time nil nil #'org-appear--set-elements))

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))



(use-package surround)
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

  (defalias 'surround-keymap surround-keymap)

  (meow-motion-define-key
   '("SPC" . doom/leader)
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . doom/escape))

  (meow-normal-define-key
   '("SPC" . doom/leader)
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("<" . meow-beginning-of-thing)
   '(">" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . cua-copy-region)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . avy-goto-word-1)
   '("F" . anzu-query-replace)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("M" . meow-kmacro-matches)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . +fold/open-all)
   '("p" . cua-paste)
   '("P" . consult-yank-from-kill-ring)
   '("q" . meow-quit)
   '("r" . meow-pop-or-unpop-to-mark)
   '("R" . rectangle-mark-mode)
   '("s" . meow-change)
   '("S" . +fold/close-all)
   '("t" . meow-find)
   '("T" . +fold/toggle)
   '("u" . undo)
   '("U" . undo-redo)
   '("v" . meow-visit)
   '("V" . mc/mark-all-dwim)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . cua-cut-region)
   '("X" . meow-kill-whole-line)
   '("y" . kmacro-start-macro)
   '("Y" . meow-end-or-call-kmacro)
   '("z" . meow-line)
   '("Z" . meow-goto-line)
   '("/" . +default/search-buffer)
   '("?" . +vertico/search-symbol-at-point)
   '("'" . surround-keymap)
   '("\"" . exchange-point-and-mark)
   '("=" . meow--eval-sexp)
   '("[" . sp-backward-sexp)
   '("]" . sp-forward-sexp)
   '("{" . sp-backward-up-sexp)
   '("}" . sp-down-sexp)
   '("|" . bookmark-set)
   '("\\" . bookmark-jump)
   '(":" . execute-extended-command)
   '("#" . string-inflection-all-cycle)
;   '("@" . jinx-correct) Disable as spellcheck is not enabled
;   '("!" . jinx-next)
   '("^" . sp-slurp-hybrid-sexp)
   '("_" . sp-forward-barf-sexp)
   '("$" . meow-universal-argument)
   '("<escape>" . doom/escape)))

(use-package! meow
  :config
  (meow-setup)
  (add-to-list 'meow-mode-state-list '(+doom-dashboard-mode . normal))
  (add-to-list 'meow-mode-state-list '(calendar-mode . motion)))
  ;(meow-global-mode))
;(load! meow.el)
(use-package! meow-tree-sitter
  :after meow
  :config
  (meow-tree-sitter-register-defaults))

(use-package! meow-ghostel
  :after (ghostel meow)
  :hook (ghostel-mode . meow-ghostel-mode))

(use-package! repeat-fu
  :config
  (setq repeat-fu-preset 'meow)
  :hook (meow-mode . (lambda ()
                       (when (and (not (minibufferp)) (not (derived-mode-p 'special-mode)))
                         (repeat-fu-mode)))))

; (setq dirvish-quick-access-entries
;       '(("h" "~/" "home")
;        ("d" "~/Downloads" "Downloads")
;        ("C" "~/Code" "Code")
;        ("N" "~/nix-config" "Nix Config")
;        ("l" "~/.local" ".local")
;        ("D" "~/Documents" "documents") ;        ("o" "~/Org" "Org")
;
;
;
;

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
