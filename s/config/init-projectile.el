(message "==> Loading s/lib/init-projectile.el")

(use-package projectile
  :ensure projectile
  :init
  (progn
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)
    )
)

(provide 'init-projectile)

