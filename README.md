# Next Slide 🦞

### 你的下个 slide，何必是 PPT

> Describe what you want. Pick a style. Get a beautiful HTML presentation. No PowerPoint, no build tools, no dependencies.

---

## What It Does

You talk to your AI assistant in natural language. Next Slide turns your words into a polished, animated HTML presentation — a single file you can open in any browser.

```
You: "帮我做一个 AI agents 的演讲，10 页左右，科技感强一点"

→ AI asks you to pick a style (26 options with live preview)
→ Generates a complete HTML presentation
→ Opens in your browser, ready to present
```

**Input:** natural language, markdown, or even an existing .pptx file
**Output:** one self-contained HTML file — animations, responsive layout, keyboard navigation, all built in

---

## 30-Second Demo

```
# 1. Install
clawhub install next-slide          # OpenClaw
# or
git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide  # Claude Code

# 2. Use
/next-slide
# or just say: "Make me a presentation about..."

# 3. Present
open my-presentation.html           # That's it. One file. Zero dependencies.
```

---

## 26 Styles, 5 Categories

| Category | Styles | Vibe |
|----------|--------|------|
| **Dark** (8) | Keynote Noir, Bold Signal, Neon Cyber, Terminal Green, Midnight Corporate, Cinema Scope, Dark Botanical, Starfield | Conferences, launches, tech talks |
| **Light** (8) | Swiss Modern, Paper & Ink, Notebook Tabs, Pastel Geometry, Morning Brief, Campus White, Soft Landing, Watercolor Wash | Academic, business, teaching |
| **Bold** (5) | Electric Studio, Creative Voltage, Split Pastel, Vintage Editorial, Pop Art | Startups, creative pitches |
| **Cultural** (5) | 东方墨韵, 和風, Gradient Dreams, Retro Arcade, Blueprint | Cultural events, themed talks |

Each style is a complete design system: curated typography, color palette, layout patterns, signature animations, and responsive breakpoints.

---

## How The Flow Works

```
┌─────────────────────────────────────────────────────┐
│  1. CONTENT                                         │
│     Describe your topic, paste markdown,            │
│     or drop a .pptx file                            │
├─────────────────────────────────────────────────────┤
│  2. STYLE                                           │
│     Pick a mood → see 3 live previews → choose one  │
│     (or say "match this screenshot")                │
├─────────────────────────────────────────────────────┤
│  3. GENERATE                                        │
│     AI builds the full deck with proper layout,     │
│     animations, responsive CSS, and navigation      │
├─────────────────────────────────────────────────────┤
│  4. DELIVER                                         │
│     Opens in browser. Press E to edit inline.       │
│     Deploy to Vercel with one command.              │
└─────────────────────────────────────────────────────┘
```

---

## Features

- **26+ curated styles** — not just color swaps, each is a distinct design language
- **Zero dependencies** — single HTML file, all CSS/JS inline
- **Bilingual native** — English + Chinese with proper CJK font support
- **5 input modes** — new from scratch, markdown, PPT conversion, enhancement, reference match
- **Responsive** — fits any screen, from phone to 4K projector
- **Keyboard navigation** — arrows, space, home/end
- **Inline editing** — press `E` to edit text directly in the browser
- **One-click deploy** — `npx vercel --prod` and you have a live URL
- **Quality assurance** — auto-checks overflow, fonts, density after generation

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

## Works Everywhere

| Platform | Install |
|----------|---------|
| **OpenClaw** | `clawhub install next-slide` |
| **Claude Code** | `git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide` |
| **Any AI tool** | Paste `SKILL.md` as system prompt + reference the support files |

The core is just markdown instructions + CSS/HTML references. No runtime, no API keys, no vendor lock-in.

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
├── STYLE_PRESETS.md        # 26 style definitions
├── viewport-base.css       # Responsive CSS (included in every deck)
├── html-template.md        # HTML architecture reference
├── animation-patterns.md   # Animation snippets by mood
├── scripts/extract-pptx.py # PPT content extraction
├── openclaw.plugin.json    # OpenClaw plugin manifest
└── install.sh              # Auto-detect & install
```

---

## License

MIT. Copyright 2026 Callum.

Made with 🦞
