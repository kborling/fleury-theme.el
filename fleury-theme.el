;;; fleury-theme.el --- The fleury color theme  -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Shams Parvez Arka
;; Copyright (C) 2025 Kevin Borling (fork modifications)

;; Original Author: Shams Parvez Arka <parvez6826@gmail.com>
;; Maintainer: Kevin Borling
;; URL: https://github.com/kborling/fleury-theme.el
;; Original URL: https://github.com/ShamsParvezArka/fleury-theme.el
;; Version: 0.7
;; Package-Requires: ((emacs "24.1"))
;; Keywords: faces, themes
;; SPDX-License-Identifier: MIT

;; This file is NOT part of GNU Emacs.

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; The fleury color theme inspired by Ryan Fleury's debugger live stream.
;;
;; This is a maintained fork with fixes and enhancements including:
;; - Fixed theme loading issues
;; - Added Emacs 29.1+ font-lock-function-call-face support
;; - Removed inappropriate hooks (moved to user configuration)
;; - Added extensive package support (corfu, marginalia, diff-hl, flymake, etc.)
;; - Added complete default UI component coverage (tab-bar, tab-line, widgets, etc.)
;; - Fixed byte-compilation issues
;; - Proper Emacs Lisp package format compliance
;;
;; "Coming up with an original idea in 21st century is tough,
;; even my dreams aren't original anymore!"
;;  - Original theme author

;;; Code:


(deftheme fleury "The fleury color theme.")

(defvar fleury-distinct-line-numbers t
  "When non-nil, line numbers have a distinct background.")

