(message "==> Loading s/lib/init-flycheck.el")

(use-package flycheck
  :ensure flycheck
  :init
  (progn
    (custom-set-variables
     '(flycheck-disabled-checkers '(javascript-jshint))
     )
    )

  (provide 'init-flycheck))
