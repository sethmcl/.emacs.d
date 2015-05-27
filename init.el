;;; Special thanks to https://github.com/bling/dotemacs and others for inspiration.
(defgroup s nil
  "Custom configuration for s."
  :group 'local)

;; Define constant to point to .emacs.d directory
(defconst s/dotfiles-dir
  (file-name-directory
   (or (buffer-file-name) load-file-name))
  "Base path for emacs config.")

(defcustom s-cache-directory (concat user-emacs-directory ".cache/")
  "The storage location for persistent files."
  :group 's)

(add-to-list 'load-path (concat user-emacs-directory "use-package"))
(add-to-list 'load-path (concat user-emacs-directory "s/config"))
(add-to-list 'load-path (concat user-emacs-directory "s/lib"))

(require 'cl)
(require 'init-packages)
(require 'use-package)
(require 'utils)
(require 'envy)

;; Load custom configuration. These modules are found in .emacs.d/config.
(defcustom s-modules
  '(
    init-core
    init-ui
    init-evil
    init-yasnippet
    init-restclient
    init-ace-jump-mode
    init-helm
    init-helm-ag
    init-projectile
    init-helm-projectile
    init-magit
    init-w3m
    init-web-mode
    init-js-mode
    init-bookmark+
    init-flycheck
    )
  "Modules enabled in s."
  :group 's)

(add-to-list 'after-init-hook
       (lambda ()
         (dolist (module s-modules)
     (with-demoted-errors "##### INIT-ERROR ##### %s"
       (require module)))))

;; fix path
(setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
(setenv "PATH" (concat "/Users/u779/.nvm/v0.10.26/bin" ":" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/Users/u779/.nvm/v0.10.26/bin")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   (quote
    ("d6f7b88bb019d77cf8ce762c12a779e10881ee0f3a35dbea48ec65285d021759" "8b651cd3b951ea7283630e2fd37e6d1371345fd836db8d39e2f870eaabe72730" "828350ea159f0a1a7789183327868f0d71b5ee00b8ea3fe080d4550454c57122" "b185b4fb2c25bcf50e686653a9b0d8879eef46005d3e830417e7153bf69781a4" "b91ae471999e3f9b8bccf1b6761c878df2f570c393c03dd037476f05f64df1fb" "c14f454eb281c171a055e213e2c52bf64f1856db307caa3cf23a126d8ff0182e" "761d4034f1bde0a984f5c69a2ce298197e7fc0c0a35fe59e31b454db8a8ffe00" "2cc1f31e964a4bf7e14563811eb1ae8c84a5befe949c6c1510c100563fef676a" "8df6e6f05e39ba8b32dff03d04e1b9316565a48169f9225597b541876eac1404" "69ecb398063d78aa9f98fa0ee1df041645ef2c5c31411042c3ec3b2adbbd1589" "6ffb4ea6b0178a9c5276f94a5b2cb21470582e3bc185a044ae7a8bcceb53d89f" "0bee260b2f53764ede03b71d2e1d97c07343fd9103adf1ef96683e3a2029aa26" "55e53896565188a294f352f77f474a210f252b1197d3bed6455b79d6c27d1241" "21df36d5ec97049c8381f45c301307edabbabca483d75a571ec5368e3cc24c2a" "6a7a6b9dea120fb92790be9971b0f414bffd09e33411ddcf7f0c2931bbde58ca" "db233ce7030f318d879ae7fd213c7d51a4c445f65ce11142965dd68778b11f05" "3a0dcca985c1bec3457e0394e46ed2fcf505da147c198769bf18bd2f6ff94be8" "fe0689d4d5965158be1fdaab0c71e1883ee6c16e1b93991ba95b08c57c537b90" "0fb7dcf08e6ba671fc80e5e163d748db9ab6cea3b7dafe909547019596974c71" "46f4a2883b96ec786359860224bdbb2589039cd1de052d515758f252d5f99bf4" "8df3ad0d3e026bc85f89e80233aec1f6bd7ed95e1df59aa3350fdbd89acb94cb" "923b2e021db4320e69032984da194137c7552888075e2f2d4515208865d2f160" "4fdcccc961aae0c6588f7120209d945460daf5675a402e2c9ffa24393306d4ef" "cc41277eff9bfd5ba3d23874d398a3caeb087b432c3776103c899e274ca0875d" "8b007d684fab9c679996d3df0201a10bc39a833c23173979d9308e09da674dab" "0353d4eeacd0db72d0c42f2286d253dfe41b3bd782e38b158516c19fc746eac2" "c2f4fee808838ffcbb916d4276a6c00ac2df4e5b0fb314fc7c6a65f7b16e2025" "d5de5ffdc352e765d4cdf02716941d932b9587dc2f768912e123cde24221b77e" "ea489f6710a3da0738e7dbdfc124df06a4e3ae82f191ce66c2af3e0a15e99b90" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" default)))
 '(flycheck-disabled-checkers (quote (javascript-jshint))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
    (let ((indent-tabs-mode nil))
        ad-do-it))
        (ad-activate 'align-regexp)

;; Align to equals signs
(defun align-to-equals (begin end)
    "Align region to equal signs"
       (interactive "r")
       (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

;; Align to colons
(defun align-to-colons (begin end)
    "Align region to colons"
       (interactive "r")
          (align-regexp begin end "\\(\\s-*\\):" 1 1 ))
