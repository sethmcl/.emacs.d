(message "==> Loading s/lib/init-js-mode.el")

;; setup filetype modes
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)

;; use two spaces for indentation
(setq js-indent-level 2)

(provide 'init-js-mode)
