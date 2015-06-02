(message "==> Loading s/lib/envy.el")

;; Create a directory for storing temporary files
(make-directory
 (setq s/tmp-local-dir
       (s/join-dirs s/dotfiles-dir ".tmp")) t)

;; Set directory for autosaves / backups
(make-directory
 (setq s/tmp-backups-dir
       (s/join-dirs s/tmp-local-dir "backups")) t)
(make-directory
 (setq s/tmp-autosaves-dir
       (s/join-dirs s/tmp-local-dir "autosaves")) t)

(provide 'envy)
