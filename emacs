
;;emacs 24 bug workaround for downloading packages
(setq package-set-signature nil)
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(setq inhibit-splash-screen t)
(transient-mark-mode 1)
(require 'org)
(load-theme 'solarized-light t)
(setq light 1)
;; Toggle between solarized-light and dark
(defun toggle-dark () (interactive)
       (when (= light 1)
	     (load-theme 'solarized-dark t)
	     (setq light 0)
	     (message '%s' light))
	(when (= light 0)
	     (load-theme 'solarized-light t)
	      (setq light 1)))
       
(global-set-key (kbd "<f5>") 'toggle-dark)

;; Open pdf in Zathura
(eval-after-load "org"
  '(progn
     ;; .txt files aren't in the list initially, but in case that changes
     ;; in a future version of org, use if to avoid errors
     (if (assoc "\\.txt\\'" org-file-apps)
         (setcdr (assoc "\\.txt\\'" org-file-apps) "gedit %s")
       (add-to-list 'org-file-apps '("\\.txt\\'" . "gedit %s") t))
     ;; Change .pdf association directly within the alist
     (setcdr (assoc "\\.pdf\\'" org-file-apps) "zathura %s")))

;; Open web links in firefox

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox-esr")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/Documents/uni_research/sabbatical.org")))
 '(safe-local-variable-values
   (quote
    ((eval when
	   (and
	    (buffer-file-name)
	    (string-match-p "\\.h\\'"
			    (buffer-file-name))
	    (not
	     (string-match-p "/gnulib/"
			     (buffer-file-name))))
	   (c++-mode)
	   (c-set-style "gnu")))))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

