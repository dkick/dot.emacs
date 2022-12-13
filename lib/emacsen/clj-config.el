;;; https://emacs-lsp.github.io/lsp-mode/tutorials/clojure-guide/

(provide 'clj-config)

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

;;; https://github.com/dkick/dot.emacs

;; uncomment to use cider indentation instead of lsp
;;
;; (setq lsp-enable-indentation nil)

;; uncomment to use cider completion instead of lsp
;;
;; (setq lsp-enable-completion-at-point nil)

(setq cider-repl-prompt-function 'cider-repl-prompt-abbreviated)
