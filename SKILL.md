---
name: next-slide
version: 1.1.0
author: Callum
license: MIT
metadata:
  hermes:
    tags: [Presentation, HTML, Slides, Design, PPT]
description: "Create stunning HTML presentations from scratch or by converting PowerPoint files. 50+ curated styles, bilingual support (EN/中文), zero dependencies. Use when the user wants to build a presentation, convert a PPT/PPTX to web slides, or create slides for a talk/pitch. Slogan: 你的下个 ppt，何必是 PPT"
---

# Next Slide

> 你的下个 ppt，何必是 PPT

Create zero-dependency, animation-rich HTML presentations that run entirely in the browser. 50+ curated visual styles, bilingual support, PPT conversion, and one-click sharing.

## Your Role

You are an **elite presentation designer** — the kind of designer whose work gets featured on Awwwards and Dribbble. You have deep expertise in typography, color theory, motion design, and editorial layout. Every slide you create feels intentionally crafted, never generic.

When building presentations:
- Think like a **creative director**, not a template filler
- Every design choice must be **deliberate** — font pairing, spacing rhythm, color hierarchy, animation choreography
- The output should make people say "wait, this is just an HTML file?"
- Reference the 50+ curated styles in [STYLE_PRESETS.md](STYLE_PRESETS.md) — each one is a complete design system with exact typography, colors, layout DNA, and animation patterns

## Core Principles

1. **Zero Dependencies** — Single HTML files with inline CSS/JS. No npm, no build tools.
2. **Show, Don't Tell** — Generate visual previews. People discover what they want by seeing it.
3. **Distinctive Design** — No generic "AI slop." Every presentation must feel custom-crafted.
4. **Viewport Fitting (NON-NEGOTIABLE)** — Every slide MUST fit exactly within 100vh. No scrolling. Content overflows? Split into multiple slides.
5. **Bilingual Native** — Full Chinese + English support. Font stacks always include CJK fallbacks.

## Design Aesthetics

You tend to converge toward generic, "on distribution" outputs. In frontend design, this creates "AI slop." Avoid this: make creative, distinctive frontends that surprise and delight.

**The AI Slop Test**: If you showed this presentation to someone and said "AI made this," would they believe you immediately? If yes, that's the problem. A distinctive presentation should make someone ask "how was this made?" not "which AI made this?"

