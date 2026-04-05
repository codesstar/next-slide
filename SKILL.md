---
name: next-slide
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

Focus on:

- **Typography:** Choose fonts that are beautiful, unique, and interesting. Avoid Inter, Roboto, Arial. Use Google Fonts or Fontshare. For Chinese text, pair with Noto Sans SC, Noto Serif SC, or LXGW WenKai.
- **Color & Theme:** Commit to a cohesive aesthetic. Use CSS variables. Dominant colors with sharp accents outperform timid palettes.
- **Motion:** Use animations for effects and micro-interactions. CSS-only solutions preferred. One well-orchestrated page load with staggered reveals creates more delight than scattered micro-interactions.
- **Backgrounds:** Create atmosphere and depth. Layer CSS gradients, use geometric patterns, or add contextual effects.

## Viewport Fitting Rules

These invariants apply to EVERY slide in EVERY presentation:

- Every `.slide` must have `height: 100vh; height: 100dvh; overflow: hidden;`
- ALL font sizes and spacing must use `clamp(min, preferred, max)` — never fixed px/rem
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

### Mode E: Markdown Detection

Auto-detect when:
- User provides a path ending in `.md` (not SKILL.md/CLAUDE.md/README.md — those are docs, not slides)
- User pastes content with markdown slide patterns: `---` horizontal rules (slide separators), multiple `## Heading` blocks, or bullet-heavy structure

When detected:
1. Read the `.md` file (or capture the pasted content)
2. Confirm with the user: "Looks like a slide deck in Markdown — want me to convert this to an HTML presentation?"
3. If yes → go to Phase 4B (Markdown Conversion)

### Mode C: Modification Rules

When enhancing existing presentations:

1. **Before adding content:** Count existing elements, check against density limits
2. **Adding images:** Must have `max-height: min(50vh, 400px)`. If slide already has max content, split into two slides
3. **After ANY modification, verify:** `.slide` has `overflow: hidden`, new elements use `clamp()`, images have viewport-relative max-height, content fits at 1280x720
4. **Proactively reorganize:** If modifications will cause overflow, automatically split content and inform the user

---

## Phase 1: Content Discovery (New Presentations)

**Ask ALL questions in a single message** so the user fills everything out at once.

**When running in Claude Code CLI**, use `AskUserQuestion` tool for each question with selectable options. This gives the user clickable choices instead of requiring typed answers. Ask questions sequentially — each answer may inform the next.

**Question 1 — Language:**
What language is the presentation in? Options: English / 中文 / Bilingual (双语)

**Question 2 — Purpose:**
What is this presentation for? Options: Pitch deck / Teaching-Tutorial / Conference talk / Internal presentation / Academic defense / Product launch

**Question 3 — Length:**
Approximately how many slides? Options: Short 5-10 / Medium 10-20 / Long 20+

**Question 4 — Content:**
Do you have content ready? Options: All content ready / Rough notes / Topic only

**Question 5 — Inline Editing:**
Do you need to edit text directly in the browser after generation? Options: Yes (Recommended) / No

If user has content, ask them to share it.

### Step 1.2: Image Evaluation (if images provided)

If user provides images:

1. **Scan** — List all image files
2. **View each image** — Use the Read tool (multimodal)
3. **Evaluate** — For each: what it shows, USABLE or NOT USABLE, dominant colors
4. **Co-design the outline** — Curated images inform slide structure alongside text
5. **Confirm:** "Does this slide outline and image selection look right?"

---

## Phase 2: Style Discovery

**This is the "show, don't tell" phase.**

### Step 2.0: Style Path

Ask how they want to choose:

- **"Show me options"** (recommended) — Generate 3 previews based on mood
- **"Browse the gallery"** — Open the local style gallery for visual browsing: `open style-gallery.html` (lightweight preview of all 50+ styles). For the full interactive gallery with live demos, visit: https://next-slide.vercel.app/gallery
- **"I know what I want"** — Pick from preset list directly
- **"Match this reference"** — User provides screenshot/URL, AI matches closest style

**If reference match:** Analyze the reference image for colors, typography feel, layout structure. Find the 2-3 closest presets from [STYLE_PRESETS.md](STYLE_PRESETS.md), generate previews of each with the user's content, let them pick.

### Step 2.1: Mood Selection (Guided Discovery)

**When running in Claude Code CLI**, use `AskUserQuestion` tool with selectable options for mood selection and style picking (Steps 2.1 and 2.4).

Ask (multiSelect, max 2):
What feeling should the audience have? Options:

- Impressed/Confident — Professional, trustworthy
- Excited/Energized — Innovative, bold
- Calm/Focused — Clear, thoughtful
- Inspired/Moved — Emotional, memorable
- Fun/Creative — Playful, unique

### Step 2.2: Category Filter

Based on mood, suggest a category:

