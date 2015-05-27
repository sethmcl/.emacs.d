(message "==> Loading s/lib/init-web-mode.el")

(use-package web-mode
  :ensure web-mode
  :init
  (progn
    (setq standard-indent 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-markup-indent-offset 2)

    (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
    (defadvice web-mode-highlight-part (around tweak-jsx activate)
      (if (equal web-mode-content-type "jsx")
          (let ((web-mode-enable-part-face nil))
            ad-do-it)
        ad-do-it))
    )
  )
(provide 'init-web-mode)
