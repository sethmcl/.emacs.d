;; Add elisp directory to load path
(let ((base (concat user-emacs-directory "elisp")))
  (add-to-list 'load-path base)
  (dolist (dir (directory-files base t))
    (when (and (file-directory-p dir)
	       (not (equal (file-name-nondirectory dir) ".."))
	       (not (equal (file-name-nondirectory dir) ".")))
      (add-to-list 'load-path dir))))

;; show parenthesis match
(show-paren-mode 1)
(setq show-parent-style 'expression)

;; Turn on line highlighting in all buffers
(global-hl-line-mode t)

;; Load custom.el file
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
