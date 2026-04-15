# Next Slide

### 你的下个 ppt，何必是 PPT

> Describe what you want. Pick a style. Get a beautiful HTML presentation. No PowerPoint, no build tools, no dependencies.

---

## What It Does

You talk to your AI assistant in natural language. Next Slide turns your words into a polished, animated HTML presentation — a single file you can open in any browser.

```
You: "帮我做一个 AI agents 的演讲，10 页左右，科技感强一点"

→ AI asks you to pick a style (50+ options with live preview)
→ Generates a complete HTML presentation
→ Opens in your browser, ready to present
```

**Input:** natural language, markdown, or even an existing .pptx file
**Output:** one self-contained HTML file — animations, responsive layout, keyboard navigation, all built in

---

## Quick Start

```bash
# 1. Install as Claude Code skill
git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide

# 2. Use — just talk naturally
# "Make me a presentation about..."
# "帮我做个关于 XX 的 slide"
# or invoke directly:
/next-slide

# 3. Present
open my-presentation.html    # One file. Zero dependencies.
```

### Also works with

| Platform | Install |
|----------|---------|
| **Claude Code** | `git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide` |
| **Hermes Agent** | `git clone https://github.com/codesstar/next-slide ~/.hermes/skills/next-slide` |
| **OpenClaw** | `clawhub install next-slide` |
| **Any AI tool** | Paste `SKILL.md` as system prompt + reference the support files |

> Or run `bash install.sh` from a clone — it auto-detects all three and symlinks for you.

No runtime, no API keys, no vendor lock-in. Just markdown instructions + CSS/HTML references.

---

## 50+ Styles, 7 Categories

| Category | Count | Styles | Vibe |
|----------|-------|--------|------|
| **Dark** | 11 | Keynote Noir, Bold Signal, Neon Cyber, Terminal Green, Midnight Corporate, Cinema Scope, Dark Botanical, Starfield, Dark Premium, Dark Cinema, Futuristic Blue | Conferences, launches, tech talks |
| **Light** | 11 | Swiss Modern, Paper & Ink, Notebook Tabs, Pastel Geometry, Morning Brief, Campus White, Soft Landing, Watercolor Wash, Korean Soft, Claymorphism 3D, Wabi-Sabi Zen | Academic, business, teaching |
| **Editorial** | 4 | Editorial Serif, Fashion Editorial, Newsprint Broadsheet, Vintage Editorial | Magazine layouts, thought leadership |
| **Bold** | 7 | Electric Studio, Creative Voltage, Split Pastel, Pop Art, Bold Typography, Neon Brutalism, Memphis Pop | Startups, creative pitches |
| **Retro** | 5 | Grainy Retro, Art Deco Gatsby, Risograph Overprint, Vintage Poster, Retro Arcade | Nostalgic, stylized |
| **Artistic** | 7 | Surrealism Gallery, Scrapbook Portfolio, Blue Collage, Pink Handwritten, Art Nouveau Botanical, Soft Dreamy, Terracotta Earth | Art, design, portfolio |
| **Cultural** | 8 | 东方墨韵, 和風, Gradient Dreams, Blueprint, Bauhaus Primary, Swiss Grid, Aurora Mesh, Chinese Ink Wash | Cultural events, themed talks |

Each style is a complete design system: curated typography, color palette, layout patterns, signature animations, and responsive breakpoints.

**Browse all styles:** [Style Gallery](https://next-slide.vercel.app/gallery) or run `open style-gallery.html` locally after installing.

---

## How It Works

```
┌─────────────────────────────────────────────────────┐
│  1. CONTENT                                         │
│     Describe your topic, paste markdown,            │
│     or drop a .pptx file                            │
├─────────────────────────────────────────────────────┤
│  2. STYLE                                           │
│     Browse 50+ styles → pick a mood →               │
│     see 3 live previews → choose one                │
│     (or say "match this screenshot")                │
├─────────────────────────────────────────────────────┤
│  3. GENERATE                                        │
│     AI builds the full deck: proper layout,         │
│     animations, responsive CSS, navigation          │
├─────────────────────────────────────────────────────┤
│  4. DELIVER                                         │
│     Opens in browser. Press E to edit inline.       │
│     Deploy to Vercel with one command.              │
└─────────────────────────────────────────────────────┘
```

---

## Features

- **50+ curated styles** — not just color swaps, each is a distinct design language with Layout DNA
- **Zero dependencies** — single HTML file, all CSS/JS inline
- **Bilingual native** — English + Chinese with proper CJK font support
- **5 input modes** — new from scratch, markdown, PPT conversion, enhancement, reference match
- **Responsive** — fits any screen, from phone to 4K projector
- **Keyboard navigation** — arrows, space, home/end
- **Inline editing** — press `E` to edit text directly in the browser
- **One-click deploy** — `npx vercel --prod` and you have a live URL
- **Quality assurance** — auto-checks overflow, fonts, density after generation
- **Typography precision** — every style has exact clamp() values extracted from hand-crafted references

---

## Input Formats

| Format | Example |
|--------|---------|
| Natural language | "Make a 10-slide pitch deck about AI agents" |
| Markdown | Provide a `.md` file — headings become slides |
| PowerPoint | Drop a `.pptx` — content extracted and restyled |
| Reference image | Share a screenshot — AI matches the closest style |
| Enhancement | Point to an existing HTML deck — AI improves it |

---

## Design Philosophy

Next Slide isn't a template engine. It's an opinionated design system that teaches AI to think like a designer:

1. **No AI Slop** — Every style is hand-crafted with intentional typography, spacing, and motion. The AI follows exact specifications, not vibes.
2. **Layout DNA** — Each style defines its structural patterns: slide mechanism, title alignment, navigation style, background treatment, animation approach, and component structure.
3. **Typography Scale** — Precise `clamp()` values for every element ensure the AI reproduces exact font sizes, weights, line-heights, and letter-spacing.
4. **Viewport First** — Every slide fits exactly in 100vh. No scrolling. Content too long? Split into multiple slides automatically.
5. **Zero Dependencies** — One HTML file. Open it anywhere. No npm, no build step, no CDN that might go down.

---

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `←` `→` `↑` `↓` | Navigate slides |
| `Space` | Next slide |
| `Home` / `End` | First / Last |
| `E` | Toggle edit mode |

---

## Customize

Every presentation uses CSS custom properties. Override in `:root`:

```css
:root {
    --bg-primary: #0a0a0a;
    --accent: #ff6b35;
    --font-display: 'Your Font', sans-serif;
}
```

---

## File Structure

```
next-slide/
├── SKILL.md               # AI instructions (the brain)
├── STYLE_PRESETS.md        # 50+ style definitions with Layout DNA
├── style-gallery.html      # Local style browser (lightweight)
├── viewport-base.css       # Responsive CSS (included in every deck)
├── html-template.md        # HTML architecture reference
├── animation-patterns.md   # Animation snippets by mood
├── styles/                 # Reference presentations for each style
├── scripts/extract-pptx.py # PPT content extraction
├── openclaw.plugin.json    # OpenClaw plugin manifest
└── install.sh              # Auto-detect & install
```

---

## License

MIT. Copyright 2026 Callum.
