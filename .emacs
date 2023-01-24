;; overriding image.el function image-type-available-p
;;
;; https://emacs.stackexchange.com/a/74801
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
	 (init-image-library type))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See
;; `package-archive-priorities` and `package-pinned-packages`. Most
;; users will not need or want to do this.
;;
;;(add-to-list 'package-archives
;;             '("melpa-stable" . "https://stable.melpa.org/packages/")
;;             t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company lsp-mode flycheck-clj-kondo flycheck-clojure clj-refactor yaml-mode yaml smartparens slime exec-path-from-shell evil cider))
 '(uniquify-buffer-name-style 'post-forward nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/lib/emacsen/dot.emacs.el")

(put 'narrow-to-region 'disabled nil)
