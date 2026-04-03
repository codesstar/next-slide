# Next Slide

**你的下个 slide，何必是 PPT**

AI-powered HTML presentation generator. 26+ curated styles across 4 categories, zero dependencies, bilingual support (English / Chinese). Just describe what you want, pick a style, and get a polished, self-contained HTML deck you can open in any browser.

---

## Installation

### OpenClaw

```bash
clawhub install next-slide
```

### Claude Code (manual)

```bash
git clone https://github.com/user/next-slide.git
cp -r next-slide ~/.claude/skills/
```

### Quick Install (auto-detect)

```bash
curl -sL https://raw.githubusercontent.com/user/next-slide/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/user/next-slide.git
cd next-slide
./install.sh
```

The install script detects whether you have Claude Code, OpenClaw, or both, and installs accordingly.

---

## Quick Start

1. **Invoke the skill** -- say `/next-slide` or "帮我做个演示"
2. **Follow the interactive flow** -- describe your topic, pick a style, get your slides
3. **Open in any browser** -- output is a single HTML file, no build step needed

That's it. No config files, no build steps, no PowerPoint required.

## Features

- **26 curated styles** across 4 visual categories
- **Bilingual** -- English and Chinese content supported natively
- **PPT conversion** -- convert existing `.pptx` files to styled HTML slides
- **Markdown conversion** -- turn a Markdown outline into a full presentation
- **Reference style matching** -- provide a screenshot or URL and match its aesthetic
- **Inline editing** -- press `E` to enter edit mode and tweak content directly
- **One-click deploy** -- output is a single HTML file, host it anywhere

## Style Categories

| Category | Count | Description |
|----------|-------|-------------|
| **Dark** | 8 | Cinematic, minimal, high-contrast themes |
| **Light** | 8 | Clean, editorial, airy designs |
| **Bold** | 5 | High-energy, vibrant, statement-making |
| **Cultural** | 5 | Region-inspired aesthetics and typography |

Each style includes curated typography, color palettes, layout patterns, and signature elements.

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Arrow Left` / `Arrow Right` | Previous / Next slide |
| `Space` | Next slide |
| `Home` / `End` | First / Last slide |
| `E` | Toggle edit mode |

## Customization

Every generated presentation uses CSS custom properties. Override them in `:root` to restyle globally:

```css
:root {
    --bg-primary: #0a0a0a;
    --text-primary: #ffffff;
    --accent: #ff6b35;
}
```

To change typography, swap the Google Fonts `<link>` in the `<head>` and update the `font-family` declarations.

## Input Formats

| Format | How to use |
|--------|------------|
| Natural language | "Make a 10-slide pitch deck about AI agents" |
| Markdown outline | Provide a `.md` file with `# Slide Title` headings |
| PowerPoint | Provide a `.pptx` file for conversion |
| Reference image | Share a screenshot to match its visual style |

## Examples

```
/next-slide
> Topic: Q1 product review
> Style: Keynote Noir
> Slides: 12

/next-slide
> 帮我把这个 PPT 转成网页版，用 Swiss Poster 风格
```

## Compatibility

Next Slide works on:

- **Claude Code** -- install as a skill in `~/.claude/skills/`
- **OpenClaw** -- install via `clawhub install next-slide`
- **Any AI tool with system prompts** -- paste the contents of `SKILL.md` as a system prompt, and reference the supporting files (`STYLE_PRESETS.md`, `viewport-base.css`, etc.) as needed

The core skill is a set of markdown instructions and CSS/HTML references. No runtime dependencies, no proprietary APIs. It works anywhere an LLM can read instructions and generate HTML.

## File Structure

| File | Purpose |
|------|---------|
| `SKILL.md` | Core instructions for the AI |
| `STYLE_PRESETS.md` | 26+ curated visual style definitions |
| `viewport-base.css` | Mandatory responsive CSS included in every presentation |
| `html-template.md` | HTML architecture and JS feature reference |
| `animation-patterns.md` | Animation snippets and patterns |
| `scripts/extract-pptx.py` | PowerPoint content extraction script |
| `openclaw.plugin.json` | OpenClaw plugin manifest |

## Credits & License

MIT License. Copyright 2026 Callum.

Style presets are original designs inspired by real-world design references.
