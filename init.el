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
;;Change org-refile to use a file
(setq org-refile-use-outline-path 'file)
(setq org-refile-targets '((org-agenda-files :level . 1)))

(require 'weechat)
(load-file "~/.emacs.d/zenburn.el")
(require 'zenburn)

(zenburn)

;; Open pdf in Zathura
(eval-after-load "org"
  '(progn
     ;; .txt files aren't in the list initially, but in case that changes
     ;; in a future version of org, use if to avoid errors
     (if (assoc "\\.txt\\'" org-file-apps)
         (setcdr (assoc "\\.txt\\'" org-file-apps) "gedit %s")
       (add-to-list 'org-file-apps '("\\.txt\\'" . "gedit %s") t))
     ;; Change .pdf association directly within the alist
     (setcdr (assoc "\\.pdf\\'" org-file-apps) "zathura %s")
     (if (assoc "\\.mobi\\'" org-file-apps)
     	 (setcdr (assoc "\\.mobi\\'" org-file-apps) "ebook-viewer %s")
	 (add-to-list 'org-file-apps '("\\.mobi\\'" . "ebook-viewer %s") t))))

;; Open web links in firefox

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox-esr")

;; open Main org file on startup
(find-file "~/Documents/uni_research/inbox.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list nil)
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(custom-safe-themes
   (quote
    ("bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "53ec5d5e734055fdf53569aeb465841130d4dbef9db57349572d770f478987a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("~/Documents/uni_research/inbox.org" "~/Documents/uni_research/Projects.org" "~/Documents/uni_research/mountaineering.org" "~/Documents/uni_research/university.org")))
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

