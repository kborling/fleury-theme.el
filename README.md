# fleury-theme.el

Dark Emacs theme with warm bronze/amber tones. Inspired by Ryan Fleury's debugger [live stream](https://www.twitch.tv/ryanfleury).

Maintained fork of the [original](https://github.com/ShamsParvezArka/fleury-theme.el) with fixes, broad package coverage, and WCAG AA accessible contrast.

## Preview
![Image](https://github.com/user-attachments/assets/64ef45eb-80a2-494b-898f-b09bbbb2da2f)

## Install

```elisp
(use-package fleury-theme
  :vc (:url "https://github.com/kborling/fleury-theme.el" :rev :newest)
  :config (load-theme 'fleury t))
```

## Supported Packages

Core: font-lock (including treesit faces), mode-line, fringe, isearch, diff-mode, dired, eshell, flymake, flycheck, show-paren, ediff, smerge

Completion: corfu, marginalia, orderless, completion-preview, icomplete

Development: eglot, transient, which-key, diff-hl, vc-dir, log-view, magit

Org: org-mode, org-modern

Terminal: term, eat, ansi-color

UI: tab-bar, tab-line, outline, custom widgets, helpful, deadgrep, deft, gptel

## Accessibility

Comment and line number colors adjusted for WCAG AA contrast ratio against both the background and hl-line highlight.
