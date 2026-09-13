# Text Capture

A minimal, private, browser-based image-to-text (OCR) converter built with HTML, CSS, and vanilla JavaScript. Designed for GitHub Pages.

## Features

- Drag-and-drop or paste (Ctrl+V) images directly
- Client-side OCR using Tesseract.js — no uploads, fully private
- Extracted text with copy and download options
- Shadcn-style minimal UI with light/dark mode
- Multi-language OCR support (English, German, French, Spanish, Italian, Portuguese, Russian, Chinese Simplified)
- Responsive 2-column layout: image upload left, result text right
- Centered action buttons (Convert / Clear)

## How to Use

1. Open `index.html` in any modern browser.
2. Upload, drag, or paste an image.
3. Click **Convert to text**.
4. View, copy, or download the extracted text.
5. Click **Clear** to reset everything.
6. Click the **Dark** button in the header to toggle dark mode.

## Development

No build tools required. Edit `index.html` directly.

- `index.html` — complete single-file application
- CSS variables in `:root` for theming
- Dark mode uses `body.dark-mode` class
- JavaScript uses `Tesseract.recognize()` for OCR

### Contributing

Pull requests are welcome. Keep the app a single file where possible for easy GitHub Pages deployment. Maintain accessibility (aria labels, keyboard navigation) and readability in both light and dark modes.

## License

MIT
