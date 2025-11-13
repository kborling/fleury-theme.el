;;; fleury-theme.el --- The fleury color theme  -*- lexical-binding: t; -*-

;; Copyright (C) 2025 Shams Parvez Arka
;; Copyright (C) 2025 Kevin Borling (fork modifications)

;; Original Author: Shams Parvez Arka <parvez6826@gmail.com>
;; Maintainer: Kevin Borling
;; URL: https://github.com/kborling/fleury-theme.el
;; Original URL: https://github.com/ShamsParvezArka/fleury-theme.el
;; Version: 0.6
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

;; Color palette
(let ((rich-black         "#020202")
      (light-bronze       "#b99468")
      (charcoal-gray      "#212121")
      (charcoal-gray-lite "#1e1e1e")
      (gunmetal-blue      "#303040")
      (dark-slate         "#222425")
      (amber-gold         "#fcaa05")
      (medium-gray        "#404040")
      (jet-black          "#121212")
      (dim-gray           "#666666")
      (goldenrod          "#f0c674")
      (bright-orange      "#ffaa00")
      (dusty-rose         "#dc7575")
      (sunflower-yellow   "#edb211")
      (burnt-orange       "#de451f")
      (sky-blue           "#2895c7")
      (sky-blue-lite      "#2f2f38")
      (bright-red         "#ff0000")
      (fresh-green        "#66bc11")
      (lime-green         "#003939")
      (vivid-vermilion    "#f0500c")
      (golden-yellow      "#f0bb0c")
      (pure-black         "#000000")
      (aqua-ice           "#8ffff2")
      (dusty-sage         "#9ba290")
      (coffee-brown       "#63523d")
      
      (mode-line-foreground-active "#e7aa4d")
      (mode-line-background-active "#1a120b")
      (mode-line-border            "#161616")
      )

  (custom-theme-set-faces
   'fleury

   ;; UI Elements
   `(default ((t (:background ,rich-black :foreground ,light-bronze))))
   `(cursor ((t (:background ,fresh-green))))
   `(region ((t (:background ,lime-green))))
   `(highlight ((t (:background ,charcoal-gray-lite))))
   `(hl-line ((t (:background ,charcoal-gray-lite :extend t))))
   `(fringe ((t (:background ,dark-slate))))
   `(vertical-border ((t (:foreground ,dark-slate))))
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
   `(line-number ((t (:foreground ,medium-gray :background ,rich-black))))
   `(line-number-current-line ((t (:background ,charcoal-gray-lite :foreground ,light-bronze))))

   ;; Font Lock Faces
   `(font-lock-comment-face ((t (:foreground ,dim-gray))))
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
   `(font-lock-doc-face ((t (:foreground ,fresh-green))))

   ;; Mode Line
   `(mode-line ((t (:background ,mode-line-background-active
                                :foreground ,mode-line-foreground-active
                                :box (:line-width 1 :color ,mode-line-border :style nil)))))
   `(mode-line-inactive ((t (:background ,rich-black
                                         :foreground ,mode-line-foreground-active
                                         :box (:line-width 1 :color ,mode-line-border :style nil)))))
   `(mode-line-buffer-id ((t (:weight bold :foreground ,amber-gold))))
   `(mode-line-emphasis ((t (:foreground ,light-bronze))))
   `(mode-line-highlight ((t (:foreground ,goldenrod :box nil :weight bold))))

   ;; Header Line
   `(header-line ((t (:background ,dark-slate :foreground ,amber-gold :box (:line-width 1 :color ,mode-line-border) :extend t))))

   ;; Search
   `(isearch ((t (:background ,vivid-vermilion :foreground ,pure-black))))
   `(lazy-highlight ((t (:background ,golden-yellow :foreground ,pure-black))))

   ;; Custom Elements
   `(show-paren-match ((t (:background ,sky-blue-lite))))
   `(show-paren-mismatch ((t (:background ,dusty-sage))))

   ;; Tooltip and Popup
   `(tooltip ((t (:background ,coffee-brown :foreground ,amber-gold))))

   ;; Compilation
   `(flycheck-error ((t (:underline (:color ,bright-red :style wave)))))
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
   `(tab-bar ((t (:background ,dark-slate :foreground ,light-bronze))))
   `(tab-bar-tab ((t (:background ,mode-line-background-active :foreground ,amber-gold :box (:line-width 1 :color ,mode-line-border)))))
   `(tab-bar-tab-inactive ((t (:background ,rich-black :foreground ,dim-gray :box (:line-width 1 :color ,mode-line-border)))))

   ;; Tab Line
   `(tab-line ((t (:background ,dark-slate :foreground ,light-bronze))))
   `(tab-line-tab ((t (:background ,mode-line-background-active :foreground ,amber-gold :box (:line-width 1 :color ,mode-line-border)))))
   `(tab-line-tab-inactive ((t (:background ,rich-black :foreground ,dim-gray :box (:line-width 1 :color ,mode-line-border)))))
   `(tab-line-tab-current ((t (:background ,mode-line-background-active :foreground ,amber-gold :box (:line-width 1 :color ,mode-line-border)))))
   `(tab-line-highlight ((t (:background ,charcoal-gray-lite :foreground ,goldenrod))))
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
