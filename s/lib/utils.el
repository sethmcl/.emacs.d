(message "==> Loading sethmcl/lib/utils.el")

(defun sethmcl/join-dirs (prefix suffix)
  "Joins `prefix` and `suffix` into a directory path."
  (file-name-as-directory (concat prefix suffix)))

(provide 'utils)
