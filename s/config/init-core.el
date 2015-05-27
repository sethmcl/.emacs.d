(message "==> Loading s/lib/init-core.el")

(require 'server)
(unless (server-running-p)
  (server-start))

;; Change location for autosaves / backups
;; Folder paths are defined in s/lib/env.el
(setq backup-directory-alist `((".*" . ,s/tmp-backups-dir))
      auto-save-file-name-transforms `((".*" ,s/tmp-autosaves-dir)))
(setq backup-by-copying t)

;; Use spaces instead of tabs
(setq-default
 indent-tabs-mode nil
 )

;; whitespace
(setq-default show-trailing-whitespace t)

;; highlight line
(global-hl-line-mode +1)

;; line numbers
(global-linum-mode t)

(provide 'init-core)
