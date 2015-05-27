(message "==> Loading s/lib/init-yasnippet.el")

(require-package 'yasnippet)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

(provide 'init-yasnippet)
