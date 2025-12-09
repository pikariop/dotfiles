;; -*- lexical-binding: t -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(package-initialize)

(setq package-selected-packages
  '(;aggressive-indent
    blamer
    cider
    cider-eval-sexp-fu
    clj-refactor
    clojure-mode
    clojure-mode-extra-font-locking
    command-log-mode
    centaur-tabs
    company
;    dashboard
    dracula-theme
    diminish
    evil
    flycheck
    flycheck-clj-kondo
    git-gutter
    git-gutter-fringe
    git-link
    goto-chg
    helm
    helm-projectile
    helm-cider
 ;   highlight-parentheses
    hydra
    kaocha-runner
    logview
    lsp-mode
    lsp-treemacs
    lsp-ui
    magit
    markdown-mode
    pandoc-mode
    paredit
    projectile
    projectile-ripgrep
    smartparens
    evil-smartparens
    smooth-scrolling
    transient
    treemacs
    treemacs-evil
    treemacs-projectile
    undo-fu
    rainbow-delimiters
    rainbow-mode
    which-key
    ws-butler))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))


(load-theme 'dracula t)
(add-to-list 'default-frame-alist
             '(font . "Hack Nerd Font Mono-18"))
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq backup-directory-alist "~/.emacs.d/backup")
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(setq ns-function-modifier 'hyper)
(setq mac-function-modifier 'hyper)
(setq comment-column 0)
(setq truncate-string-ellipsis "…")
(setq-default indent-tabs-mode nil)
(delete-selection-mode t)
(column-number-mode)
(glyphless-display-mode)
(setq ns-pop-up-frames nil)
(setq use-short-answers t)
(setq ring-bell-function 'ignore)
(setq require-final-newline t)
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)
(setq create-lockfiles nil)
(global-hl-line-mode +1)

;(whitespace-mode)
;(progn
;  ;; Make whitespace-mode with very basic background coloring for whitespaces.
;  ;; http://xahlee.info/emacs/emacs/whitespace-mode.html
;  (setq whitespace-style (quote (tabs tab-mark)))
;
;  ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
;  (setq whitespace-display-mappings
;        ;; all numbers are unicode codepoint in decimal
;        '(
;          ;; 32 is SPACE, 183 is MIDDLE DOT ·
;          (space-mark 32 [183])
;          ;; 10 is LINE FEED, 182 isPILCROW SIGN ¶
;          (newline-mark 10 [182 10])
;          ;; 9 is tab, 182 isPILCROW SIGN ¶
;          (tab-mark 9 [9655 9])
;          )))

;; https://emacs.stackexchange.com/a/62615
(setq help-window-select t)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(unless (display-graphic-p)
  (xterm-mouse-mode 1)
  (global-set-key (kbd "<wheel-down>") 'scroll-down-line)
  (global-set-key (kbd "<wheel-up>") 'scroll-up-line))
(keymap-global-set "s-<mouse-1>" 'browse-url-at-mouse)
(keymap-global-set "M-<tab>" 'other-window)
(keymap-global-set "M-S-<tab>" (lambda ()
                                 (interactive)
                                 (other-window -1)))
(keymap-global-set "s-w" (lambda ()
                           (interactive)
                           (kill-buffer nil)))
(keymap-global-set "s-q" 'delete-window)
(keymap-global-set "<f3>" 'treemacs)
(keymap-global-set "<f4>" 'display-line-numbers-mode)
(keymap-global-set "<f5>" 'visual-line-mode)
(keymap-global-set "<escape>" 'keyboard-escape-quit)

(setq mouse-drag-copy-region nil)

(winner-mode 1)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(use-package recentf
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-menu-items 25)
  ;:config
 ; (dolist (itm '("^/ssh:" "^/sudo:" "~/.emacs.d/.cache/.*" "recentf$"))
 ;          (add-to-list 'recentf-exclude itm))
  )


;(use-package dashboard
;  :ensure t
;  :config
;  (dashboard-setup-startup-hook))


(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

(setq undo-limit 67108864) ; 64mb.
(setq undo-strong-limit 100663296) ; 96mb.
(setq undo-outer-limit 1006632960) ; 960mb.


(use-package evil
  :init (setq evil-undo-system 'undo-fu)
  :hook (prog-mode clojure-mode clojurescript-mode emacs-lisp-mode)
  :config
  (setq evil-insert-state-cursor '(bar "green")
        evil-move-beyond-eol t
        evil-normal-state-cursor '(box "medium sea green")
        evil-visual-state-cursor '(hollow "orange")
        evil-emacs-state-cursor '(box "white")
        evil-cross-lines t
        evil-toggle-key "s-<home>")
  (evil-add-command-properties #'lsp-find-definition :jump t))

(with-eval-after-load 'evil
  (dolist (mode '(cider-popup-buffer-mode
                  cider-inspector-mode
                  cider-stacktrace-mode
                  lsp-browser-mode
                  flycheck-error-list-mode
                  help-mode
                  xref--xref-buffer-mode))
    (evil-set-initial-state mode 'emacs)))

;(dolist (mode '(emacs-lisp-mode))
;  (evil-set-initial-state mode 'evil))


(require 'clojure-mode-extra-font-locking)
(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)


(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
;(global-unset-key (kbd "s-l"))
;(setq lsp-keymap-prefix "s-l")
;(setq lsp-keymap-prefix "H-l")

;; https://emacs-lsp.github.io/lsp-mode/tutorials/clojure-guide/
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1)
					; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
					; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp
(setq clojure-indent-style 'align-arguments)
(setq clojure-indent-keyword-style 'align-arguments)
(setq clojure-align-forms-automatically nil)

;(use-package aggressive-indent
;  :ensure aggressive-indent
;  :hook (prog-mode clojure-mode emacs-lisp-mode))

;(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-debug-use-overlays nil)
 '(cider-interactive-eval-output-destination 'repl-buffer)
 '(cider-lein-parameters "with-profile +dev repl :headless")
 '(cider-log-use-logview t)
 '(cider-repl-print-length 1000000)
 '(cider-stacktrace-default-filters '(java tooling dup))
 '(cider-stacktrace-fill-column nil)
 '(cider-use-overlays t)
 '(git-gutter:ask-p nil)
 '(helm-M-x-reverse-history nil)
 '(history-delete-duplicates t)
 '(lsp-ui-doc-show-with-mouse nil)
 '(lsp-ui-peek-list-width 80)
 '(lsp-ui-peek-peek-height 120)
 '(lsp-ui-peek-show-directory nil)
 '(lsp-ui-sideline-show-hover nil))


(setq cider-known-endpoints
      '(("dev" "localhost" "12345")
        ("test" "localhost" "54321")))

(add-hook 'cider-mode-hook
          (lambda ()
            (cider-enable-cider-completion-style)
            (define-key cider-mode-map (kbd "s-'") 'cider-switch-to-repl-buffer)
            (define-key cider-mode-map (kbd "C-c TAB") 'cider-format-defun)
            (define-key cider-mode-map (kbd "<C-tab>") 'cider-format-defun)))

(add-hook 'cider-repl-mode-hook
          (lambda ()
            (cider-enable-cider-completion-style)
            (define-key cider-repl-mode-map (kbd "s-'") 'cider-switch-to-last-clojure-buffer)
            (define-key cider-repl-mode-map (kbd "C-:") 'clojure-toggle-keyword-string)
            (define-key cider-repl-mode-map (kbd "<S-return>") 'cider-repl-newline-and-indent)))


(use-package smartparens
  :ensure smartparens  ;; install the package
  :hook (prog-mode clojure-mode clojurescript-mode emacs-lisp-mode cider-repl-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config)
  (setq sp-navigate-interactive-always-progress-point t) 
  (turn-on-smartparens-strict-mode)
  (show-smartparens-global-mode t))

(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(define-key smartparens-mode-map (kbd "C-S-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-S-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)
(define-key smartparens-mode-map (kbd "C-M-S-t") (lambda () (interactive) (sp-transpose-sexp -1)))
(define-key smartparens-mode-map (kbd "M-<right>") 'sp-up-sexp)
(define-key smartparens-mode-map (kbd "M-<left>") 'sp-backward-down-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-backward-up-sexp)
(define-key smartparens-mode-map (kbd "C-<right>") 'sp-down-sexp)
(define-key smartparens-mode-map (kbd "C-<down>") 'sp-forward-sexp)
(define-key smartparens-mode-map (kbd "C-<up>") 'sp-backward-sexp)
(define-key smartparens-mode-map (kbd "M-<up>") 'sp-backward-parallel-sexp)
(define-key smartparens-mode-map (kbd "M-<down>") 'sp-forward-parallel-sexp)
(define-key smartparens-mode-map (kbd "S-<left>") 'sp-backward-symbol)
(define-key smartparens-mode-map (kbd "S-<right>") 'sp-forward-symbol)
(define-key smartparens-mode-map (kbd "C-<home>") 'sp-beginning-of-sexp)
(define-key smartparens-mode-map (kbd "C-<end>") 'sp-end-of-sexp)
(define-key smartparens-mode-map (kbd "<prior>") 'sp-beginning-of-previous-sexp)
(define-key smartparens-mode-map (kbd "<next>") 'sp-beginning-of-next-sexp)
(define-key smartparens-mode-map (kbd "S-<prior>") 'sp-end-of-previous-sexp)
(define-key smartparens-mode-map (kbd "S-<next>") 'sp-end-of-next-sexp)

(define-key smartparens-mode-map (kbd "C-M-c") 'sp-copy-sexp)
(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-<up>") 'sp-raise-sexp)
(define-key smartparens-mode-map (kbd "C-M-<down>") 'sp-unwrap-sexp)
(define-key smartparens-mode-map (kbd "C-M-s") 'sp-split-sexp)
(define-key smartparens-mode-map (kbd "C-M-j") 'sp-join-sexp)
(define-key smartparens-mode-map (kbd "C-<backspace>") 'sp-backward-delete-word)
(define-key smartparens-mode-map (kbd "C-<delete>") 'sp-delete-word)
(define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key smartparens-mode-map (kbd "C-<tab>") 'sp-indent-defun)


(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))
(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))


(global-unset-key (kbd "s-g"))
(global-set-key (kbd "s-g <backspace>") 'git-gutter:revert-hunk)
(global-set-key (kbd "s-g <up>") 'git-gutter:previous-hunk)
(global-set-key (kbd "s-g <down>") 'git-gutter:next-hunk)
(global-set-key (kbd "s-g l") 'git-link)

(setq git-link-default-branch "master")

(defun git-link-current-branch ()
  (interactive)
  (setq my-default-branch 'git-link-default-branch)
  (setq git-link-default-branch (git-link--current-branch))
  (git-link)
  (setq git-link-default-branch 'my-default-branch))

(global-set-key (kbd "s-g S-l") 'git-link-current-branch)

(use-package which-key
  :ensure t
  :custom
  (which-key-sort-order 'which-key-key-order-alpha)
  (which-key-idle-delay 0.4)
  (which-key-max-description-length 50)
  :config
  (which-key-mode +1))


(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/src"))
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (setq projectile-completion-system 'helm)
  (projectile-mode +1))

(setq helm-move-to-line-cycle-in-source nil)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "s-b") 'helm-buffers-list)
(global-set-key (kbd "M-i") #'helm-imenu-anywhere)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-s-v") 'helm-show-kill-ring)
(global-set-key (kbd "s-a") 'helm-apropos)

(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))


(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  ;(remove-hook 'kill-buffer-hook 'centaur-tabs-buffer-track-killed)
  :custom
  (centaur-tabs-set-icons nil)
  (centaur-tabs-show-new-tab-button nil)
  (centaur-tabs-set-close-button nil)
  (centaur-tabs-show-count t)
  :bind
  ("M-s-<left>" . centaur-tabs-backward)
  ("M-s-<right>" . centaur-tabs-forward)
  ("C-M-s-<left>" . centaur-tabs-move-current-tab-to-left)
  ("C-M-s-<right>" . centaur-tabs-move-current-tab-to-right)
  (:map evil-normal-state-map
        ("g t" . centaur-tabs-forward)
        ("g T" . centaur-tabs-backward)))


(use-package super-save
  :ensure t
  :config
  (super-save-mode +1))
(setq auto-save-default nil)


(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'markdown-mode-hook #'display-line-numbers-mode)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)



;(defhydra hydra-docs (global-map "<f1>")
  ; cider, clojure-docs
;  )


(require 'diminish)

(diminish 'clj-refactor-mode)
(diminish 'highlight-symbol-mode)
(diminish 'projectile-mode)
(diminish 'git-gutter-mode)
(diminish 'command-log-mode)
;(diminish 'projectile-mode)
(diminish 'company-mode)
;(diminish 'global-whitespace-mode)
(diminish 'eldoc-mode)
(diminish 'super-save-mode)
(diminish 'which-key-mode)
(diminish 'command-log-mode)
(diminish 'evil-smartparens-mode)
(diminish 'lsp-lens-mode)

;(use-package highlight-parentheses
;  :ensure t
; ; :hook (prog-mode-hook . #'highlight-parentheses-mode)
;  )


(use-package ws-butler
  :ensure t
  :custom
  (require-final-newline t)
  :hook
  (prog-mode . ws-butler-mode)
  (emacs-lisp-mode . ws-butler-mode))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-ui-peek-selection ((t (:inherit match))))
 '(match ((t (:background "purple3" :foreground "gray100")))))

(use-package blamer
  :ensure t
  :bind (("s-i" . blamer-show-posframe-commit-info)
         ("s-g b" . blamer-mode))
  :defer 20
  :custom
  (blamer-view 'overlay-right)
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  (blamer-prettify-time-p nil)
  (blamer-author-formatter "✎ %s ")
  (blamer-datetime-formatter "[%s]")
  (blamer-commit-formatter " ● %s")
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :height 140
                    :italic t)))
  ;:config
  ;(global-blamer-mode 1)
  )
;; Sources
; https://blog.sumtypeofway.com/posts/emacs-config.html


(defun my-dwim-with-thing-at-mouse (Click)
  (interactive "e")
  (let ((xp (posn-point (event-start Click))))
    (goto-char xp)
;(browse url)
    ; (go to definition)
    ))

(use-package magit
  :ensure t
  :bind (:map magit-status-mode-map
              ("<return>" . magit-diff-visit-file-other-window) ))
