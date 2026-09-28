# Text Capture

A minimal, private, browser-based image-to-text (OCR) converter built with HTML, CSS, and vanilla JavaScript. Designed for GitHub Pages.

## Features

- Drop anywhere on the page, paste (Ctrl+V), or browse — with a full-window drag overlay
- Client-side OCR using Tesseract.js — no uploads, fully private
- **Extract text** button lives with the image preview; result is editable before copying
- Copy (with clipboard fallback) and download as `.txt`
- Live progress with friendly stage labels (loading engine → reading image) and a spinner state
- Language picker (8 languages) persisted between visits
- Polished dark/light theme that follows the system by default, with manual toggle and persistence
- Keyboard friendly: Tab to the drop zone, Enter/Space to browse, Ctrl+Enter to extract, Esc to clear
- Responsive two-column workspace that stacks on smaller screens

## How to Use

1. Open `index.html` (or the GitHub Pages URL) in any modern browser.
2. Drop, paste, or browse for an image.
3. Click **Extract text** (or press Ctrl+Enter).
4. Edit the text if needed, then copy or download it.
5. Click **Clear** (or press Esc) to reset everything.
6. Toggle the theme with the sun/moon button in the header.

## Development

No build tools required. Edit `index.html` directly.

- `index.html` — complete single-file application
- CSS variables on `:root` / `[data-theme="dark"]` for theming
- Theme uses the `data-theme` attribute on `<html>` (system-aware, persisted)
- JavaScript uses `Tesseract.recognize()` for OCR

### Contributing

Pull requests are welcome. Keep the app a single file where possible for easy GitHub Pages deployment. Maintain accessibility (aria labels, keyboard navigation) and readability in both light and dark modes.

## License

MIT
