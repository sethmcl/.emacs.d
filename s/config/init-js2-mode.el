(message "==> Loading s/lib/init-js2-mode.el")

(use-package js2-mode
  :ensure js2-mode
  :init
  (progn
    (custom-set-variables
     '(js2-basic-offset 2)
     '(js2-bounce-indent-p t)
     '(tab-width 2)
     '(indent-tabs-mode nil)
     '(js2-highlight-level 3)
     )

    (define-key js-mode-map "{" 'paredit-open-curly)
    (define-key js-mode-map "}" 'paredit-close-curly-and-newline)

    (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
    )

  (provide 'init-js2-mode))

(use-package ac-js2
  :ensure ac-js2
  :config
  (progn
    (add-hook 'js-mode-hook 'js2-minor-mode)
    (add-hook 'js2-mode-hook 'ac-js2-mode)
    )
  )