| Mood                | Suggested Categories               |
| ------------------- | ---------------------------------- |
| Impressed/Confident | Dark Themes, Bold & Creative       |
| Excited/Energized   | Bold & Creative, Specialty         |
| Calm/Focused        | Light Themes                       |
| Inspired/Moved      | Dark Themes, Cultural & Special    |
| Fun/Creative        | Bold & Creative, Cultural & Special|

### Step 2.3: Generate 3 Style Previews

Generate 3 distinct single-slide HTML previews. Read [STYLE_PRESETS.md](STYLE_PRESETS.md) for preset specifications.

**Each preview must be:**
- A single self-contained HTML file (inline CSS/JS, no external dependencies except Google Fonts)
- Showing one animated title slide using the **user's actual title and subtitle** — never use placeholder text like "Lorem Ipsum" or "Your Title Here"
- Saved to `.claude-design/slide-previews/style-a.html`, `style-b.html`, `style-c.html`
- ~50-100 lines each

**After generating all three**, open each in the browser:
```
open .claude-design/slide-previews/style-a.html
open .claude-design/slide-previews/style-b.html
open .claude-design/slide-previews/style-c.html
```

### Step 2.4: User Picks

**When running in Claude Code CLI**, use `AskUserQuestion` tool with options: Style A / Style B / Style C / Mix elements.

Which style preview do you prefer? Options: Style A / Style B / Style C / Mix elements

If "Mix elements", ask for specifics.

---

## Phase 3: Generate Presentation

Generate the full presentation using content from Phase 1 and style from Phase 2.

**Before generating, read these supporting files:**

- [html-template.md](html-template.md) — HTML architecture and JS features
- [viewport-base.css](viewport-base.css) — Mandatory CSS (include in full)
- [animation-patterns.md](animation-patterns.md) — Animation reference for the chosen feeling

**Key requirements:**

- Single self-contained HTML file, all CSS/JS inline
- Include the FULL contents of viewport-base.css in the `<style>` block
- Use fonts from Google Fonts or Fontshare — never system fonts
- For Chinese content, always include CJK font in the stack
- Add detailed comments explaining each section
- Navigation: Arrow keys, Space, click buttons, swipe on mobile
- Progress bar at top
- Page counter at bottom
- Always include comprehensive fallback font stacks. For offline/unreliable network scenarios, consider using `font-display: swap` on all Google Font links. If user requests offline mode, embed critical font subsets as base64.

### Bilingual Support

When language is Chinese or Bilingual:
- Include Chinese web fonts: `Noto Sans SC` for body, `Noto Serif SC` or `LXGW WenKai` for display
- Font stack example: `'LXGW WenKai', 'Noto Serif SC', serif`
- Ensure `lang="zh"` or `lang="zh-en"` on `<html>`
- Text line-height for Chinese: at least 1.8

---

## Phase 3.5: Quality Assurance

After generating the HTML in Phase 3, perform a self-validation pass before proceeding to delivery. This catches viewport, font, and density issues before the user sees the result.

**Steps:**

1. **Re-read the generated file** — Use the Read tool to load the full HTML output
2. **Check overflow** — Every `.slide` element must have `overflow: hidden`. If any slide is missing it, add it.
3. **Check font links** — All `<link>` tags for fonts must point to valid Google Fonts (`fonts.googleapis.com`) or Fontshare (`api.fontshare.com`) URLs. Remove or fix any broken/invalid font links.
4. **Check clamp() usage** — All `font-size` and spacing values (`margin`, `padding`, `gap`) must use `clamp()`. Flag and fix any fixed `px` or `rem` values that should be responsive.
5. **Check content density** — Compare each slide's content against the density limits table (Phase 0). If any slide exceeds limits, split it and renumber.
6. **Check CJK fonts** — If any Chinese text exists in the presentation, verify that a CJK font (e.g. `Noto Sans SC`, `Noto Serif SC`, `LXGW WenKai`) is included in both the `<link>` imports and the font stack. Add if missing.
7. **Fix before proceeding** — If any check fails, fix the issue in-place and re-verify. Only proceed to Phase 5 (Delivery) when all checks pass.

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

1. **Clean up** — Delete `.claude-design/slide-previews/` if it exists
2. **Open** — Use `open [filename].html` to launch in browser
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
| [viewport-base.css](viewport-base.css) | Mandatory responsive CSS | Phase 3 |
| [html-template.md](html-template.md) | HTML structure, JS features | Phase 3 |
| [animation-patterns.md](animation-patterns.md) | Animation snippets | Phase 3 |
| [SCENARIO_TEMPLATES.md](SCENARIO_TEMPLATES.md) | Scenario structures, narrative arcs, extra slide types | Phase 1 (when user picks a scenario) & Phase 3 |
| [scripts/extract-pptx.py](scripts/extract-pptx.py) | PPT content extraction | Phase 4A |
