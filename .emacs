(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Trying to improve performance from scattered tips ... these have
;; not been researched very well
;; (setq auto-window-vscroll nil)
;; (setq gc-cons-threshold (* 10 1024 1024))
;; (setq read-process-output-max (* 1024 1024))

(use-package exec-path-from-shell :ensure t
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))

;;(use-package auto-dark :ensure t
;;  :config (auto-dark-mode t))
(use-package cider :ensure t :defer t
  :config
  (setq cider-repl-prompt-function 'cider-repl-prompt-abbreviated)
  (setq cider-clojure-cli-global-aliases ":user"))
(use-package company :ensure t)
(use-package dap-mode :ensure t)
(use-package lsp-mode :ensure t
  :hook (clojure-mode clojurec-mode clojurescript-mode))
(use-package revbufs :ensure t)
(use-package smartparens :ensure t
  :config (require 'smartparens-config))
(use-package terraform-mode :ensure t)
(use-package uniquify
  :config (setq uniquify-buffer-name-style 'post-forward))
(use-package whitespace :ensure t)
;; (use-package whitespace-cleanup-mode :ensure t
;;   :config (global-whitespace-cleanup-mode))
(use-package yasnippet :ensure t)
(use-package yaml-mode :ensure t)
(use-package zprint-format :ensure t)

(use-package flycheck :ensure t)
(use-package flycheck-clj-kondo :ensure t)
(use-package clojure-mode :ensure t
  :config (require 'flycheck-clj-kondo))

(global-auto-revert-mode)

(show-paren-mode)
(smartparens-global-mode)

(setq column-number-mode t)
(setq make-backup-files nil)

(defun copy-selected-text (start end)
  (interactive "r")
    (if (use-region-p)
        (let ((text (buffer-substring-no-properties start end)))
          (shell-command (concat "echo '" text "' | clip.exe")))))

;;;
;;; The following have been transcribed from _Writing GNU Emacs
;;; Extensions_.
;;;

(defadvice switch-to-buffer (before existing-buffer activate compile)
  "When interactive, switch to existing buffers only, unless given a
prefix arguemnt."
  (interactive (list (read-buffer "Switch to buffer: "
                                  (other-buffer)
                                  (null current-prefix-arg)))))

(defadvice switch-to-buffer-other-window
  (before existing-buffer-other-window activate compile)
  "When interactive, switch to existing buffers only, unless given a
prefix arguemnt."
  (interactive (list (read-buffer "Switch to buffer: "
                                  (other-buffer)
                                  (null current-prefix-arg)))))

(defadvice switch-to-buffer-other-frame
  (before existing-buffer-other-window activate compile)
  "When interactive, switch to existing buffers only, unless given a
prefix arguemnt."
  (interactive (list (read-buffer "Switch to buffer: "
                                  (other-buffer)
                                  (null current-prefix-arg)))))

;;;
;;; Define our own wacky new elisp thingees
;;;

(defmacro save-emacs-state (&rest body)
  "Combination of save-window-excursion, save-excursion, and
save-restriction, as these are frequently used together."
  `(save-window-excursion
    (save-excursion
      (save-restriction
        ,@body))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(font-use-system-font t)
 '(package-selected-packages nil)
 '(safe-local-variable-values
   '((eval progn (define-clojure-indent (try-step 1)))
     (cider-clojure-cli-aliases . ":dev:dev/config:dbs:test")
     (cider-clojure-cli-aliases . ":dev:dev/libs:dbs:test")
     (cider-clojure-cli-aliases . ":dev:dbs:test")
     (cider-clojure-cli-aliases . ":dev:dbs"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "PT Mono" :foundry "nil" :slant normal :weight regular :height 140 :width normal)))))
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
