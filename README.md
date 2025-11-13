# fleury-theme.el
Emacs theme inspired by **Ryan Fleury**'s debugger [live stream](https://www.twitch.tv/ryanfleury) at twitch.

## 🎴 Preview
![Image](https://github.com/user-attachments/assets/64ef45eb-80a2-494b-898f-b09bbbb2da2f)

## Installation

### Using use-package with :vc (Emacs 29+)

```elisp
(use-package fleury-theme
  :vc (:fetcher github :repo "your-username/fleury-theme" :rev :newest)
  :config
  (load-theme 'fleury t))
```

### Manual Installation

1. Clone this repository or download `fleury-theme.el`
2. Place it in a directory in your `load-path` or add the directory to your `load-path`:

```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
```

3. Load the theme:

```elisp
(load-theme 'fleury t)
```

## Optional Customizations

The theme intentionally does not include global settings or hooks, following Emacs theme best practices. However, you may want to add these customizations to your init file:

### Highlight Current Line

Enable `hl-line-mode` in programming modes:

```elisp
(add-hook 'prog-mode-hook 'hl-line-mode)
```

### Custom Cursor Styling

Set a box cursor by default:

```elisp
(setq-default cursor-type 'box)
```

Or use a dynamic cursor that changes based on the mode:

```elisp
(defun my/update-cursor-type ()
  "Use a bar cursor in prog-mode and text-mode, box cursor otherwise."
  (setq cursor-type
        (if (derived-mode-p 'prog-mode 'text-mode)
            '(bar . 2)  ; 2-pixel wide bar
          'box)))

(add-hook 'post-command-hook 'my/update-cursor-type)
```

## License

MIT License - See end of `fleury-theme.el` for full license text.
