---
project: next-slide
updated: 2026-04-06
status: paused
---

# Next Slide — Project Context

> "你的下个 ppt，何必是 PPT"

This file is for any AI/LLM working on this project. Read this first for full context.

## What This Is

Next Slide is a Claude Code Skill that generates zero-dependency, animation-rich HTML presentations from natural language. 50+ curated visual styles, bilingual (EN/中文), supports PPT conversion, Markdown conversion, and one-click Vercel deploy.

- **GitHub**: https://github.com/codesstar/next-slide
- **Gallery**: https://next-slide-jet.vercel.app/gallery.html
- **Install**: `git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide`

## File Map

| File | What It Does |
|------|-------------|
| `SKILL.md` | Core specification — Phase 0-7 flow, design rules, QA checklist. **Read this first.** |
| `STYLE_PRESETS.md` | 50+ style specs (colors, fonts, animation DNA) |
| `styles/{id}.html` | Working demos per style — primary reference when generating |
| `viewport-base.css` | Mandatory responsive CSS (included in every presentation) |
| `html-template.md` | HTML skeleton + JS navigation controller + `window.go()` |
| `animation-patterns.md` | Animation snippets by feeling |
| `SCENARIO_TEMPLATES.md` | Scenario structures, narrative arcs, 45 examples |
| `gallery.html` | Online style gallery with recommendation system |
| `style-gallery.html` | Local lightweight gallery |
| `landing/` | Product landing page |
| `scripts/extract-pptx.py` | PPT content extraction |

## Key Design Decisions

### Anti-AI-Slop (from pbakaus/impeccable)
- DO/DON'T rule system to avoid generic AI-looking output
- DON'T rules apply to **custom styles**; preset templates follow their own design language
- Universal rules (always apply): NO EMOJI, `overflow-wrap: break-word` (never `break-all`), `clamp()` for all sizing, tint neutrals (no pure #000/#fff)

### Technical
- **Viewport**: Every slide = exact 100vh, `overflow: hidden`, all sizes use `clamp()`
- **CJK**: `line-height: 1.8`, must include CJK font fallback (PingFang SC, Microsoft YaHei)
- **Google Fonts China**: Use `fonts.googleapis.cn` mirror + system fonts fallback
- **`window.go(index)`**: Every presentation exposes this globally for Phase 7 comparison sync
- **Nav dots**: 15+ slides → `max-height: 80vh; overflow-y: auto`
- **Comparison sync**: Parent page tracks `syncIndex`, calls `iframe.contentWindow.go()` on both iframes

### Style System
- 50+ styles in 7 categories: Dark / Light / Editorial / Bold & Creative / Retro & Vintage / Artistic / Cultural
- Gallery URL params: `?recommend=id1,id2,id3&reason_id1=...`
- 5 mood mappings → 5 recommended styles each

## What's Done

- [x] Full SKILL.md (Phase 0-7 + QA + all modes)
- [x] 50+ style presets + ~20 HTML demos
- [x] Online gallery with recommendations (Vercel)
- [x] viewport-base.css / html-template.md / animation-patterns.md
- [x] 45 scenario templates
- [x] PPT conversion script
- [x] Style comparison (Phase 7)
- [x] Expert review (PM/Designer/Engineer) — all issues fixed
- [x] OpenClaw plugin config
- [x] README + install docs

## What's Left

- [ ] More style demo HTMLs (have ~20, goal 50+)
- [ ] Gallery online preview enhancement
- [ ] PDF export (Playwright)
- [ ] Community style contribution PR template
- [ ] OpenClaw community launch