;; Color palette
(let ((rich-black         "#020202")
      (light-bronze       "#b99468")
      (charcoal-gray      "#212121")
      (charcoal-gray-lite "#1e1e1e")
      (gunmetal-blue      "#303040")
      (dark-slate         "#222425")
      (amber-gold         "#fcaa05")
      (medium-gray        "#686868")
      (jet-black          "#121212")
      (dim-gray           "#888888")
      (goldenrod          "#f0c674")
      (bright-orange      "#ffa900")
      (dusty-rose         "#dc7575")
      (sunflower-yellow   "#edb211")
      (burnt-orange       "#de451f")
      (sky-blue           "#2895c7")
      (sky-blue-lite      "#2f2f38")
      (bright-red         "#ff0000")
      (fresh-green        "#00EE00")
      (lime-green         "#003939")
      (vivid-vermilion    "#f0500c")
      (golden-yellow      "#f0bb0c")
      (pure-black         "#000000")
      (aqua-ice           "#8ffff2")
      (dusty-sage         "#9ba290")
      (coffee-brown       "#63523d")
      (dark-red           "#bd2d2d")
      (mauve-pink         "#c9598a")
      (muted-brown        "#5c4d3c")
      (line-num-bg        "#101010")
      (line-num-fg        "#404040")
      (ghost-green        "#4E5E46")

      (mode-line-foreground-active "#e7aa4d")
      (mode-line-background-active "#1a120b")
      (mode-line-border            "#161616")
      )

  (custom-theme-set-faces
   'fleury

   ;; UI Elements
   `(default ((t (:background ,rich-black :foreground ,light-bronze))))
   `(cursor ((t (:background ,fresh-green))))
   `(region ((t (:background ,gunmetal-blue))))
   `(highlight ((t (:background ,charcoal-gray-lite))))
   `(hl-line ((t (:background ,charcoal-gray-lite :extend t))))
   `(fringe ((t (:background ,rich-black))))
   `(vertical-border ((t (:foreground ,charcoal-gray))))
   `(minibuffer-prompt ((t (:foreground ,amber-gold :weight bold))))
   `(link ((t (:foreground ,sky-blue :underline t))))
   `(link-visited ((t (:foreground ,dusty-rose :underline t))))
   `(button ((t (:underline t))))
   `(shadow ((t (:foreground ,dim-gray))))
   `(success ((t (:foreground ,fresh-green :weight bold))))
   `(warning ((t (:foreground ,golden-yellow :weight bold))))
   `(error ((t (:foreground ,bright-red))))
   `(trailing-whitespace ((t (:background ,bright-red))))
   `(escape-glyph ((t (:foreground ,golden-yellow :weight bold))))

   ;; Line Numbers
   `(line-number ((t (:foreground ,(if fleury-distinct-line-numbers line-num-fg medium-gray)
                      ,@(when fleury-distinct-line-numbers
                          (list :background line-num-bg))))))
   `(line-number-current-line ((t (:foreground ,light-bronze
                                   ,@(when fleury-distinct-line-numbers
                                       (list :background charcoal-gray-lite))))))

   ;; Font Lock Faces
   `(font-lock-comment-face ((t (:foreground ,dim-gray :slant italic))))
   `(font-lock-keyword-face ((t (:foreground ,goldenrod))))
   `(font-lock-string-face ((t (:foreground ,bright-orange))))
   `(font-lock-constant-face ((t (:foreground ,bright-orange))))
   `(font-lock-builtin-face ((t (:foreground ,dusty-rose))))
   `(font-lock-preprocessor-face ((t (:foreground ,dusty-rose))))
   `(font-lock-type-face ((t (:foreground ,sunflower-yellow))))
   `(font-lock-function-name-face ((t (:foreground ,burnt-orange))))
   `(font-lock-function-call-face ((t (:foreground ,burnt-orange))))
   `(font-lock-variable-name-face ((t (:foreground ,light-bronze))))
   `(font-lock-variable-use-face ((t (:foreground ,sky-blue))))
   `(font-lock-warning-face ((t (:foreground ,bright-red :weight bold))))
   `(font-lock-doc-face ((t (:foreground ,fresh-green :slant italic))))
   ;; Treesit font-lock faces
   `(font-lock-bracket-face ((t (:foreground ,muted-brown))))
   `(font-lock-delimiter-face ((t (:foreground ,muted-brown))))
   `(font-lock-escape-face ((t (:foreground ,aqua-ice))))
   `(font-lock-misc-punctuation-face ((t (:foreground ,muted-brown))))
   `(font-lock-number-face ((t (:foreground ,bright-orange))))
   `(font-lock-operator-face ((t (:foreground ,dark-red))))
   `(font-lock-property-name-face ((t (:foreground ,light-bronze))))
   `(font-lock-property-use-face ((t (:foreground ,light-bronze))))
   `(font-lock-punctuation-face ((t (:foreground ,muted-brown))))
   `(font-lock-regexp-face ((t (:foreground ,fresh-green))))

   ;; Mode Line
   `(mode-line ((t (:background ,mode-line-background-active
                                :foreground ,mode-line-foreground-active
                                :box (:line-width (4 . 2) :color ,mode-line-background-active)))))
   `(mode-line-inactive ((t (:background ,rich-black
                                         :foreground ,dim-gray
                                         :box (:line-width (4 . 2) :color ,rich-black)))))
   `(mode-line-buffer-id ((t (:weight bold :foreground ,amber-gold))))
   `(mode-line-emphasis ((t (:foreground ,light-bronze))))
   `(mode-line-highlight ((t (:foreground ,goldenrod :box nil :weight bold))))

   ;; Header Line
   `(header-line ((t (:background ,rich-black :foreground ,amber-gold :box (:line-width 4 :color ,rich-black) :extend t))))

   ;; Search
   `(isearch ((t (:background ,vivid-vermilion :foreground ,pure-black))))
   `(lazy-highlight ((t (:background ,golden-yellow :foreground ,pure-black))))

   ;; Borders
   `(border ((t (:background ,dark-slate :foreground ,light-bronze))))
   `(internal-border ((t (:background ,rich-black))))
   `(fill-column-indicator ((t (:foreground ,charcoal-gray :weight semilight))))

   ;; Paren matching
   `(show-paren-match ((t (:background ,sky-blue-lite))))
   `(show-paren-mismatch ((t (:background ,bright-red :foreground ,pure-black :weight bold))))

   ;; Tooltip and Popup
   `(tooltip ((t (:background ,coffee-brown :foreground ,amber-gold))))

   ;; Flycheck
   `(flycheck-error ((((supports :underline (:style wave)))
                      (:underline (:style wave :color ,bright-red) :inherit unspecified))
                     (t (:foreground ,bright-red :weight bold :underline t))))
   `(flycheck-warning ((((supports :underline (:style wave)))
                        (:underline (:style wave :color ,golden-yellow) :inherit unspecified))
                       (t (:foreground ,golden-yellow :weight bold :underline t))))
   `(flycheck-info ((((supports :underline (:style wave)))
                     (:underline (:style wave :color ,sky-blue) :inherit unspecified))
                    (t (:foreground ,sky-blue :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,bright-red :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,golden-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,sky-blue :weight bold))))

   ;; Compilation
   `(compilation-info ((t (:foreground ,fresh-green :inherit unspecified))))
   `(compilation-warning ((t (:foreground ,coffee-brown :weight bold :inherit unspecified))))
   `(compilation-error ((t (:foreground ,bright-red))))
   `(compilation-mode-line-fail ((t (:foreground ,bright-red :weight bold :inherit unspecified))))
   `(compilation-mode-line-exit ((t (:foreground ,fresh-green :weight bold :inherit unspecified))))

   ;; Dired
   `(dired-directory ((t (:weight bold :foreground ,sky-blue))))

   ;; Flymake
   `(flymake-error ((((supports :underline (:style wave)))
                     (:underline (:style wave :color ,bright-red) :inherit unspecified))
                    (t (:foreground ,bright-red :weight bold :underline t))))
   `(flymake-warning ((((supports :underline (:style wave)))
                       (:underline (:style wave :color ,golden-yellow) :inherit unspecified))
                      (t (:foreground ,golden-yellow :weight bold :underline t))))
   `(flymake-note ((((supports :underline (:style wave)))
                    (:underline (:style wave :color ,sky-blue) :inherit unspecified))
                   (t (:foreground ,sky-blue :weight bold :underline t))))

   ;; Diff Mode
   `(diff-added ((t (:foreground ,fresh-green :background ,rich-black :extend t))))
   `(diff-changed ((t (:foreground ,golden-yellow :background ,rich-black :extend t))))
   `(diff-removed ((t (:foreground ,bright-red :background ,rich-black :extend t))))
   `(diff-refine-added ((t (:background ,fresh-green :foreground ,pure-black))))
   `(diff-refine-changed ((t (:background ,golden-yellow :foreground ,pure-black))))
   `(diff-refine-removed ((t (:background ,bright-red :foreground ,pure-black))))
   `(diff-header ((t (:background ,dark-slate :foreground ,light-bronze))))
   `(diff-file-header ((t (:background ,dark-slate :foreground ,amber-gold :weight bold))))

   ;; Diff-HL
   `(diff-hl-change ((t (:foreground ,golden-yellow :background ,rich-black))))
   `(diff-hl-delete ((t (:foreground ,bright-red :background ,rich-black))))
   `(diff-hl-insert ((t (:foreground ,fresh-green :background ,rich-black))))

   ;; Corfu (Completion)
   `(corfu-default ((t (:foreground ,light-bronze :background ,dark-slate))))
   `(corfu-current ((t (:foreground ,amber-gold :background ,charcoal-gray-lite :weight bold))))
   `(corfu-bar ((t (:background ,medium-gray))))
   `(corfu-border ((t (:background ,dark-slate))))

   ;; Marginalia
   `(marginalia-documentation ((t (:foreground ,dim-gray))))
   `(marginalia-file-name ((t (:foreground ,light-bronze))))
   `(marginalia-key ((t (:foreground ,goldenrod))))

   ;; Helpful
   `(helpful-heading ((t (:foreground ,amber-gold :weight bold :height 1.2))))

   ;; Deadgrep
   `(deadgrep-filename-face ((t (:foreground ,sky-blue :weight bold))))
   `(deadgrep-match-face ((t (:foreground ,amber-gold :weight bold))))

   ;; Eshell
   `(eshell-prompt ((t (:foreground ,amber-gold :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,dusty-rose :weight bold))))
   `(eshell-ls-backup ((t (:foreground ,dim-gray))))
   `(eshell-ls-clutter ((t (:foreground ,dim-gray))))
   `(eshell-ls-directory ((t (:foreground ,sky-blue :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,fresh-green :weight bold))))
   `(eshell-ls-missing ((t (:foreground ,bright-red))))
   `(eshell-ls-product ((t (:foreground ,bright-orange))))
   `(eshell-ls-special ((t (:foreground ,golden-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,dusty-rose :weight bold))))

   ;; HL-Todo
   `(hl-todo ((t (:foreground ,amber-gold :weight bold))))

   ;; Which Function
   `(which-func ((t (:foreground ,sky-blue))))

   ;; Completions
   `(completions-annotations ((t (:foreground ,dim-gray))))
   `(completions-common-part ((t (:foreground ,amber-gold))))
   `(completions-first-difference ((t (:inherit bold :foreground ,light-bronze))))

   ;; Icomplete
   `(icomplete-first-match ((t (:foreground ,amber-gold :weight bold))))
   `(icomplete-selected-match ((t (:background ,charcoal-gray-lite :foreground ,golden-yellow :weight bold))))

   ;; Tab Bar
   `(tab-bar ((t (:foreground ,dim-gray :background ,mode-line-background-active))))
   `(tab-bar-tab ((t (:background ,dark-slate
                                   :foreground ,amber-gold
                                   :weight bold
                                   :box (:line-width (4 . 2) :color ,dark-slate)))))
   `(tab-bar-tab-inactive ((t (:background ,mode-line-background-active
                                            :foreground ,medium-gray
                                            :box (:line-width (4 . 2) :color ,mode-line-background-active)))))

   ;; Tab Line
   `(tab-line ((t (:foreground ,dim-gray :background ,mode-line-background-active))))
   `(tab-line-tab ((t (:background ,dark-slate
                                    :foreground ,amber-gold
                                    :weight bold
                                    :box (:line-width (4 . 2) :color ,dark-slate)))))
   `(tab-line-tab-inactive ((t (:background ,mode-line-background-active
                                             :foreground ,medium-gray
                                             :box (:line-width (4 . 2) :color ,mode-line-background-active)))))
   `(tab-line-tab-current ((t (:background ,dark-slate
                                            :foreground ,amber-gold
                                            :weight bold
                                            :box (:line-width (4 . 2) :color ,dark-slate)))))
   `(tab-line-highlight ((t (:foreground ,goldenrod))))
   `(tab-line-close-highlight ((t (:foreground ,bright-red))))

   ;; Widget Faces
   `(widget-field ((t (:background ,dark-slate :foreground ,light-bronze))))
   `(widget-button ((t (:underline t :weight bold))))
   `(widget-button-pressed ((t (:foreground ,amber-gold))))
   `(widget-documentation ((t (:foreground ,dim-gray))))

   ;; Custom Faces
   `(custom-button ((t (:background ,dark-slate :foreground ,light-bronze :box (:line-width 2 :style released-button)))))
   `(custom-button-pressed ((t (:background ,charcoal-gray-lite :foreground ,amber-gold :box (:line-width 2 :style pressed-button)))))
   `(custom-button-mouse ((t (:background ,charcoal-gray-lite :foreground ,goldenrod :box (:line-width 2 :style released-button)))))
   `(custom-variable-tag ((t (:foreground ,sky-blue :weight bold))))
   `(custom-group-tag ((t (:foreground ,goldenrod :weight bold :height 1.2))))
   `(custom-state ((t (:foreground ,fresh-green))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,amber-gold))))
   `(orderless-match-face-1 ((t (:foreground ,sky-blue))))
   `(orderless-match-face-2 ((t (:foreground ,fresh-green))))
   `(orderless-match-face-3 ((t (:foreground ,dusty-rose))))

   ;; Transient
   `(transient-heading ((t (:foreground ,amber-gold :weight bold))))
   `(transient-key ((t (:foreground ,goldenrod :weight bold))))
   `(transient-argument ((t (:foreground ,fresh-green :weight bold))))
   `(transient-value ((t (:foreground ,sky-blue))))
   `(transient-inactive-argument ((t (:foreground ,dim-gray))))
   `(transient-inactive-value ((t (:foreground ,dim-gray))))
   `(transient-unreachable ((t (:foreground ,dim-gray))))
   `(transient-unreachable-key ((t (:foreground ,dim-gray))))
   `(transient-enabled-suffix ((t (:foreground ,fresh-green :weight bold))))
   `(transient-disabled-suffix ((t (:foreground ,bright-red :weight bold))))

   ;; Eglot
   `(eglot-highlight-symbol-face ((t (:background ,charcoal-gray :weight bold))))
   `(eglot-diagnostic-tag-unnecessary-face ((t (:foreground ,dim-gray :underline t))))
   `(eglot-diagnostic-tag-deprecated-face ((t (:foreground ,dim-gray :strike-through t))))

   ;; Ediff
   `(ediff-current-diff-A ((t (:background "#2a1010" :extend t))))
   `(ediff-current-diff-B ((t (:background "#102a10" :extend t))))
   `(ediff-current-diff-C ((t (:background "#10102a" :extend t))))
   `(ediff-fine-diff-A ((t (:background ,bright-red :foreground ,pure-black))))
   `(ediff-fine-diff-B ((t (:background ,fresh-green :foreground ,pure-black))))
   `(ediff-fine-diff-C ((t (:background ,sky-blue :foreground ,pure-black))))
   `(ediff-even-diff-A ((t (:background ,charcoal-gray))))
   `(ediff-even-diff-B ((t (:background ,charcoal-gray))))
   `(ediff-odd-diff-A ((t (:background ,dark-slate))))
   `(ediff-odd-diff-B ((t (:background ,dark-slate))))

   ;; Which-key
   `(which-key-key-face ((t (:foreground ,goldenrod :weight bold))))
   `(which-key-separator-face ((t (:foreground ,dim-gray))))
   `(which-key-note-face ((t (:foreground ,dim-gray))))
   `(which-key-command-description-face ((t (:foreground ,light-bronze))))
   `(which-key-group-description-face ((t (:foreground ,sky-blue))))

   ;; Outline
   `(outline-1 ((t (:foreground ,amber-gold))))
   `(outline-2 ((t (:foreground ,fresh-green))))
   `(outline-3 ((t (:foreground ,sky-blue))))
   `(outline-4 ((t (:foreground ,dusty-rose))))
   `(outline-5 ((t (:foreground ,goldenrod))))
   `(outline-6 ((t (:foreground ,burnt-orange))))
   `(outline-7 ((t (:foreground ,sunflower-yellow))))
   `(outline-8 ((t (:foreground ,bright-orange))))

   ;; Org Mode
   `(org-level-1 ((t (:foreground ,amber-gold :weight bold))))
   `(org-level-2 ((t (:foreground ,fresh-green :weight bold))))
   `(org-level-3 ((t (:foreground ,sky-blue :weight bold))))
   `(org-level-4 ((t (:foreground ,dusty-rose :weight bold))))
   `(org-level-5 ((t (:foreground ,goldenrod))))
   `(org-level-6 ((t (:foreground ,burnt-orange))))
   `(org-level-7 ((t (:foreground ,sunflower-yellow))))
   `(org-level-8 ((t (:foreground ,bright-orange))))
   `(org-block ((t (:background ,jet-black :foreground ,light-bronze :extend t))))
   `(org-block-begin-line ((t (:foreground ,dim-gray :background ,jet-black :extend t))))
   `(org-block-end-line ((t (:inherit org-block-begin-line))))
   `(org-code ((t (:foreground ,bright-orange))))
   `(org-verbatim ((t (:foreground ,bright-orange))))
   `(org-document-title ((t (:foreground ,amber-gold :weight bold :height 1.3))))
   `(org-document-info ((t (:foreground ,dusty-rose))))
   `(org-document-info-keyword ((t (:foreground ,dim-gray))))
   `(org-meta-line ((t (:foreground ,dim-gray))))
   `(org-link ((t (:foreground ,sky-blue :underline t))))
   `(org-todo ((t (:foreground ,bright-red :weight bold))))
   `(org-done ((t (:foreground ,fresh-green :weight bold))))
   `(org-headline-done ((t (:foreground ,dim-gray))))
   `(org-date ((t (:foreground ,sky-blue :underline t))))
   `(org-table ((t (:foreground ,sky-blue))))
   `(org-tag ((t (:weight bold))))
   `(org-ellipsis ((t (:foreground ,dim-gray))))
   `(org-hide ((t (:foreground ,rich-black))))
   `(org-indent ((t (:foreground ,rich-black))))
   `(org-agenda-date-today ((t (:foreground ,amber-gold :weight bold))))
   `(org-agenda-structure ((t (:foreground ,dim-gray))))
   `(org-scheduled ((t (:foreground ,fresh-green))))
   `(org-scheduled-today ((t (:foreground ,sky-blue))))
   `(org-warning ((t (:foreground ,bright-red :weight bold))))
   `(org-upcoming-deadline ((t (:foreground ,goldenrod))))
   `(org-checkbox ((t (:foreground ,light-bronze))))
   `(org-footnote ((t (:foreground ,sky-blue :underline t))))

   ;; Org-modern
   `(org-modern-symbol ((t (:foreground ,light-bronze))))
   `(org-modern-label ((t (:foreground ,light-bronze :background ,dark-slate :box (:line-width 1 :color ,charcoal-gray)))))
   `(org-modern-done ((t (:inherit org-modern-label :foreground ,fresh-green))))
   `(org-modern-todo ((t (:inherit org-modern-label :foreground ,bright-red))))
   `(org-modern-tag ((t (:inherit org-modern-label :foreground ,goldenrod))))
   `(org-modern-date-active ((t (:inherit org-modern-label :foreground ,sky-blue))))
   `(org-modern-date-inactive ((t (:inherit org-modern-label :foreground ,dim-gray))))
   `(org-modern-priority ((t (:inherit org-modern-label :foreground ,amber-gold))))

   ;; Term / Ansi-term / Vterm
   `(term-color-black ((t (:foreground ,rich-black :background ,rich-black))))
   `(term-color-red ((t (:foreground ,bright-red :background ,dusty-rose))))
   `(term-color-green ((t (:foreground ,fresh-green :background ,fresh-green))))
   `(term-color-yellow ((t (:foreground ,golden-yellow :background ,goldenrod))))
   `(term-color-blue ((t (:foreground ,sky-blue :background ,sky-blue))))
   `(term-color-magenta ((t (:foreground ,dusty-rose :background ,dusty-rose))))
   `(term-color-cyan ((t (:foreground ,aqua-ice :background ,aqua-ice))))
   `(term-color-white ((t (:foreground ,light-bronze :background ,light-bronze))))

   ;; Ansi-color (Emacs 28+)
   `(ansi-color-black ((t (:foreground ,rich-black :background ,rich-black))))
   `(ansi-color-red ((t (:foreground ,bright-red :background ,bright-red))))
   `(ansi-color-green ((t (:foreground ,fresh-green :background ,fresh-green))))
   `(ansi-color-yellow ((t (:foreground ,golden-yellow :background ,golden-yellow))))
   `(ansi-color-blue ((t (:foreground ,sky-blue :background ,sky-blue))))
   `(ansi-color-magenta ((t (:foreground ,dusty-rose :background ,dusty-rose))))
   `(ansi-color-cyan ((t (:foreground ,aqua-ice :background ,aqua-ice))))
   `(ansi-color-white ((t (:foreground ,light-bronze :background ,light-bronze))))
   `(ansi-color-bright-black ((t (:foreground ,dim-gray :background ,dim-gray))))
   `(ansi-color-bright-red ((t (:foreground ,vivid-vermilion :background ,vivid-vermilion))))
   `(ansi-color-bright-green ((t (:foreground ,fresh-green :background ,fresh-green))))
   `(ansi-color-bright-yellow ((t (:foreground ,goldenrod :background ,goldenrod))))
   `(ansi-color-bright-blue ((t (:foreground ,sky-blue :background ,sky-blue))))
   `(ansi-color-bright-magenta ((t (:foreground ,dusty-rose :background ,dusty-rose))))
   `(ansi-color-bright-cyan ((t (:foreground ,aqua-ice :background ,aqua-ice))))
   `(ansi-color-bright-white ((t (:foreground ,light-bronze :background ,light-bronze))))

   ;; Eat
   `(eat-term-color-0 ((t (:foreground ,rich-black :background ,rich-black))))
   `(eat-term-color-1 ((t (:foreground ,bright-red :background ,bright-red))))
   `(eat-term-color-2 ((t (:foreground ,fresh-green :background ,fresh-green))))
   `(eat-term-color-3 ((t (:foreground ,golden-yellow :background ,golden-yellow))))
   `(eat-term-color-4 ((t (:foreground ,sky-blue :background ,sky-blue))))
   `(eat-term-color-5 ((t (:foreground ,dusty-rose :background ,dusty-rose))))
   `(eat-term-color-6 ((t (:foreground ,aqua-ice :background ,aqua-ice))))
   `(eat-term-color-7 ((t (:foreground ,light-bronze :background ,light-bronze))))

   ;; Smerge
   `(smerge-upper ((t (:background "#102a10" :extend t))))
   `(smerge-lower ((t (:background "#2a1010" :extend t))))
   `(smerge-markers ((t (:background ,dark-slate :extend t))))
   `(smerge-refined-added ((t (:background ,fresh-green :foreground ,pure-black))))
   `(smerge-refined-removed ((t (:background ,bright-red :foreground ,pure-black))))

   ;; Completion-preview
   `(completion-preview ((t (:foreground ,ghost-green :slant italic))))
   `(completion-preview-exact ((t (:foreground ,dusty-sage :slant italic))))

   ;; Gptel
   `(gptel-pre-response-face ((t (:foreground ,dim-gray :slant italic))))
   `(gptel-post-response-face ((t (:foreground ,light-bronze))))

   ;; Deft
   `(deft-title-face ((t (:foreground ,amber-gold :weight bold))))
   `(deft-summary-face ((t (:foreground ,dim-gray))))
   `(deft-filter-string-face ((t (:foreground ,goldenrod :weight bold))))
   `(deft-time-face ((t (:foreground ,sky-blue))))
   `(deft-separator-face ((t (:foreground ,dim-gray))))

   ;; VC-dir
   `(vc-dir-header ((t (:foreground ,amber-gold :weight bold))))
   `(vc-dir-header-value ((t (:foreground ,sky-blue))))
   `(vc-dir-directory ((t (:foreground ,sky-blue :weight bold))))
   `(vc-dir-file ((t (:foreground ,light-bronze))))
   `(vc-dir-mark-indicator ((t (:foreground ,goldenrod :weight bold))))
   `(vc-dir-status-edited ((t (:foreground ,golden-yellow))))
   `(vc-dir-status-up-to-date ((t (:foreground ,fresh-green))))
   `(vc-dir-status-added ((t (:foreground ,fresh-green :weight bold))))
   `(vc-dir-status-removed ((t (:foreground ,bright-red :weight bold))))
   `(vc-dir-status-conflict ((t (:foreground ,bright-red :weight bold :underline t))))
   `(vc-dir-status-ignored ((t (:foreground ,dim-gray))))
   `(vc-dir-status-unregistered ((t (:foreground ,dusty-sage))))

   ;; Log-view
   `(log-view-file ((t (:foreground ,sky-blue :weight bold))))
   `(log-view-message ((t (:foreground ,light-bronze))))
   `(log-edit-summary ((t (:foreground ,amber-gold))))
   `(log-edit-header ((t (:foreground ,dim-gray))))

   ;; Magit
   `(magit-section-heading ((t (:foreground ,amber-gold :weight bold))))
   `(magit-section-highlight ((t (:background ,charcoal-gray-lite :extend t))))
   `(magit-branch-local ((t (:foreground ,sky-blue :weight bold))))
   `(magit-branch-remote ((t (:foreground ,fresh-green :weight bold))))
   `(magit-branch-current ((t (:foreground ,amber-gold :weight bold :box t))))
   `(magit-tag ((t (:foreground ,golden-yellow :weight bold))))
   `(magit-hash ((t (:foreground ,dusty-sage))))
   `(magit-diff-file-heading ((t (:foreground ,amber-gold :weight bold))))
   `(magit-diff-hunk-heading ((t (:foreground ,sky-blue :background ,dark-slate))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,sky-blue :background ,charcoal-gray-lite))))
   `(magit-diff-context ((t (:foreground ,light-bronze))))
   `(magit-diff-context-highlight ((t (:foreground ,light-bronze :background ,charcoal-gray-lite))))
   `(magit-diff-added ((t (:foreground ,fresh-green :background ,rich-black))))
   `(magit-diff-added-highlight ((t (:foreground ,fresh-green :background ,charcoal-gray-lite))))
   `(magit-diff-removed ((t (:foreground ,bright-red :background ,rich-black))))
   `(magit-diff-removed-highlight ((t (:foreground ,bright-red :background ,charcoal-gray-lite))))
   `(magit-diffstat-added ((t (:foreground ,fresh-green))))
   `(magit-diffstat-removed ((t (:foreground ,bright-red))))
   `(magit-log-author ((t (:foreground ,dusty-rose))))
   `(magit-log-date ((t (:foreground ,sky-blue))))
   `(magit-log-graph ((t (:foreground ,light-bronze))))
   `(magit-blame-heading ((t (:foreground ,light-bronze :background ,dark-slate))))
   `(magit-blame-hash ((t (:foreground ,dusty-sage))))
   `(magit-blame-name ((t (:foreground ,dusty-rose))))
   `(magit-blame-date ((t (:foreground ,sky-blue))))

   ;; Bookmark / Eldoc
   `(bookmark-face ((t (:foreground ,amber-gold :background ,dark-slate))))
   `(eldoc-highlight-function-argument ((t (:foreground ,amber-gold :weight bold))))
   ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'fleury)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:
;;; fleury-theme.el ends here
