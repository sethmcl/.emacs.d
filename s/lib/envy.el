(message "==> Loading sethmcl/lib/envy.el")

;; Create a directory for storing temporary files
(make-directory
 (setq sethmcl/tmp-local-dir
       (sethmcl/join-dirs sethmcl/dotfiles-dir ".tmp")) t)

;; Set directory for autosaves / backups
(make-directory
 (setq sethmcl/tmp-backups-dir
       (sethmcl/join-dirs sethmcl/tmp-local-dir "backups")) t)
(make-directory
 (setq sethmcl/tmp-autosaves-dir
       (sethmcl/join-dirs sethmcl/tmp-local-dir "autosaves")) t)

(provide 'envy)
