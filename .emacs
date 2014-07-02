;; taskjuggler mode
(add-to-list 'load-path "~/.emacs.d/")
(require 'taskjuggler-mode)

(global-set-key "\eg" 'goto-line)
(setq latex-run-command "pdflatex")
(setq latex-pdf-view-command "xpdf")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; ========== Support Wheel Mouse Scrolling ==========

(mouse-wheel-mode t)
;; NesC mode
;;(autoload 'c-mode "c-mode" "NesC Mode" t)
;;(setq auto-mode-alist (cons '("\\.nc?\\'" . c-mode) auto-mode-alist))


;; Highlight the current line
;;(global-hl-line-mode 1)
;;(global-hl-line-mode 0)


;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

;; scrollbar right, please!
(set-scroll-bar-mode 'right)

;; use aspell instead of ispell
(setq-default ispell-program-name "aspell")

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 2)
  (setq cperl-continued-statement-offset 0)
;;  (setq cperl-extra-newline-before-brace t)
  )

;; have a history
;;(load "recent-files")
;;(recent-files-initialize)
(require 'recentf)
(recentf-mode 1)
;; save the cursor position
(require 'saveplace)
(setq-default save-place t)

;; hide the menu
(tool-bar-mode 0)

;; fancy color themes
(require 'color-theme)


(color-theme-initialize)
;;(color-theme-matrix-reloaded) ;;my own, yay!
(color-theme-matrix) ;;my own, yay!

;;;
;;; VHDL mode
;;;
(autoload 'vhdl-mode "vhdl-mode" "VHDL Mode" t)
(setq auto-mode-alist (cons '("\\.vhdl?\\'" . vhdl-mode) auto-mode-alist))
;;;
;;; Verilog mode
;;;
(autoload 'verilog-mode "verilog-mode" "Verilog Mode" t)
(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))

;; Lets try temposync support

;;(setq initials "dep14669") 
;;(setq temposync-interface (concat (or (getenv "CADENV_HOME") 
;;(getenv "HOME") "~") "/.caddata/tempocustom/etc/temposync.el")) 
;;(when (file-readable-p temposync-interface) (load-file temposync-interface))

;; kill the bell
(setq visible-bell t)


;; ugly macros be here, beware!

;; insert-print macro
(fset 'insert-print
   [?p ?r ?i ?n ?t ?  ?" ?\\ ?n ?" ?\; left left left left tab])
(global-set-key "\ep" 'insert-print)

;; new file macro
(fset 'macro-new-file
   [?e ?v ?a ?l ?  ?' ?e ?x ?e ?c ?  ?p ?e ?r ?l ?  ?- ?S ?  ?$ ?0 ?  ?$ ?{ ?1 ?+ ?" ?$ ?@ ?" ?} ?' ?  ?i ?f ?  ?0 ?\; return return ?# ?  ?d ?e ?f ?a ?u ?l ?t ?. ?p ?l ?: ?  ?T ?h ?i ?s ?  ?s ?c ?r ?i ?p ?t ?  ?d ?o ?i backspace ?e ?s ?  ?t ?h ?i ?s ?  ?a ?n ?d ?  ?t ?h ?a ?t return ?# return ?# ?  ?A ?u ?t ?h ?o ?r ?: ?  ?N ?i ?l ?s ?  ?O ?l ?e ?  ?T ?i ?p ?p ?e ?n ?h ?a ?u ?e ?r return ?# ?  ?D ?a ?t ?e ?: ?  ?J ?a ?n ?u ?a ?r ?y ?  ?1 ?s ?t ?  ?2 ?0 ?0 ?6 return return ?u ?s ?e ?  ?s ?t ?r ?i ?c ?t ?\; return ?u ?s ?e ?  ?G ?e ?t ?o ?p ?t ?: ?: ?S ?t ?d ?\; return ?u ?s ?e ?  ?D ?a ?t ?a ?: ?: ?s backspace ?D ?u ?m ?p ?e ?r ?\; return return ?m ?y ?  ?% ?o ?p ?t ?s ?\; return ?g ?e ?t ?o ?p ?t ?s ?{ ?} backspace backspace ?( ?) left ?' ?' right left ?, ?\\ ?% ?o ?p ?t ?s end ?\; left left left left left left left left left left ?h down down return return ?$ ?o ?p ?t ?s ?{ ?} left ?' ?h ?' end ?  ?o ?r backspace backspace ?a ?n ?d ?  ?d ?i ?r backspace ?e ?  ?& ?u ?s ?a ?g ?e ?\; return return return return ?s ?u ?b ?n backspace ?  ?u ?s ?a ?g ?e ?( ?) backspace backspace ?{ ?} left return return up tab backspace ?  ?  ?m ?y ?  ?$ ?m ?s ?g ?= ?< ?< ?E ?O ?M ?\; return ?d ?a ?f ?a ?u ?l ?t ?. ?p ?l ?: ?  ?T ?h ?i ?s ?  ?s ?c ?r ?i ?p ?t ?  ?d ?o ?e ?s ?  ?t ?h ?i ?s ?  ?a ?n ?d ?  ?t ?h ?a ?t return up right right backspace ?e down return ?U ?s ?a ?g ?e ?: return ?d ?e ?f ?a ?u ?l ?t ?. ?p ?l ?  ?[ ?] left ?o ?p ?t ?i ?o ?n end return return ?O ?p ?t ?i ?o ?n ?s ?: return return ?- ?h ?  ?  ?  ?  ?  ?D ?i ?s ?p ?l ?a ?y ?s ?  ?t ?h ?i ?s ?  ?m ?e ?s ?s ?a ?g ?e return])
(global-set-key "\en" 'macro-new-file)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Evince" "evince --page-index=%(outpage) %o"))))
 '(TeX-view-program-selection (quote ((output-pdf "Evince") ((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "xpdf") (output-html "xdg-open"))))
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face :inverse-video t)) (((class color) (min-colors 16)) nil))))

(put 'downcase-region 'disabled nil)

(require 'dbus)

(defun un-urlify (fname-or-url)
  "A trivial function that replaces a prefix of file:/// with just /."
  (if (string= (substring fname-or-url 0 8) "file:///")
      (substring fname-or-url 7)
    fname-or-url))

(defun th-evince-sync (file linecol &rest ignored)
  (let* ((fname (un-urlify file))
         (buf (find-buffer-visiting fname))
         (line (car linecol))
         (col (cadr linecol)))
    (if (null buf)
        (message "[Synctex]: %s is not opened..." fname)
      (switch-to-buffer buf)
      (goto-line (car linecol))
      (unless (= col -1)
        (move-to-column col)))))

(defvar *dbus-evince-signal* nil)

(defun enable-evince-sync ()
  (require 'dbus)
  (when (and
         (eq window-system 'x)
         (fboundp 'dbus-register-signal))
    (unless *dbus-evince-signal*
      (setf *dbus-evince-signal*
            (dbus-register-signal
             :session nil "/org/gnome/evince/Window/0"
             "org.gnome.evince.Window" "SyncSource"
             'th-evince-sync)))))

(add-hook 'LaTeX-mode-hook 'enable-evince-sync)