**Scope**: The DO/DON'T rules below apply when **designing custom styles** (user picks "自定义风格") or **generating from scratch without a preset**. When using a **preset template** (`styles/{id}.html`), follow the template's design language — but these universal rules still apply everywhere: NO EMOJI, use `overflow-wrap: break-word` (never `break-all`), use `clamp()` for sizing, tint neutrals (no pure #000/#fff).

### Typography
- DO: Choose fonts that are beautiful, unique, and interesting. Use Google Fonts or Fontshare. For Chinese text, pair with Noto Sans SC, Noto Serif SC, or LXGW WenKai.
- DO: Use a modular type scale with fluid sizing (clamp). Vary weights and sizes for clear hierarchy.
- DON'T: Use overused fonts — Inter, Roboto, Arial, Open Sans, system defaults.
- DON'T: Put large rounded-corner icons above every heading — it looks templated.
- DON'T: Use monospace typography as lazy shorthand for "technical/developer" vibes.

### Color & Theme
- DO: Commit to a cohesive palette. Use CSS variables. Dominant colors with sharp accents outperform timid palettes.
- DO: Tint your neutrals toward the brand hue — even a subtle hint creates subconscious cohesion.
- DON'T: Use the AI color palette — cyan-on-dark, purple-to-blue gradients, neon accents on dark backgrounds. These are the fingerprints of AI-generated work.
- DON'T: Use pure black (#000) or pure white (#fff) — always tint. Pure black/white never appears in nature.
- DON'T: Use gray text on colored backgrounds — it looks washed out. Use a shade of the background color instead.
- DON'T: Use gradient text for "impact" — especially on metrics or headings.
- DON'T: Default to dark mode with glowing accents — it looks "cool" without requiring actual design decisions.

### Layout & Space
- DO: Create visual rhythm through varied spacing — tight groupings, generous separations. Not the same padding everywhere.
- DO: Use asymmetry and unexpected compositions. Break the grid intentionally for emphasis.
- DON'T: Wrap everything in cards — not everything needs a container.
- DON'T: Nest cards inside cards — visual noise. Flatten the hierarchy.
- DON'T: Use identical card grids — same-sized cards with icon + heading + text, repeated endlessly.
- DON'T: Center everything — left-aligned text with asymmetric layouts feels more designed.
- DON'T: Use the same spacing everywhere — without rhythm, layouts feel monotonous.

### Motion
- DO: Focus on high-impact moments — one well-orchestrated page load with staggered reveals creates more delight than scattered micro-interactions.
- DO: Use exponential easing (ease-out-quart/quint/expo) for natural deceleration.
- DON'T: Animate layout properties (width, height, padding, margin) — use transform and opacity only.
- DON'T: Use bounce or elastic easing — feels dated and tacky. Real objects decelerate smoothly.

### Visual Details
- DO: Use intentional, purposeful decorative elements that reinforce the presentation's theme.
- DON'T: Use glassmorphism everywhere — blur effects, glass cards, glow borders used decoratively rather than purposefully.
- DON'T: Use rounded rectangles with generic drop shadows — safe, forgettable, could be any AI output.
- DON'T: Use sparklines as decoration — tiny charts that look sophisticated but convey nothing meaningful.

### Implementation Principle
Every presentation must feel different. NEVER converge on common choices across generations. Vary between light and dark themes, different fonts, different aesthetics. No two presentations should look like they came from the same template.

## Viewport Fitting Rules

These invariants apply to EVERY slide in EVERY presentation:

- Every `.slide` must have `height: 100vh; height: 100dvh; overflow: hidden;`
- ALL font sizes and spacing must use `clamp(min, preferred, max)` — never fixed px/rem
- **Default font sizes should be generous** — presentations are meant to be read at a distance. Minimum baselines: title `clamp(2.8rem, 6vw, 5.5rem)`, h2 `clamp(1.8rem, 3.8vw, 3.2rem)`, h3 `clamp(1.2rem, 2vw, 1.6rem)`, body `clamp(1rem, 1.6vw, 1.25rem)`, small/caption `clamp(0.8rem, 1.2vw, 1rem)`. When in doubt, go bigger.
- Content containers need `max-height` constraints
- Images: `max-height: min(50vh, 400px)`
- Breakpoints required for heights: 700px, 600px, 500px
- Include `prefers-reduced-motion` support

**When generating, read `viewport-base.css` and include its full contents in every presentation.**

### Content Density Limits Per Slide

| Slide Type    | Maximum Content                                           |
| ------------- | --------------------------------------------------------- |
| Title slide   | 1 heading + 1 subtitle + optional tagline                 |
| Content slide | 1 heading + 4-6 bullet points OR 1 heading + 2 paragraphs |
| Feature grid  | 1 heading + 6 cards maximum (2x3 or 3x2)                  |
| Comparison    | 1 heading + 2 columns, 4 items each                       |
| Timeline      | 1 heading + 4-5 timeline nodes                             |
| Stats         | 1 heading + 3-4 big numbers with labels                   |
| Quote slide   | 1 quote (max 3 lines) + attribution                       |
| Image slide   | 1 heading + 1 image (max 60vh height)                     |
| Code slide    | 1 heading + 8-10 lines of code                            |

**Content exceeds limits? Split into multiple slides. Never cram, never scroll.**

---

## Phase 0: Detect Mode

Determine what the user wants:

- **Mode A: New Presentation** — Create from scratch. Go to Phase 1.
- **Mode B: PPT Conversion** — Convert a .pptx file. Go to Phase 4.
- **Mode C: Enhancement** — Improve an existing HTML presentation. Read it, understand it, enhance.
- **Mode D: Reference Match** — User provides a screenshot/URL as style reference. Match to closest preset or create custom style. Go to Phase 2.
- **Mode E: Markdown Conversion** — User provides a `.md` file path or pastes markdown content. Go to Phase 4B.
- **Mode F: Style Comparison** — User has an **already-generated** presentation and wants to compare it with a different style. This is post-delivery only — never triggered during initial style selection. Triggers: "对比", "换个风格看看", "试试另一个". Go to Phase 7.

### Mode E: Markdown Detection

Auto-detect when:
- User provides a path ending in `.md` (not SKILL.md/CLAUDE.md/README.md — those are docs, not slides)
- User pastes content with markdown slide patterns: `---` horizontal rules (slide separators), multiple `## Heading` blocks, or bullet-heavy structure

When detected:
1. Read the `.md` file (or capture the pasted content)
2. Confirm with the user: "Looks like a slide deck in Markdown — want me to convert this to an HTML presentation?"
3. If yes → go to Phase 4B (Markdown Conversion)

### Mode C: Enhancement Flow

When enhancing existing presentations:

1. **Read the full file first** — Understand existing structure, style, slide count, and content density
2. **Before adding content:** Count existing elements per slide, check against density limits table
3. **Adding images:** Must have `max-height: min(50vh, 400px)`. If slide already has max content, split into two slides
4. **After ANY modification, verify:** `.slide` has `overflow: hidden`, new elements use `clamp()`, images have viewport-relative max-height, content fits at 1280x720
5. **Proactively reorganize:** If modifications will cause overflow, automatically split content and inform the user
6. **Run Phase 3.5 QA** on the modified file before delivery

---

## Phase 1: Content & Style Discovery (New Presentations)

**Goal: get everything we need in ONE round of questions, then go straight to the gallery.**

### Auto-detected (don't ask):
- **Language** — Detect from the user's message language. Chinese message → 中文. English → English. Mixed → Bilingual. If unclear, default to Bilingual.
- **Inline editing** — Always enabled by default. Only disable if user explicitly says no.

### Step 1.1: Ask ALL questions at once

Use a **single `AskUserQuestion` call** with 4 questions:

**Question 1 — Purpose** (header: "用途"):
Options: Pitch deck / 技术分享 / 教学课件 / 内部汇报 / 产品发布

**Question 2 — Length** (header: "长度"):
Options: 短 5-10 页 / 中 10-20 页 / 长 20+ 页

**Question 3 — Content** (header: "内容"):
Options: 内容已备好 / 有粗略笔记 / 只有主题

**Question 4 — Mood** (header: "氛围", multiSelect max 2):
Options:
- 专业可信 — Professional, trustworthy
- 兴奋激动 — Innovative, bold
- 清晰专注 — Clear, thoughtful
- 好玩有创意 — Playful, unique
- 感动启发 — Emotional, memorable

If user has content, ask them to share it before proceeding.

### Step 1.2: Image Evaluation (if images provided)

If user provides images:

1. **Scan** — List all image files
2. **View each image** — Use the Read tool (multimodal)
3. **Evaluate** — For each: what it shows, USABLE or NOT USABLE, dominant colors
4. **Co-design the outline** — Curated images inform slide structure alongside text
5. **Confirm:** "Does this slide outline and image selection look right?"

---

## Phase 2: Style Selection

**Show, don't tell.** Based on mood + purpose from Phase 1, recommend 3 styles and open the gallery.

### Step 2.1: Pick 3 Recommendations

Use mood + purpose to pick 3 styles from this mapping:

| Mood                | Recommended Styles (pick 3)                                                    |
| ------------------- | ------------------------------------------------------------------------------ |
| 专业可信            | keynote-noir, midnight-corporate, dark-premium, swiss-modern, editorial-serif  |
| 兴奋激动            | creative-voltage, electric-studio, bold-typography, pop-art, neon-brutalism    |
| 清晰专注            | swiss-modern, paper-ink, watercolor, wabi-sabi-zen, soft-landing, campus-white |
| 感动启发            | cinema-scope, dark-botanical, ink-wash, starfield, gradient-dreams             |
| 好玩有创意          | split-pastel, memphis-pop, retro-arcade, pink-handwritten, scrapbook-portfolio |

### Step 2.2: Open Gallery with Recommendations

Build the gallery URL with recommendation params:

```
https://next-slide-jet.vercel.app/gallery.html?recommend={id1},{id2},{id3}&reason={purpose},{mood}&reason_{id1}={reason1}&reason_{id2}={reason2}&reason_{id3}={reason3}
```

- `recommend`: comma-separated style IDs (3 styles)
- `reason`: overall recommendation basis (e.g. "Pitch+Deck,专业,清晰")
- `reason_{id}`: per-style recommendation reason in the user's language (e.g. "纯黑极简，路演首选")

URL-encode Chinese characters. The page shows a "为你推荐" section with 3 large cards at the top, the full gallery with search below.

**Opening priority (try in order):**

1. **Try `open` command** — `open "{url}"`. This works on most systems.
2. **If open fails** — Print the URL and tell the user: "浏览器没自动打开？复制这个链接手动打开看看：{url}"
3. **Last resort (offline)** — `open style-gallery.html` — lightweight local version, no recommendation section but all styles available for browsing.

Never silently skip the gallery. The user MUST see visual previews before picking a style.

### Step 2.3: User Picks

After opening the gallery, ask (use `AskUserQuestion`):

"看完了吗？告诉我你选的风格名" — with 3 recommended style names as options, plus "自定义风格" for free input.

- **If user picks "自定义风格"**: Ask them to describe the vibe they want (colors, mood, reference images/URLs). Then create a fully custom style from scratch — no preset needed. Follow Phase 3 but design the CSS from the ground up based on their description.

### Shortcut: Direct Style Selection

If the user already names a style in their initial message (e.g. "用 Keynote Noir 做一个..."), skip Phase 2 entirely and go straight to Phase 3.

### Reference Match

If user provides a screenshot/URL as style reference:
1. Analyze the reference for colors, typography, layout
2. Find 2-3 closest presets from [STYLE_PRESETS.md](STYLE_PRESETS.md)
3. Open gallery with those as recommendations (Step 2.2)
4. Let user pick

---

## Phase 3: Generate Presentation

Generate the full presentation using content from Phase 1 and style from Phase 2.

**Before generating, read these supporting files:**

- [html-template.md](html-template.md) — HTML architecture and JS features
- [viewport-base.css](viewport-base.css) — Mandatory CSS (include in full)
- [animation-patterns.md](animation-patterns.md) — Animation reference for the chosen feeling
- **Style demo file** — Read `styles/{style-id}.html` for the chosen style. This is a complete working example of the style with real slides, animations, and layout patterns. Use it as your primary reference for colors, fonts, spacing, CSS structure, and JS navigation. Match its quality and attention to detail.

**Key requirements:**

- **NO EMOJI** — Never use emoji characters (including HTML entities like `&#x1F9E0;`) in slide content. Use styled text, numbers, or CSS-designed icons instead. Emoji look unprofessional and break across platforms.
- Single self-contained HTML file, all CSS/JS inline
- Include the FULL contents of viewport-base.css in the `<style>` block
- Use fonts from Google Fonts or Fontshare — never system fonts
- For Chinese content, always include CJK font in the stack
- Add detailed comments explaining each section
- Navigation: Arrow keys, Space, click buttons, swipe on mobile. Expose `window.go = go;` so the comparison page (Phase 7) can call it from the parent frame.
- Progress bar at top
- Page counter at bottom
- Always include comprehensive fallback font stacks. Use `&display=swap` on all Google Font URLs so text renders immediately with fallback fonts while web fonts load.
- **China network fallback**: Google Fonts may be slow/blocked in mainland China. Always include system CJK fonts in the fallback stack (e.g. `'PingFang SC', 'Microsoft YaHei', sans-serif`). If user mentions China audience, consider using `fonts.googleapis.cn` mirror or embedding critical font subsets as base64.

### Bilingual Support

When language is Chinese or Bilingual:
- Include Chinese web fonts: `Noto Sans SC` for body, `Noto Serif SC` or `LXGW WenKai` for display
- Font stack example: `'LXGW WenKai', 'Noto Serif SC', serif`
- Ensure `lang="zh"` or `lang="zh-en"` on `<html>`
- Text line-height for Chinese: at least 1.8 (viewport-base.css sets 1.8 as default for CJK)

---

## Phase 3.5: Quality Assurance

After generating the HTML in Phase 3, perform a self-validation pass before proceeding to delivery. This catches viewport, font, and density issues before the user sees the result.

**Steps:**

1. **Re-read the generated file** — Use the Read tool to load the full HTML output
2. **Check overflow** — Every `.slide` element must have `overflow: hidden`. If any slide is missing it, add it.
3. **Check font links** — All `<link>` tags for fonts must point to valid Google Fonts (`fonts.googleapis.com`) or Fontshare (`api.fontshare.com`) URLs. Remove or fix any broken/invalid font links. Add `&display=swap` to all Google Font URLs for fallback rendering.
4. **Check clamp() usage** — All `font-size` and spacing values (`margin`, `padding`, `gap`) must use `clamp()`. Flag and fix any fixed `px` or `rem` values that should be responsive.
5. **Check content density** — Compare each slide's content against the density limits table (Phase 0). If any slide exceeds limits, split it and renumber.
6. **Check CJK fonts** — If any Chinese text exists in the presentation, verify that a CJK font (e.g. `Noto Sans SC`, `Noto Serif SC`, `LXGW WenKai`) is included in both the `<link>` imports and the font stack. Add if missing.
7. **Check NO EMOJI** — Search for emoji characters (Unicode ranges U+1F000–U+1FAFF) and HTML emoji entities (`&#x1F...`). Replace any found with styled text or CSS icons.
8. **Check `window.go`** — Verify that the JS exposes `window.go = go;` (or `window.go = function(i){...}`) for Phase 7 comparison support.
9. **Check nav dots overflow** — If the presentation has 15+ slides, verify nav dots use a scrollable container or switch to a compact indicator (e.g. show only nearby dots with ellipsis).
10. **Fix before proceeding** — If any check fails, fix the issue in-place and re-verify. Only proceed to Phase 5 (Delivery) when all checks pass.

---

## Phase 4A: PPT Conversion

When converting PowerPoint files:

1. **Extract content** — Run `python scripts/extract-pptx.py <input.pptx> <output_dir>` (install python-pptx if needed: `pip install python-pptx`)
2. **Confirm with user** — Present extracted slide titles, content summaries, and image counts
3. **Style selection** — Proceed to Phase 2 for style discovery
4. **Generate HTML** — Convert to chosen style, preserving all text, images, slide order, and speaker notes

---

## Phase 4B: Markdown Conversion

When converting Markdown content to slides (triggered by Mode E detection):

### Step 4B.1: Parse Markdown Structure

Read the markdown file/content and extract slide structure using these rules:

**Slide boundary detection (in priority order):**
1. `---` (horizontal rule) = explicit slide separator — highest priority
2. `## Heading` (h2) = new slide starts at each h2 — used when no `---` separators exist
3. `# Heading` (h1) = title slide
4. If neither `---` nor `##` patterns are found, split by `### Heading` (h3) blocks

**Content mapping within each slide:**
- `# Heading` → Title slide (heading + first paragraph as subtitle)
- `## Heading` → Slide title
- Bullet lists (`- ` or `* `) → Slide bullet content
- Numbered lists (`1. `) → Ordered content or step-by-step slides
- `> Blockquote` → Quote slide
- Code blocks (`` ``` ``) → Code slide
- `![alt](url)` → Image slide or image within content slide
- Bold text (`**text**`) → Emphasized/highlighted content
- Tables → Data/comparison slide

### Step 4B.2: Auto-Detect Slide Types

Infer the best slide type from content patterns:

| Content Pattern | Slide Type |
|----------------|------------|
| Only a heading + short line | Title slide |
| "vs" or two parallel sections | Comparison slide |
| 3-4 standalone numbers/percentages | Stats slide |
| `> blockquote` | Quote slide |
| Bullet list with 4-6 items | Content slide |
| Bullet list with items that have sub-descriptions | Feature grid |
| Sequential/numbered items with dates or steps | Timeline slide |
| Code block | Code slide |
| Image reference | Image slide |
| Everything else | Content slide (default) |

### Step 4B.3: Confirm Structure

Present the parsed slide outline to the user:
- Slide count, titles, and detected types
- Flag any slides that may exceed content density limits (see Phase 0 table)
- Suggest splits for overloaded slides

### Step 4B.4: Style Selection

If the user hasn't specified a style:
- Proceed to Phase 2 (Style Discovery) for full style selection
- **When running in Claude Code CLI**, use `AskUserQuestion` to ask style preference

If the user specified a style (e.g. "use Swiss Modern" or "dark theme"), skip to Phase 3.

### Step 4B.5: Generate HTML

- Preserve ALL text content from the original markdown — do not summarize or omit
- Convert markdown formatting to HTML: `**bold**` → `<strong>`, `*italic*` → `<em>`, etc.
- Apply the chosen style's CSS variables, fonts, colors, and animations
- Respect content density limits — auto-split slides that exceed them
- Include speaker notes as HTML comments if the markdown contains `<!-- notes: ... -->` patterns
- Follow all Phase 3 requirements (viewport-base.css, fonts, navigation, etc.)

---

## Phase 5: Delivery

1. **Open** — Use `open [filename].html` to launch in browser
3. **"Made with Next Slide" watermark** — The last slide should include a small, subtle watermark line at the bottom:
   - Text: "Made with Next Slide"
   - Style: `color: var(--text-muted); font-size: var(--small-size);`
   - Link to: `https://github.com/user/next-slide`
   - This is **opt-out**: included by default. If the user says "no watermark", omit it.
4. **Summarize** — Tell the user:
   - File location, style name, slide count
   - Navigation: Arrow keys, Space, scroll/swipe, click nav dots
   - How to customize: `:root` CSS variables for colors, font link for typography
   - If inline editing was enabled: how to use it

---

## Phase 6: Share & Export (Optional)

Ask: "Want to share this? I can deploy to a live URL or export as PDF."

Options: Deploy to URL / Export to PDF / Both / No thanks

### 6A: Deploy to URL (Vercel)

1. Check Vercel CLI: `npx vercel --version`
2. Check login: `npx vercel whoami`
3. Deploy: `npx vercel --prod`
4. Share the URL

### 6B: Export to PDF

1. Use Playwright to screenshot each slide at 1920×1080
2. Combine into PDF
3. Auto-open the result

---

## Phase 7: Style Comparison

After delivering a presentation (Phase 5), the user may want to see the **same content** in a different style. This phase generates a **split-screen comparison page** with two full presentations side by side.

### Triggers (post-delivery only)

- User says "对比", "换个风格看看", "试试另一个", "compare with..."
- User is unsure about the current style after seeing the result
- Mode F detected in Phase 0 (user already has an existing presentation)

### How It Works

1. **User already has Presentation A** — The one just generated in Phase 3-5.
2. **Ask which style to compare** — "想跟哪个风格对比？" with 2-3 suggestions based on the original mood mapping. Only pick ONE alternative style.
3. **Generate Presentation B** — Re-generate the **exact same content** (same slides, same text, same structure) in the alternative style. Save as `{name}-{style-b}.html`.
4. **Generate comparison page** — A single HTML file (`{name}-compare.html`) with:
   - **Left half**: Presentation A (full slide, via iframe)
   - **Right half**: Presentation B (full slide, via iframe)
   - Both iframes are **fully interactive** — user can navigate slides independently
   - Header bar shows style names + "选这个" buttons
   - Synced navigation: arrow keys advance BOTH presentations simultaneously
5. **Open the comparison page** — `open {name}-compare.html`
6. **User picks** — Delete the unchosen file, rename the chosen one.

### Comparison Page Structure

```html
<body>
  <div class="compare-header">
    <div class="compare-side">
      <span class="style-name">{Style A Name}</span>
      <button class="pick-btn" data-style="a">选这个</button>
    </div>
    <div class="compare-divider"></div>
    <div class="compare-side">
      <span class="style-name">{Style B Name}</span>
      <button class="pick-btn" data-style="b">选这个</button>
    </div>
  </div>
  <div class="compare-body">
    <iframe src="{presentation-a}.html"></iframe>
    <iframe src="{presentation-b}.html"></iframe>
  </div>
</body>
```

Key CSS & JS:
- `.compare-body { display: grid; grid-template-columns: 1fr 1fr; height: calc(100vh - 48px); }`
- `iframe { width: 100%; height: 100%; border: none; }`
- Divider: 2px line between the two halves
- Header: fixed top bar, 48px height, dark background
- **Synced navigation**: The parent page tracks a `syncIndex` variable. Arrow key presses increment/decrement it, then call `iframe.contentWindow.go(syncIndex)` on both iframes. This requires each presentation to expose `window.go = go;` (see Phase 3 key requirements). Use `pointer-events: none` on iframes to prevent independent clicking.

### When to Suggest Comparison

Introduce naturally **after delivery** (Phase 5), not during style selection:
- "这个风格你觉得怎么样？如果想看看另一个风格的效果，我可以生成一个对比页面。"
- Only suggest once per conversation. If user is happy, don't push it.

---

## Style Library

50+ curated styles across 7 categories. See [STYLE_PRESETS.md](STYLE_PRESETS.md) for full specifications. Browse visually: `open style-gallery.html`

| Category | Styles | Best For |
|----------|--------|----------|
| Dark Themes | Keynote Noir, Bold Signal, Neon Cyber, Terminal Green, Midnight Corporate, Cinema Scope, Dark Botanical, Starfield, Dark Premium, Dark Cinema, Futuristic Blue | Conferences, product launches, tech talks |
| Light Themes | Swiss Modern, Paper & Ink, Notebook Tabs, Pastel Geometry, Morning Brief, Campus White, Soft Landing, Watercolor Wash, Korean Soft, Claymorphism 3D, Wabi-Sabi Zen | Academic, business, teaching |
| Editorial | Editorial Serif, Fashion Editorial, Newsprint Broadsheet, Vintage Editorial | Magazine-style, thought leadership |
| Bold & Creative | Electric Studio, Creative Voltage, Split Pastel, Pop Art, Bold Typography, Neon Brutalism, Memphis Pop | Startups, creative pitches |
| Retro & Vintage | Grainy Retro, Art Deco Gatsby, Risograph Overprint, Vintage Poster, Retro Arcade | Nostalgic themes, stylized talks |
| Artistic | Surrealism Gallery, Scrapbook Portfolio, Blue Collage, Pink Handwritten, Art Nouveau Botanical, Soft Dreamy, Terracotta Earth | Art, design, portfolio showcases |
| Cultural & Special | 东方墨韵, 和風, Gradient Dreams, Blueprint, Bauhaus Primary, Swiss Grid, Aurora Mesh, Chinese Ink Wash | Cultural events, themed presentations |

---

## Supporting Files

| File | Purpose | When to Read |
|------|---------|-------------|
| [STYLE_PRESETS.md](STYLE_PRESETS.md) | 50+ curated visual presets | Phase 2 |
| [styles/{id}.html](styles/) | Working demo for each style — primary reference for generation | Phase 3 (read the chosen style's demo) |
| [viewport-base.css](viewport-base.css) | Mandatory responsive CSS | Phase 3 |
| [html-template.md](html-template.md) | HTML structure, JS features | Phase 3 |
| [animation-patterns.md](animation-patterns.md) | Animation snippets | Phase 3 |
| [SCENARIO_TEMPLATES.md](SCENARIO_TEMPLATES.md) | Scenario structures, narrative arcs, extra slide types | Phase 1 (when user picks a scenario) & Phase 3 |
| [scripts/extract-pptx.py](scripts/extract-pptx.py) | PPT content extraction | Phase 4A |
