(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages
  '(cider
    clj-refactor
    clojure-mode
    clojure-mode-extra-font-locking
    centaur-tabs
    company
    dracula-theme
    evil
    flycheck
    flycheck-clj-kondo
    git-gutter
    git-gutter-fringe
    git-link
    goto-chg
    helm
    helm-projectile
    lsp-mode
    lsp-treemacs
    markdown-mode
    paredit
    projectile
    projectile-ripgrep
    smooth-scrolling
    treemacs
    treemacs-projectile
    undo-fu
    rainbow-delimiters
    rainbow-mode
    which-key))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(load-theme 'dracula t)
(add-to-list 'default-frame-alist
             '(font . "Hack Nerd Font Mono-18"))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)

(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

;(setq evil-toggle-key "C-<Home>")
(use-package evil
  :init
  (setq evil-undo-system 'undo-fu))
(evil-mode 1)
;(defcustom evil-toggle-key "C-M-e"


(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(with-eval-after-load 'lsp-mode
(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))


(custom-set-variables
 '(cider-repl-print-length 1000000)
 '(cider-interactive-eval-output-destination (quote repl-buffer)))

(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))
(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))


(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<wheel-down>") 'scroll-down-line)
  (global-set-key (kbd "<wheel-up>") 'scroll-up-line)
  )


;; https://emacs-lsp.github.io/lsp-mode/tutorials/clojure-guide/
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
      ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
      )


(use-package which-key
  :ensure t
  :config
  (which-key-mode +1))

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/src"))
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))


(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

