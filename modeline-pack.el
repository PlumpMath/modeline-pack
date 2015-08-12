;;; modeline-pack.el --- Modeline setup

;;; Commentary:

;;; Code:

(use-package dash)
(use-package s)
(use-package diminish)

(defvar modeline-pack-clean-mode-alist
  `((auto-complete-mode       " α")
    (yas-minor-mode           " γ")
    (paredit-mode             " Φ")
    (eldoc-mode               "")
    (abbrev-mode              "")
    (guide-key-mode           "")
    (guru-mode                "")
    (undo-tree-mode           " τ")
    (volatile-highlights-mode " υ")
    (elisp-slime-nav-mode     " δ")
    (nrepl-mode               " ηζ")
    (nrepl-interaction-mode   " ηζ")
    (cider-mode               " ηζ")
    (cider-interaction        " ηζ")
    ;; Major modes
    (clojure-mode             "cλ")
    (hi-lock-mode             "")
    (python-mode              "pλ")
    (emacs-lisp-mode          "eλ")
    (markdown-mode            "md")
    (magit                    "ma")
    (haskell-mode             "hλa")
    (tuareg-mode              "mλ")
    (flymake-mode             "fm")
    (js2-mode                 "jλ")
    (company-mode             " Ψ"))
  "List of modes, clean mode string representation.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline instead of the original.")
(defun modeline-pack-clean-mode-line ()
  "Pretty symbol for the modeline."
  (interactive)
  (-map (lambda (mmode)
          (-let (((mode mode-str) mmode))
            (if (eq mode major-mode)
                (setq mode-name (s-trim mode-str))
              (when (assq mode minor-mode-alist)
                (diminish mode (s-trim-right mode-str))))))
        modeline-pack-clean-mode-alist))

(modeline-pack-clean-mode-line)

;;; Greek letters - C-u C-\ greek ;; C-\ to revert to default
;;; ς ε ρ τ υ θ ι ο π α σ δ φ γ η ξ κ λ ζ χ ψ ω β ν μ

(provide 'modeline-pack)
;;; modeline-pack ends here
