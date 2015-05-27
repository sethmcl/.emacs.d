(message "==> Loading s/lib/init-ui.el")

;; Turn off toolbar / scrollbar / menubar
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Turn off startup screen -- show *scratch* instead
(setq inhibit-startup-screen t
      initial-buffer-choice t)

;; Ensure new emacsclients attach to current frame, instead of creating a new frame
(setq ns-pop-up-frames nil)

;; Enable line and column numbers
(line-number-mode 1)
(column-number-mode 1)
(linum-mode t)

;; Set color theme
(load-theme 'mr-igloo)

;; Set cursor color to yellow
;; @see http://stackoverflow.com/questions/4642835/how-to-change-the-cursor-color-on-emacs
(add-to-list 'default-frame-alist '(cursor-color . "yellow"))

;; Show modifier combinations quicker
(setq echo-keystrokes 0.1)

;; Set font size
(set-face-attribute 'default nil :height 160)

;; Do not use visual bell
(setq visible-bell nil)

;; Only use the bell when a valid error case occurs
(setq ring-bell-function
      (lambda ()
	"Only rings the bell if it's not a valid quit case."
	(unless (memq this-command
		      '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
	  (ding))))

;; Integrate with system clipboard in terminal
(when (and (not (display-graphic-p)) (eq system-type 'darwin))
  (defun s/use-pbpaste ()
    "Use `pbpaste` to paste text from the system clipboard."
    (shell-command-to-string "pbpaste"))

  (defun s/use-pbcopy (text &optional push)
    "Use `pbcopy` to copy text to system clipboard."
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
	(process-send-string proc text)
	(process-send-eof proc))))

  (setq interprogram-paste-function 's/use-pbpaste)
  (setq interprogram-cut-function 's/use-pbcopy))

(provide 'init-ui)
