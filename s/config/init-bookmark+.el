(message "==> Loading s/lib/init-bookmark+.el")

(use-package bookmark+
  :ensure bookmark+
  :init
  (progn
    (setq bookmark-version-control t)
    (setq bookmark-save-flag 1)
    )
)

(provide 'init-bookmark+)
