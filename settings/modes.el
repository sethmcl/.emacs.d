;; Disable menubar
    (menu-bar-mode -1)

;; EVIL
    (require 'evil)
    (evil-mode t)

;; W3M
    (require 'w3m)
   (setq browse-url-browser-function 'w3m-goto-url-new-session)

    ;; change user-agent to android
    (setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

    ;; enable cookies
    (setq w3m-use-cookies t)

    ;; hacker news shortcut
    (defun hn ()
      (interactive)
      (browse-url "http://news.ycombinator.com"))

;; guide-key
(require 'guide-key)
(require 'helm)
(require 'sr-speedbar)
