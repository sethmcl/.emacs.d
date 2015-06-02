(message "==> Loading s/lib/utils.el")

(defun s/join-dirs (prefix suffix)
  "Joins `prefix` and `suffix` into a directory path."
  (file-name-as-directory (concat prefix suffix)))

(provide 'utils)
