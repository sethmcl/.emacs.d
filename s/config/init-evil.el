(message "==> Loading s/lib/init-evil.el")

(use-package evil
       :ensure evil
	     :init
	     (progn
	       ;; Prevent evil from overwriting cursor color
	       (setq evil-default-cursor t)

	       ;; Leader key shortcuts
	       (use-package evil-leader
                :ensure evil-leader
			    :init (global-evil-leader-mode)
			    :config
			    (progn
			      (setq evil-leader/in-all-states t)
			      (evil-leader/set-leader ",")
			      (evil-leader/set-key
				;; "a" 'X
				"b" 'helm-buffers-list
				"c" 'evilnc-comment-or-uncomment-lines
                                "d" 'projectile-find-dir
				"e" 'eval-last-sexp
                                "f" 'projectile-find-file
				"g" 'magit-status
				;; "h" 'H
				;; "i" 'I
				;; "j" 'J
				;; "k" 'K
				;; "l" 'L
                                "m" 'ace-jump-mode
				;; "n" 'N
				;; "o" 'O
				;; "p" 'P
				"q" 'kill-buffer
				"r" 'undo-tree-redo
				"t" 'dired
				"ss" 'delete-trailing-whitespace
				;; "t" 'T
				;; "u" 'U
				;; "v" 'V
				"w" 'save-buffer
				;; "x" 'X
				;; "y" 'Y
				;; "z" 'Z
				"=" 'align-to-equals
				";" 'align-to-colons
                                "-" 'godef-jump
				)))

	       ;; Evil NerdCommenter
	       (use-package evil-nerd-commenter
                :ensure evil-nerd-commenter
			    :init
			    (progn
			      (setq evilnc-hotkey-comment-operator "gc")))

	       ;; Start evil by default
	       (evil-mode 1))

	     :config
	     (progn
	       ;; Use ido to open files
	       (define-key evil-ex-map "e " 'ido-find-file)
	       (define-key evil-ex-map "b " 'ido-switch-buffer)

	       ;; jj escapes normal mode
	       ;; (define-key evil-insert-state-map (kbd "j") 'bw-evil-escape-if-next-char-is-j)
	       (setq
		;; h/l wrap around to next lines
		evil-cross-lines t
		;; start evil-mode in normal mode
		evil-default-state 'normal)

	       ;; esc should always quit
	       (define-key evil-normal-state-map [escape] 'keyboard-quit)
	       (define-key evil-visual-state-map [escape] 'keyboard-quit)
	       (define-key minibuffer-local-map [escape] 'abort-recursive-edit)
	       (define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
	       (define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
	       (define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
	       (define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)
))

(provide 'init-evil)
