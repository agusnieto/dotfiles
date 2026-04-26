(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(defalias 'yes-or-no-p 'y-or-n-p)

(when window-system (global-hl-line-mode t))
(when window-system (global-prettify-symbols-mode t))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; deactivate dashboard
;; (setq inhibit-startup-message t)

(setq make-backup-file nil)
(setq auto-save-default nil)

;; scrollear arreglado
(setq scroll-conservatively 100)

;; silenciar campana
;; (setq ring-bell-function 'ignore)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda() (org-bullets-mode))))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))
