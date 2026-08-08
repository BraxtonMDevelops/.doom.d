(unpin! doom-themes)

(package! info-colors :pin "47ee73cc19b1049eef32c9f3e264ea7ef2aaf8a5")

(package! org-appear :recipe (:host github :repo "awth13/org-appear")
  :pin "8dd1e564153d8007ebc4bb4e14250bde84e26a34")

(package! meow)
(package! meow-ghostel
  :recipe '(:host github :repo "dakra/meow-ghostel"))
(package! meow-tree-sitter
  :recipe '(:host github :repo "skissue/meow-tree-sitter"))
(package! repeat-fu)
(package! restore-point
  :recipe '(:host github :repo "arthurcgusmao/restore-point"))
(package! surround)

(package! magit-todos)

(package! nov :pin "b3c7cc28e95fe25ce7b443e5f49e2e45360944a3")
