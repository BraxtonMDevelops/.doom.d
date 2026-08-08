(map! :leader
      "`" nil
      :desc "Flymake"                    "!"    #'consult-flymake
      :desc "M-x"                        ":"    #'execute-extended-command
      :desc "Pop up scratch buffer"      "x"    #'doom/open-scratch-buffer
      :desc "Universal argument"         "u"    #'universal-argument
      :desc "help"                       "h"    #'help-map
      :desc "Toggle last popup"          "~"    #'+popup/toggle
      :desc "Find file"                  "."    #'find-file
      :desc "Switch workspace buffer"    ","    #'persp-switch-to-buffer
      :desc "Switch buffer"              "<"    #'switch-to-buffer
      :desc "Repeat"                     "'"    #'vertico-repeat
      :desc "Search for symbol in project" "?"  #'+default/search-project-for-symbol-at-point
      :desc "Search project"             "/"    #'+default/search-project
      :desc "Find file in project"       "SPC"  #'projectile-find-file
      :desc "Marks (consult)"            "\""   #'consult-mark
      (:prefix-map ("@" . "Bookmarks")
       :desc "Jump to Bookmarks in Project"    "SPC"   #'bookmark-in-project-jump
       :desc "All Bookmarks / New Bookmark"    "RET"   #'bookmark-jump
       :desc "New bookmark"                    "m"     #'bookmark-set
       :desc "Delete bookmark"                 "d"     #'bookmark-delete)
      (:when (modulep! :tools debugger)
        (:prefix-map ("d" . "debugger")
                      "d" #'dape
                      "p" #'dape-pause
                      "c" #'dape-continue
                      "n" #'dape-next
                      "s" #'dape-step-in
                      "o" #'dape-step-out
                      "r" #'dape-restart
                      "R" #'dape-repl
                      "i" #'dape-info
                      "m" #'dape-memory
                      "M" #'dape-disassemble
                      "l" #'dape-breakpoint-log
                      "e" #'dape-breakpoint-expression
                      "h" #'dape-breakpoint-hits "b" #'dape-breakpoint-toggle
                      "B" #'dape-breakpoint-remove-all
                      "t" #'dape-select-thread
                      "S" #'dape-select-stack
                      "<" #'dape-stack-select-up
                      ">" #'dape-stack-select-down
                      "x" #'dape-evaluate-expression
                      "w" #'dape-watch-dwim
                      "D" #'dape-disconnect-quit
                      "q" #'dape-quit))
      (:prefix-map ("w" . window)
       :desc "ace-window"             "w" #'ace-window
       :desc "swap windows"           "W" #'ace-swap-window
       :desc "split vertical"         "v" #'split-window-vertically
       :desc "split horizontal"       "h" #'split-window-horizontally
       :desc "make taller"            "+" #'enlarge-window
       :desc "make shorter"           "-" #'shrink-window
       :desc "make wider"             ">" #'enlarge-window-horizontally
       :desc "make narrower"          "<" #'shrink-window-horizontally
       :desc "delete current window"  "d" #'delete-window
       :desc "delete other windows"   "o" #'delete-other-windows)

      (:prefix-map ("b" . "buffer")
       :desc "Toggle narrowing"           "-" #'doom/toggle-narrow-buffer
       :desc "Switch workspace buffer"    "b" #'persp-switch-to-buffer
       :desc "Switch buffer"              "B" #'switch-to-buffer
       :desc "ibuffer workspace"          "I" #'+ibuffer/open-for-current-workspace
       :desc "Clone buffer"               "c" #'clone-indirect-buffer
       :desc "Clone buffer other window"  "C" #'clone-indirect-buffer-other-window
       :desc "ibuffer"                    "i" #'ibuffer
       :desc "Kill buffer"                "k" #'kill-this-buffer
       :desc "Kill all buffers"           "K" #'doom/kill-all-buffers
       :desc "Next buffer"                "n" #'next-buffer
       :desc "New empty buffer"           "N" #'+default/new-buffer
       :desc "Kill other buffers"         "o" #'doom/kill-other-buffers
       :desc "Previous buffer"            "p" #'previous-buffer
       :desc "Revert buffer"              "r" #'revert-buffer
       :desc "Rename buffer"              "R" #'rename-buffer
       :desc "Save buffer"                "s" #'basic-save-buffer
       :desc "Save buffer as root"        "u" #'doom/sudo-save-buffer
       :desc "Pop up scratch buffer"      "x" #'doom/open-scratch-buffer
       :desc "Switch to scratch buffer"   "X" #'doom/switch-to-scratch-buffer
       :desc "Yank buffer"                "y" #'+default/yank-buffer-contents
       :desc "Bury buffer"                "z" #'bury-buffer
       :desc "Kill buried bufferes"       "Z" #'doom/kill-buried-buffers)
      
      (:prefix-map ("TAB" . "workspaces")
       :desc "Display tab bar"           "TAB" #'+workspace/display
       :desc "Switch workspace"          "."   #'+workspace/switch-to
       :desc "Switch to last workspace"  "`"   #'+workspace/other
       :desc "New workspace"             "n"   #'+workspace/new
       :desc "New named workspace"       "N"   #'+workspace/new-named
       :desc "Load workspace from file"  "l"   #'+workspace/load
       :desc "Save worskpace to file"    "s"   #'+workspace/save
       :desc "Delete session"            "x"   #'+workspace/kill-session
       :desc "Delete workspace"          "d"   #'+workspace/kill
       :desc "Delete saved workspace"    "D"   #'+workspace/delete
       :desc "Rename workspace"          "r"   #'+workspace/rename
       :desc "Restore last session"      "R"   #'+workspace/restore-last-session
       :desc "Next workspace"            "]"   #'+workspace/switch-right
       :desc "Previous workspace"        "["   #'+workspace/switch-left 
       :desc "Switch to final workspace" "0"   #'+workspace/switch-to-final
       :desc "Switch to 1st workspace"   "1"   #'+workspace/switch-to-0
       :desc "Switch to 2nd workspace"   "2"   #'+workspace/switch-to-1
       :desc "Switch to 3rd workspace"   "3"   #'+workspace/switch-to-2
       :desc "Switch to 4th workspace"   "4"   #'+workspace/switch-to-3
       :desc "Switch to 5th workspace"   "5"   #'+workspace/switch-to-4
       :desc "Switch to 6th workspace"   "6"   #'+workspace/switch-to-5
       :desc "Switch to 7th workspace"   "7"   #'+workspace/switch-to-6
       :desc "Switch to 8th workspace"   "8"   #'+workspace/switch-to-7
       :desc "Switch to 9th workspace"   "9"   #'+workspace/switch-to-8)

      (:prefix-map ("f". "Files")
       :desc "Browse Files"                "b"   #'dirvish-dwim
       :desc "Quick dirs"                  "SPC" #'dirvish-quick-access
       :desc "Open project editorconfig"   "c"   #'editorconfig-find-current-editorconfig
       :desc "Copy this file"              "C"   #'doom/copy-this-file
       :desc "Find directory"              "d"   #'consult-dir
       :desc "Delete this file"            "D"   #'doom/delete-this-file
       :desc "Find file in Emacs config"   "e"   #'doom/find-file-in-emacsd
       :desc "Browse Emacs config"         "E"   #'doom/browse-in-emacsd
       :desc "Find file"                   "f"   #'find-file
       :desc "Find file from here"         "F"   #'+default/find-file-under-here
       :desc "Find file in private config" "p"   #'doom/open-private-config
       :desc "Save file"                   "s"   #'save-buffer
       :desc "Save file as..."             "S"   #'write-file
       :desc "Yank file path"              "y"   #'+default/yank-buffer-path
       :desc "Yank file path from project" "Y"   #'+default/yank-buffer-path-relative-to-project)

      (:prefix-map ("p" . "project")
       :desc "Browse project"                   "." #'+default/browse-project
       :desc "Browse other project"             ">" #'doom/browse-in-other-project
       :desc "Run cmd in project root"          "!" #'projectile-run-shell
       :desc "Async cmd in project root"        "&" #'projectile-run-async-shell-command-in-root
       :desc "Add new project"                  "a" #'projectile-add-known-project
       :desc "Switch to project buffer"         "b" #'projectile-switch-to-buffer
       :desc "Compile in project"               "c" #'projectile-compile-project
       :desc "Repeat last command"              "C" #'projectile-repeat-last-command
       :desc "Remove known project"             "d" #'projectile-remove-known-project
       :desc "Discover projects in folder"      "D" #'projectile-cleanup-known-projects
       :desc "Edit project .dir-locals"         "e" #'projectile-edit-dir-locals
       :desc "Find file in project"             "f" #'projectile-find-file
       :desc "Find file in other project"       "F" #'doom/find-file-in-other-project
       :desc "Configure project"                "g" #'projectile-configure-project
       :desc "Invalidate current project cache" "i" #'projectile-invalidate-cache
       :desc "Kill project buffers"             "k" #'projectile-kill-buffers
       :desc "Find other file"                  "o" #'projectile-find-other-file
       :desc "Switch project"                   "p" #'projectile-switch-project
       :desc "Find recent project files"        "r" #'projectile-recentf
       :desc "Save project files"               "s" #'projectile-save-project-buffers
       :desc "List project todos"               "t" #'magit-todos-list
       :desc "Pop up scratch buffer"            "x" #'doom/open-project-scratch-buffer
       :desc "Switch to scratch buffer"         "X" #'doom/switch-to-scratch-buffer)
       ;Not using justfile so disable for now. :desc "justfile commands" #'justl
      
      (:prefix-map ("i" . "insert")
       :desc "Emoji"              "e" #'emoji-search
       :desc "Current file name"  "f" #'+default/insert-file-name
       :desc "Current file path"  "F" (cmd! #'+default/insert-file-path t)
       ; Update when using Tempel :desc "Template"
       :desc "Snippet"            "s" #'consult-yasnippet
       :desc "New Snippet"        "S" #'+snippets/new
       :desc "Unicode"            "u" #'insert-char
       :desc "From clipboard"     "y" #'+default/yank-pop)
      (:prefix-map ("s" . "search")
       :desc "Search all open bufers"     "B" (cmd!! #'consult-line-multi 'all-buffers)
       :desc "Search current directory"   "d" #'+default/search-cwd
       :desc "Search other directory"     "D" #'+default/search-other-cwd
       :desc "Search Emacs config"        "e" #'+default/search-other-cwd
       :desc "Jump to symbol"             "i" #'imenu
       :desc "Jump to visible link"       "l" #'link-hint-open-link
       :desc "Jump to link"               "L" #'ffap-menu
       :desc "Jump to bookmark"           "m" #'bookmark-jump
       :desc "Look up online"             "o" #'+lookup/online
       :desc "Look up online (w/ prompt)" "O" #'+lookup/online-select
       :desc "Look up in local docsets"   "k" #'+lookup/in-docsets
       :desc "Look up in all docsets"     "K" #'+lookup/in-all-docsets
       :desc "Search other project"       "P" #'+default/search-other-project
       :desc "Dictionary"                 "t" #'+lookup/dictionary-definition
       :desc "Thesarus"                   "T" #'+lookup/synonyms)

      (:prefix-map ("t" . "toggle")
       :desc "Artist mode"            "a" #'artist-mode
       :desc "Follow mode"            "x" #'follow-mode
       :desc "Big mode"               "b" #'doom-big-font-mode
       :desc "Fill Column Indicator"  "c" #'global-display-fill-column-indicator-mode
       :desc "Flycheck"               "f" #'flycheck-mode
       :desc "Frame fullscreen"       "F" #'toggle-frame-fullscreen
       :desc "Indent style"           "I" #'doom/toggle-indent-style
       :desc "Line numbers"           "l" #'doom/toggle-line-numbers
       :desc "Minimap"                "m" #'demap-toggle
       :desc "Read-only mode"         "r" #'read-only-mode
       ; Add Jinx :desc "Spell checker"          "s" #'jinx-mode
       :desc "Visible mode"           "v" #'visible-mode
       :desc "Soft line wrapping"     "w" #'+word-wrap-mode)
      (:prefix-map ("o" . "open")
       :desc "Process List"                  "a" #'list-processes
       :desc "Start debugger"                "d" #'+debugger/start
       :desc "New frame"                     "f" #'make-frame
       :desc "Select frame"                  "F" #'select-frame-by-name
       :desc "REPL"                          "r" #'+eval/open-repl-other-window
       :desc "REPL (same window)"            "R" #'+eval/open-repl-same-window
       :desc "Project sidebar"               "p" #'+treemacs/toggle
       :desc "Find file in project sidebar"  "P" #'treemacs-find-file
       :desc "Toggle term popup"             "t" #'+ghostel/toggle
       :desc "Open Ghostel here"             "T" #'+ghostel/here
       :desc "Calendar"                      "c" #'=calendar
       :desc "Agenda"                        "A" #'org-agenda)
      
      (:prefix-map ("n" . "notes")
       :desc "Search notes for symbol"     "*" #'+default/search-notes-for-symbol-at-point
       :desc "Search notes"                "/" #'+default/org-notes-search
       :desc "Org agenda"                  "a" #'org-agenda
      ; If we do papers :desc "Bibliographic notes"         "b" #'citar-open-notes
       :desc "Find file in notes"          "f" #'+default/find-in-notes
       :desc "Browse notes"                "F" #'+default/browse-notes
      ;Need super-links :desc "Org store link"              "l" #'org-super-links-store-link
       :desc "Tags search"                 "m" #'org-tags-view
       :desc "Org capture"                 "n" #'org-capture
       :desc "Goto capture"                "N" #'org-capture-goto-target
       :desc "Todo list"                   "t" #'org-todo-list
       :desc "Search org agenda headlines" "?" #'+default/org-notes-headlines
       :desc "View search"                 "v" #'org-search-view
       :desc "Org export to clipboard"     "y" #'+org/export-to-clipboard
       :desc "Org export to clipboard as RTF" "Y" #'+org/export-to-clipboard-as-rich-text)

      (:prefix-map ("j" . "journal")
       :desc "New entry"           "j" #'org-journal-new-entry
       :desc "New scheduled entry" "J" #'org-journal-new-scheduled-entry
       :desc "Search journal"      "s" #'org-journal-search-forever
       :desc "Open previous entry" "p" #'org-journal-previous-entry
       :desc "Open next entry"     "n" #'org-journal-next-entry)
      
      (:prefix-map ("g" . "git")
       :desc "Revert file"           "R" #'vc-revert
       :desc "Copy link to remote"   "y" #'+vc/browse-at-remote-kill
       :desc "Copy link to homepage" "Y" #'+vc/browse-at-remote-kill-homepage
       :desc "Revert hunk at point"  "r" #'+vc-gutter/revert-hunk
       :desc "Stage hunk at point"   "s" #'+vc-gutter/stage-hunk
       :desc "Git time machine"      "t" #'git-timemachine-toggle
       :desc "Jump to previous hunk" "[" #'+vc-gutter/previous-hunk
       :desc "Jump to next hunk"     "]" #'+vc-gutter/next-hunk
       :desc "Magit dispatch"        "/" #'magit-dispatch
       :desc "Magit file dispatch"   "." #'magit-file-dispatch))
