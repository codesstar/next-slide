# Style Presets Reference

Curated visual styles for Next Slide — 你的下个 slide，何必是 PPT. Each preset is inspired by real design references with distinct personality. **Abstract shapes only — no illustrations.**

**Viewport CSS:** For mandatory base styles, see [viewport-base.css](viewport-base.css). Include in every presentation.

---

## Dark Themes

### 1. Keynote Noir

**Vibe:** Cinematic, minimal, authoritative — the Apple keynote energy

**Layout:** Full-bleed dark background, content centered with generous whitespace. Single hero element per slide. Large imagery bleeds to edges.

**Typography:**
- Display: `Inter Tight` (700/800) — clean geometric, SF-like
- Body: `Inter` (300/400)

**Colors:**
```css
:root {
    --bg-primary: #000000;
    --bg-gradient: linear-gradient(180deg, #000000 0%, #0a0a0a 100%);
    --text-primary: #ffffff;
    --text-secondary: #86868b;
    --accent: #2997ff;
    --surface: #1d1d1f;
}
```

**Signature Elements:**
- Pure black backgrounds, no noise or texture
- One idea per slide, massive display type (8vw+)
- Subtle blue accent for links and key stats
- Fade-in transitions, no decorative elements
- Product images float on black with soft ambient glow

**When to use:** Product launches, company keynotes, anything that needs gravitas.

---

### 2. Bold Signal

**Vibe:** Confident, bold, modern, high-impact

**Layout:** Colored card on dark gradient. Number top-left, navigation top-right, title bottom-left.

**Typography:**
- Display: `Archivo Black` (900)
- Body: `Space Grotesk` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #111111;
    --bg-gradient: linear-gradient(160deg, #111111 0%, #1e1e1e 50%, #111111 100%);
    --card-bg: #FF5722;
    --text-primary: #ffffff;
    --text-on-card: #111111;
    --accent-secondary: #FFB300;
}
```

**Signature Elements:**
- Bold colored card as focal point (orange, coral, or vibrant accent)
- Large section numbers (01, 02, etc.) in compressed type
- Navigation breadcrumbs with active/inactive opacity states
- Grid-based layout for precise alignment

**When to use:** Marketing decks, pitch decks where you need to command attention.

---

### 3. Neon Cyber

**Vibe:** Futuristic, techy, immersive, bleeding-edge

**Layout:** Content floats on deep space background. Asymmetric grid with neon-bordered cards. HUD-like corner elements.

**Typography:**
- Display: `Clash Display` (600/700) — Fontshare
- Body: `Satoshi` (400/500) — Fontshare

**Colors:**
```css
:root {
    --bg-primary: #0a0f1c;
    --bg-gradient: radial-gradient(ellipse at 30% 50%, #0d1a2d 0%, #0a0f1c 70%);
    --accent-cyan: #00ffcc;
    --accent-magenta: #ff00aa;
    --accent-blue: #4466ff;
    --text-primary: #e0f0ff;
    --text-secondary: #5a7a9a;
    --glow-cyan: 0 0 20px rgba(0, 255, 204, 0.3);
    --glow-magenta: 0 0 20px rgba(255, 0, 170, 0.3);
}
```

**Signature Elements:**
- Particle/dot grid backgrounds (CSS-generated)
- Neon glow on borders and key text (`text-shadow` + `box-shadow`)
- Scan line overlay (repeating-linear-gradient, 2px)
- Corner brackets as frame markers: `[ ]`
- Gradient text on hero headings

**When to use:** Tech launches, AI/Web3 topics, developer conferences, anything futuristic.

---

### 4. Terminal Green

**Vibe:** Developer-focused, hacker aesthetic, raw, authentic

**Layout:** Monospace everything. Terminal window chrome at top (three dots + title bar). Content left-aligned, ragged right.

**Typography:**
- Display: `JetBrains Mono` (700)
- Body: `JetBrains Mono` (400)

**Colors:**
```css
:root {
    --bg-primary: #0d1117;
    --bg-secondary: #161b22;
    --text-green: #39d353;
    --text-dim: #7d8590;
    --text-white: #e6edf3;
    --accent-yellow: #e3b341;
    --accent-red: #f85149;
    --border: #30363d;
}
```

**Signature Elements:**
- Terminal window chrome (title bar with colored dots)
- Blinking cursor after headings (`animation: blink 1s step-end infinite`)
- Code syntax highlighting colors for emphasis
- `$` prompt prefix on bullet points
- CRT scan line overlay (subtle)

**When to use:** Developer talks, open-source project intros, technical deep dives.

---

### 5. Midnight Corporate

**Vibe:** Dark professional, polished, boardroom-ready

**Layout:** Two-column with thin vertical divider. Logo area top-left, page numbers bottom-right. Content blocks separated by hairline rules.

**Typography:**
- Display: `General Sans` (600/700) — Fontshare
- Body: `Cabinet Grotesk` (400/500) — Fontshare

**Colors:**
```css
:root {
    --bg-primary: #0f1219;
    --bg-card: #171c26;
    --text-primary: #f0f0f0;
    --text-secondary: #8891a4;
    --accent-blue: #3d7cf5;
    --accent-teal: #2dd4bf;
    --border: #252b38;
    --surface-hover: #1e2433;
}
```

**Signature Elements:**
- Thin 1px borders and dividers (not thick bars)
- Subtle gradient on section headers
- Icon-labeled data blocks (revenue, users, etc.)
- Professional chart/graph placeholders with accent colors
- Corner logo watermark at 8% opacity

**When to use:** Board meetings, investor updates, quarterly reviews, enterprise pitches.

---

### 6. Cinema Scope

**Vibe:** Cinematic, dramatic, widescreen, storytelling

**Layout:** Letterbox bars (top and bottom black bands, ~8vh each). Content lives in the widescreen center strip. Text anchored to lower-third.

**Typography:**
- Display: `Bebas Neue` (400)
- Body: `Lato` (300/400)

**Colors:**
```css
:root {
    --bg-primary: #0a0a0a;
    --letterbox: #000000;
    --text-primary: #ffffff;
    --text-secondary: #999999;
    --accent-gold: #d4a843;
    --accent-red: #b22234;
    --overlay: rgba(0, 0, 0, 0.6);
}
```

**Signature Elements:**
- Letterbox bars (persistent top/bottom black bands)
- Lower-third text placement (like film subtitles)
- Full-bleed background images with dark overlay
- Chapter numbers in condensed caps: `CHAPTER 01`
- Fade transitions, no hard cuts

**When to use:** Story-driven presentations, case studies, brand narratives, documentary-style decks.

---

### 7. Dark Botanical

**Vibe:** Elegant, sophisticated, artistic, premium

**Layout:** Centered content on dark. Abstract soft shapes in corners (CSS blurred circles).

**Typography:**
- Display: `Cormorant` (400/600) — elegant serif
- Body: `IBM Plex Sans` (300/400)

**Colors:**
```css
:root {
    --bg-primary: #0f0f0f;
    --text-primary: #e8e4df;
    --text-secondary: #9a9590;
    --accent-warm: #d4a574;
    --accent-pink: #e8b4b8;
    --accent-gold: #c9b896;
    --accent-sage: #7a9a7a;
}
```

**Signature Elements:**
- Abstract soft gradient circles (blurred, overlapping, 30-50% opacity)
- Warm color accents (pink, gold, terracotta, sage)
- Thin vertical accent lines
- Italic signature typography for quotes
- **No illustrations — only abstract CSS shapes**

**When to use:** Luxury brands, art/design presentations, editorial pitches.

---

### 8. Starfield

**Vibe:** Cosmic, vast, contemplative, awe-inspiring

**Layout:** Content floats in deep space. Radial gradient creates depth. Key stats are oversized and centered. Supporting text orbits below.

**Typography:**
- Display: `Exo 2` (700/800)
- Body: `Lexend` (300/400)

**Colors:**
```css
:root {
    --bg-primary: #05051a;
    --bg-gradient: radial-gradient(ellipse at 50% 50%, #0d0d3a 0%, #05051a 70%);
    --text-primary: #e8eaff;
    --text-secondary: #6a6a9a;
    --accent-purple: #8855ff;
    --accent-blue: #44aaff;
    --accent-pink: #ff66aa;
    --star-color: #ffffff;
}
```

**Signature Elements:**
- Scattered dot particles (CSS `radial-gradient` tiny circles, random positions)
- Nebula-like blurred color blobs in background
- Glowing orbs for key data points
- Ring/orbit lines around central elements (thin `border-radius: 50%`)
- Slow float animation on accent shapes (`animation: float 6s ease-in-out infinite`)

**When to use:** Vision talks, moonshot pitches, space/science topics, inspiring big-picture decks.

---

## Light Themes

### 9. Swiss Modern

**Vibe:** Clean, precise, Bauhaus-inspired, typographic

**Layout:** Strict 12-column grid. Asymmetric content placement. Large heading top-left, body text offset right. Red accent bar.

**Typography:**
- Display: `Archivo` (800/900)
- Body: `Nunito` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #ffffff;
    --text-primary: #0a0a0a;
    --text-secondary: #666666;
    --accent-red: #ff3300;
    --grid-line: rgba(0, 0, 0, 0.06);
    --border: #0a0a0a;
}
```

**Signature Elements:**
- Visible grid lines (toggle-able, 6% opacity)
- Asymmetric text placement, never centered
- Bold red accent rectangles and lines
- Oversized numbers and geometric shapes
- Strict hierarchy: one size per level, no exceptions

**When to use:** Design presentations, typography showcases, architecture, anything demanding precision.

---

### 10. Paper & Ink

**Vibe:** Editorial, literary, thoughtful, timeless

**Layout:** Wide margins (like a book page). Single-column text flow. Pull quotes break into margins. Thin horizontal rules between sections.

**Typography:**
- Display: `Cormorant Garamond` (600/700)
- Body: `Source Serif 4` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #faf9f7;
    --text-primary: #1a1a1a;
    --text-secondary: #555555;
    --accent-crimson: #c41e3a;
    --accent-ink: #2c3e50;
    --rule-color: #d4d0ca;
    --bg-pullquote: #f0ede8;
}
```

**Signature Elements:**
- Decorative drop caps (first letter, 3-line height, crimson)
- Pull quotes in larger italic serif, indented with left border
- Elegant thin horizontal rules (`<hr>` styled as hairline)
- Footnote-style annotations (small text, bottom margin)
- Page numbers in old-style figures

**When to use:** Thought leadership, book launches, essay-style talks, academic keynotes.

---

### 11. Notebook Tabs

**Vibe:** Editorial, organized, elegant, tactile

**Layout:** Cream paper card on dark background. Colorful tabs on right edge. Binder holes on left.

**Typography:**
- Display: `Bodoni Moda` (400/700)
- Body: `DM Sans` (400/500)

**Colors:**
```css
:root {
    --bg-outer: #2d2d2d;
    --bg-page: #f8f6f1;
    --text-primary: #1a1a1a;
    --text-secondary: #5a5a5a;
    --tab-1: #98d4bb; /* Mint */
    --tab-2: #c7b8ea; /* Lavender */
    --tab-3: #f4b8c5; /* Pink */
    --tab-4: #a8d8ea; /* Sky */
    --tab-5: #ffe6a7; /* Cream */
}
```

**Signature Elements:**
- Paper container with subtle shadow (`box-shadow: 0 4px 24px rgba(0,0,0,0.3)`)
- Colorful section tabs on right edge (vertical text)
- Binder hole decorations on left margin
- Tab text scales with viewport: `font-size: clamp(0.5rem, 1vh, 0.7rem)`

**When to use:** Workshop decks, multi-topic presentations, organized walkthroughs.

---

### 12. Pastel Geometry

**Vibe:** Friendly, organized, modern, approachable

**Layout:** White card on pastel background. Vertical pills on right edge as section markers.

**Typography:**
- Display: `Plus Jakarta Sans` (700/800)
- Body: `Plus Jakarta Sans` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #c8d9e6;
    --card-bg: #faf9f7;
    --pill-pink: #f0b4d4;
    --pill-mint: #a8d4c4;
    --pill-sage: #5a7c6a;
    --pill-lavender: #9b8dc4;
    --pill-violet: #7c6aad;
}
```

**Signature Elements:**
- Rounded card with soft shadow
- **Vertical pills on right edge** with varying heights (short-medium-tall-medium-short)
- Consistent pill width, organic height variation
- Download/action icon in corner

**When to use:** SaaS product demos, onboarding flows, friendly business presentations.

---

### 13. Morning Brief

**Vibe:** Clean, calm, informative, editorial — like reading a quality newspaper with coffee

**Layout:** Multi-column (2-3 columns) with clear hierarchy. Masthead/date at top. Headline spans full width, body content fills columns below.

**Typography:**
- Display: `Playfair Display` (700/800)
- Body: `Libre Franklin` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #fefdfb;
    --text-primary: #1c1c1c;
    --text-secondary: #6b6b6b;
    --accent-navy: #1a365d;
    --rule-dark: #1c1c1c;
    --rule-light: #d4d0c8;
    --bg-highlight: #fdf6e3;
}
```

**Signature Elements:**
- Double-rule lines above/below masthead (`border-top: 3px double`)
- Multi-column text layout (CSS columns or grid)
- Date stamp top-right in small caps
- Bold horizontal rules between sections (2px solid black)
- Category labels in uppercase spaced tracking (`letter-spacing: 0.15em`)

**When to use:** Weekly updates, news roundups, morning standup summaries, briefing decks.

---

### 14. Campus White

**Vibe:** Academic, structured, trustworthy, clean

**Layout:** Header bar with institution-style branding. Two-column body with sidebar for definitions/notes. Slide numbers in circle badges.

**Typography:**
- Display: `Literata` (600/700)
- Body: `Atkinson Hyperlegible` (400/700)

**Colors:**
```css
:root {
    --bg-primary: #ffffff;
    --bg-sidebar: #f5f5f0;
    --text-primary: #2c2c2c;
    --text-secondary: #6a6a6a;
    --accent-navy: #1b3a5c;
    --accent-gold: #c8a951;
    --border: #ddd8cf;
    --highlight: #e8f4f0;
}
```

**Signature Elements:**
- Top bar with dark background + institution-style title
- Sidebar column for notes, definitions, or citations
- Numbered section badges (circled numbers)
- Footnote references in superscript
- Clean table styling with alternating row colors

**When to use:** Academic talks, university lectures, research presentations, educational content.

---

### 15. Soft Landing

**Vibe:** Startup-modern, welcoming, premium-casual — landing page energy

**Layout:** Centered hero blocks with rounded containers. Alternating full-width and card sections. Generous padding everywhere.

**Typography:**
- Display: `Instrument Sans` (700) — Fontshare
- Body: `Switzer` (400/500) — Fontshare

**Colors:**
```css
:root {
    --bg-primary: #fafafa;
    --bg-card: #ffffff;
    --text-primary: #1a1a2e;
    --text-secondary: #71717a;
    --accent-violet: #7c3aed;
    --accent-violet-light: #ede9fe;
    --accent-emerald: #10b981;
    --border: #e4e4e7;
    --shadow: 0 1px 3px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.04);
}
```

**Signature Elements:**
- Rounded containers (`border-radius: 16px`)
- Soft multi-layered shadows (never harsh)
- Pill-shaped badges and tags
- Gradient accent on CTA buttons (subtle, not garish)
- Feature grid with icon + title + description cards

**When to use:** Startup pitches, product intros, investor decks with a modern vibe.

---

### 16. Watercolor Wash

**Vibe:** Artistic, soft, organic, handcrafted

**Layout:** Content on soft painted background. Text blocks sit in semi-transparent white cards. Asymmetric placement, nothing perfectly centered.

**Typography:**
- Display: `Gilda Display` (400)
- Body: `Karla` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #fdf9f3;
    --wash-blue: rgba(147, 197, 214, 0.3);
    --wash-peach: rgba(240, 180, 158, 0.25);
    --wash-sage: rgba(163, 195, 161, 0.25);
    --wash-lavender: rgba(183, 170, 210, 0.2);
    --text-primary: #3a3a3a;
    --text-secondary: #7a7a7a;
    --card-bg: rgba(255, 255, 255, 0.7);
}
```

**Signature Elements:**
- Blurred CSS gradient blobs simulating watercolor washes
- Semi-transparent frosted text cards (`backdrop-filter: blur(10px)`)
- Soft, irregular border radius on accent shapes
- Muted earth tones, nothing saturated
- Handwritten-feel accent lines (wavy borders via SVG or CSS)

**When to use:** Creative portfolios, art/design talks, wellness/lifestyle brands, wedding/event decks.

---

## Bold & Creative

### 17. Electric Studio

**Vibe:** Bold, clean, professional, high contrast

**Layout:** Split panel — white top, blue bottom. Brand marks in corners. Content straddles the split line.

**Typography:**
- Display: `Manrope` (800)
- Body: `Manrope` (400/500)

**Colors:**
```css
:root {
    --bg-dark: #0a0a0a;
    --bg-white: #ffffff;
    --accent-blue: #4361ee;
    --text-dark: #0a0a0a;
    --text-light: #ffffff;
    --accent-bar: #4361ee;
}
```

**Signature Elements:**
- Two-panel vertical split (dramatic black/white or white/blue)
- Accent bar on panel edge (4px solid accent)
- Quote typography as hero element
- Minimal, confident spacing — let the contrast do the work

**When to use:** Agency portfolios, brand presentations, high-contrast storytelling.

---

### 18. Creative Voltage

**Vibe:** Bold, creative, energetic, retro-modern

**Layout:** Split panels — electric blue left, dark right. Script accents and neon badges.

**Typography:**
- Display: `Syne` (700/800)
- Mono: `Space Mono` (400/700)

**Colors:**
```css
:root {
    --bg-primary: #0066ff;
    --bg-dark: #1a1a2e;
    --accent-neon: #d4ff00;
    --text-light: #ffffff;
    --text-on-blue: #ffffff;
    --badge-bg: #d4ff00;
    --badge-text: #1a1a2e;
}
```

**Signature Elements:**
- Electric blue + neon yellow contrast
- Halftone texture patterns (CSS `radial-gradient` dot grid)
- Neon badges/callouts with sharp corners
- Script typography for creative flair
- Rotated text elements (-90deg sidebar labels)

**When to use:** Creative agency decks, music/event pitches, design showcases.

---

### 19. Split Pastel

**Vibe:** Playful, modern, friendly, creative

**Layout:** Two-color vertical split (peach left, lavender right). Content spans both halves.

**Typography:**
- Display: `Outfit` (700/800)
- Body: `Outfit` (400/500)

**Colors:**
```css
:root {
    --bg-peach: #f5e6dc;
    --bg-lavender: #e4dff0;
    --text-dark: #1a1a1a;
    --badge-mint: #c8f0d8;
    --badge-yellow: #f0f0c8;
    --badge-pink: #f0d4e0;
    --accent-coral: #e88d7a;
}
```

**Signature Elements:**
- Split background colors (50/50 vertical)
- Playful badge pills with icons
- Grid pattern overlay on right panel (subtle dot grid)
- Rounded CTA buttons with shadow
- Content that intentionally crosses the color boundary

**When to use:** Branding presentations, social media strategies, fun product launches.

---

### 20. Vintage Editorial

**Vibe:** Witty, confident, editorial, personality-driven

**Layout:** Centered content on cream. Abstract geometric shapes as accent. Bold bordered call-out boxes.

**Typography:**
- Display: `Fraunces` (700/900) — distinctive serif with optical sizing
- Body: `Work Sans` (400/500)

**Colors:**
```css
:root {
    --bg-cream: #f5f3ee;
    --text-primary: #1a1a1a;
    --text-secondary: #555555;
    --accent-warm: #e8d4c0;
    --accent-orange: #e07a3a;
    --border-heavy: 3px solid #1a1a1a;
}
```

**Signature Elements:**
- Abstract geometric shapes (circle outline + line + dot compositions)
- Bold bordered CTA boxes (`3px solid`)
- Witty, conversational copy style
- Stamp/seal decorative elements (CSS circles with text)
- **No illustrations — only geometric CSS shapes**

**When to use:** Personal brand decks, thought leadership, editorial pitches, witty presentations.

---

### 21. Pop Art

**Vibe:** Bold, loud, comic-book energy, unapologetic

**Layout:** Panel-based like a comic strip. Thick black borders around everything. Speech bubbles for quotes. Rotated highlight boxes.

**Typography:**
- Display: `Bangers` (400)
- Body: `Poppins` (400/600)

**Colors:**
```css
:root {
    --bg-primary: #ffffff;
    --color-red: #ff1744;
    --color-blue: #2979ff;
    --color-yellow: #ffea00;
    --color-black: #0a0a0a;
    --text-primary: #0a0a0a;
    --halftone-dot: #0a0a0a;
}
```

**Signature Elements:**
- Thick black outlines on all containers (`4px solid black`)
- Halftone dot patterns (CSS `radial-gradient` repeated)
- Speech bubble shapes for quotes (CSS `clip-path` + triangle tail)
- Rotated accent text (`transform: rotate(-3deg)`)
- Primary colors only — red, blue, yellow, black, white
- Onomatopoeia words as decorative elements ("POW!", "ZAP!")

**When to use:** Fun pitches, youth marketing, social media decks, anything that refuses to be boring.

---

## Cultural & Special

### 22. 东方墨韵 (Ink Wash)

**Vibe:** Classical Chinese aesthetics, contemplative, artistic, flowing

**Layout:** Generous negative space (留白). Content anchored to one side, leaving 40%+ empty. Vertical text option for titles. Ink wash shapes as background.

**Typography:**
- Display: `Noto Serif SC` (700/900) / `Ma Shan Zheng` (400) for calligraphic headings
- Body: `Noto Sans SC` (300/400)
- Latin fallback: `Cormorant` (500)

**Colors:**
```css
:root {
    --bg-primary: #f7f4ef;
    --bg-scroll: #efe8dc;
    --ink-black: #1a1a1a;
    --ink-gray: #4a4a4a;
    --ink-wash: rgba(26, 26, 26, 0.08);
    --accent-red: #c53d43; /* 印章红 */
    --accent-gold: #b8860b;
    --text-secondary: #8a8070;
}
```

**Signature Elements:**
- Ink wash gradient blobs (CSS radial gradients, low opacity, blurred edges)
- Red seal/stamp (正方形 or 圆形, rotated slightly) as signature mark
- Vertical text option: `writing-mode: vertical-rl` for titles
- Generous 留白 (negative space) — at least 40% of slide empty
- Thin brush-stroke-style borders (1px with slight opacity variation)
- Scroll-paper texture background (subtle warm gradient)

**When to use:** Chinese culture topics, calligraphy/art presentations, tea brands, traditional aesthetics with modern layout.

---

### 23. 和風 (Wafu)

**Vibe:** Japanese minimalism, serene, precise, quietly beautiful

**Layout:** Extreme whitespace. Content in small, precise clusters. Thin horizontal lines as separators. Asymmetric but balanced.

**Typography:**
- Display: `Noto Serif JP` (500/700)
- Body: `Noto Sans JP` (300/400)
- Latin fallback: `Zen Kaku Gothic New` (400)

**Colors:**
```css
:root {
    --bg-primary: #fbfaf8;
    --text-primary: #2c2c2c;
    --text-secondary: #8a8a8a;
    --accent-indigo: #3f3a6b; /* 藍色 */
    --accent-vermillion: #d05a4e; /* 朱色 */
    --accent-matcha: #7ba23f; /* 抹茶 */
    --line-color: #d4d0c8;
    --bg-warm: #f5f0e8;
}
```

**Signature Elements:**
- Extreme whitespace (60%+ of slide is empty)
- Hair-thin lines as separators (`0.5px solid`)
- Small text — deliberately undersized body copy
- Mono-weight circle as decorative mark (thin `border-radius: 50%`)
- Seasonal color accents (spring: sakura pink, summer: indigo, autumn: vermillion, winter: silver)
- Grid of small squares or dots as subtle texture

**When to use:** Design philosophy talks, mindfulness/zen content, Japanese brand presentations, minimalist showcases.

---

### 24. Gradient Dreams

**Vibe:** Modern, fluid, vibrant, Instagram-era polish

**Layout:** Full-slide gradient backgrounds. Content in frosted glass cards. Centered with rounded everything.

**Typography:**
- Display: `Bricolage Grotesque` (700/800)
- Body: `Figtree` (400/500)

**Colors:**
```css
:root {
    --gradient-1: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    --gradient-2: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    --gradient-3: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    --gradient-4: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
    --glass-bg: rgba(255, 255, 255, 0.15);
    --glass-border: rgba(255, 255, 255, 0.25);
    --text-primary: #ffffff;
    --text-on-glass: #ffffff;
}
```

**Signature Elements:**
- Full-bleed gradient backgrounds (change per section)
- Glassmorphism cards done right: `backdrop-filter: blur(20px)`, subtle white border, low-opacity white bg
- Rounded corners on everything (`border-radius: 20px`)
- Floating gradient orbs in background (blurred circles, animated)
- Mesh gradient effect via overlapping radial gradients
- NO flat white backgrounds — gradients everywhere

**When to use:** Social media strategies, Gen-Z audience decks, app showcases, modern brand pitches.

---

### 25. Retro Arcade

**Vibe:** 8-bit nostalgia, playful, pixel-perfect, game-inspired

**Layout:** Chunky bordered sections. Score-board style stat displays. Pixel grid background. Content in "game screen" frame.

**Typography:**
- Display: `Press Start 2P` (400)
- Body: `Silkscreen` (400/700)

**Colors:**
```css
:root {
    --bg-primary: #1a1c2c;
    --bg-screen: #262b44;
    --text-primary: #f4f4f4;
    --pixel-green: #38b764;
    --pixel-red: #e43b44;
    --pixel-blue: #3978a8;
    --pixel-yellow: #fee761;
    --pixel-purple: #b55088;
    --border: #5a6988;
}
```

**Signature Elements:**
- Pixel grid background pattern (4px repeating squares)
- Chunky borders (`4px solid`, no border-radius)
- Score display for stats: `SCORE: 001,234`
- Blinking elements and simple CSS animations
- "INSERT COIN" or "PRESS START" as CTA text
- Health bar style progress indicators (colored blocks in a row)

**When to use:** Gaming presentations, retro-themed events, fun internal decks, hackathon pitches.

---

### 26. Blueprint

**Vibe:** Technical, precise, engineering, schematic

**Layout:** Grid paper background (visible lines). Content positioned like technical annotations with leader lines. Title in block capitals inside a title block (bottom-right, like real blueprints).

**Typography:**
- Display: `Chakra Petch` (600/700)
- Body: `Fira Code` (400/500)

**Colors:**
```css
:root {
    --bg-primary: #1a3a5c;
    --bg-gradient: linear-gradient(180deg, #1a3a5c 0%, #152d4a 100%);
    --grid-line: rgba(255, 255, 255, 0.08);
    --grid-line-major: rgba(255, 255, 255, 0.15);
    --text-primary: #e8f0ff;
    --text-secondary: #7a9ec4;
    --accent-white: #ffffff;
    --annotation: #4a9eff;
}
```

**Signature Elements:**
- Grid paper background (CSS repeating-linear-gradient, minor + major lines)
- Title block in bottom-right corner (bordered rectangle with metadata)
- Annotation leader lines (thin lines from content to labels)
- All-caps labels and dimension-style markers
- Circle callouts with numbers for reference points
- Dashed lines for connections and flow

**When to use:** Architecture overviews, engineering presentations, system design talks, technical proposals.

---

## Font Pairing Quick Reference

| # | Preset | Display Font | Body Font | Source |
|---|--------|-------------|-----------|--------|
| 1 | Keynote Noir | Inter Tight | Inter | Google |
| 2 | Bold Signal | Archivo Black | Space Grotesk | Google |
| 3 | Neon Cyber | Clash Display | Satoshi | Fontshare |
| 4 | Terminal Green | JetBrains Mono | JetBrains Mono | JetBrains |
| 5 | Midnight Corporate | General Sans | Cabinet Grotesk | Fontshare |
| 6 | Cinema Scope | Bebas Neue | Lato | Google |
| 7 | Dark Botanical | Cormorant | IBM Plex Sans | Google |
| 8 | Starfield | Exo 2 | Lexend | Google |
| 9 | Swiss Modern | Archivo | Nunito | Google |
| 10 | Paper & Ink | Cormorant Garamond | Source Serif 4 | Google |
| 11 | Notebook Tabs | Bodoni Moda | DM Sans | Google |
| 12 | Pastel Geometry | Plus Jakarta Sans | Plus Jakarta Sans | Google |
| 13 | Morning Brief | Playfair Display | Libre Franklin | Google |
| 14 | Campus White | Literata | Atkinson Hyperlegible | Google |
| 15 | Soft Landing | Instrument Sans | Switzer | Fontshare |
| 16 | Watercolor Wash | Gilda Display | Karla | Google |
| 17 | Electric Studio | Manrope | Manrope | Google |
| 18 | Creative Voltage | Syne | Space Mono | Google |
| 19 | Split Pastel | Outfit | Outfit | Google |
| 20 | Vintage Editorial | Fraunces | Work Sans | Google |
| 21 | Pop Art | Bangers | Poppins | Google |
| 22 | 东方墨韵 | Noto Serif SC / Ma Shan Zheng | Noto Sans SC | Google |
| 23 | 和風 | Noto Serif JP | Noto Sans JP | Google |
| 24 | Gradient Dreams | Bricolage Grotesque | Figtree | Google |
| 25 | Retro Arcade | Press Start 2P | Silkscreen | Google |
| 26 | Blueprint | Chakra Petch | Fira Code | Google |

---

## DO NOT USE (Generic AI Patterns)

**Fonts:** Inter (as display), Roboto, Arial, Open Sans, system-ui as display. These scream "I didn't try."

**Colors:** `#6366f1` (Tailwind indigo-500 — the unofficial color of generic AI), purple-to-blue gradients on white backgrounds, `#3b82f6` blue on everything.

**Layouts:** Everything dead-centered, identical card grids with no variation, hero sections that all look the same, symmetric everything.

**Decorations:** Realistic illustrations or stock photos as decoration, gratuitous glassmorphism on white backgrounds (glass needs a background to blur), drop shadows without purpose, gradient borders on everything, floating 3D objects.

**Patterns:** Every slide has the same layout, no visual rhythm or pacing. Using the same component (card, list, grid) on every single slide. Title slides that look identical to content slides.

**Copy:** "Revolutionize", "Leverage", "Synergy", "Next-gen", "Cutting-edge" — if the words are generic, the design will feel generic too.

---

## CSS Gotchas

### Negating CSS Functions

**WRONG — silently ignored by browsers (no console error):**
```css
right: -clamp(28px, 3.5vw, 44px);   /* Browser ignores this */
margin-left: -min(10vw, 100px);      /* Browser ignores this */
```

**CORRECT — wrap in `calc()`:**
```css
right: calc(-1 * clamp(28px, 3.5vw, 44px));  /* Works */
margin-left: calc(-1 * min(10vw, 100px));     /* Works */
```

CSS does not allow a leading `-` before function names. The browser silently discards the entire declaration — no error, the element just appears in the wrong position. **Always use `calc(-1 * ...)` to negate CSS function values.**

### Viewport Units in Nested Containers

**Problem:** `vw` and `vh` always reference the viewport, not the parent container. Slides in a container that isn't full-screen will overflow.

```css
/* WRONG — if slide container is 80% of viewport */
.slide-title { font-size: 8vw; }  /* Way too big */

/* CORRECT — use container-relative units or clamp */
.slide-title { font-size: clamp(2rem, 5cqw, 5rem); }  /* Container query units */
```

Use `cqw`/`cqh` (container query units) when slides live inside a container, or `clamp()` with reasonable bounds.

### Backdrop-filter Requires Background

**Problem:** `backdrop-filter: blur()` is invisible without a semi-transparent background.

```css
/* WRONG — blur has nothing to show through */
.glass-card {
    backdrop-filter: blur(20px);
    background: #ffffff;  /* Fully opaque = no blur visible */
}

/* CORRECT */
.glass-card {
    backdrop-filter: blur(20px);
    background: rgba(255, 255, 255, 0.15);  /* Semi-transparent */
    border: 1px solid rgba(255, 255, 255, 0.25);
}
```

Glassmorphism only works when the background is semi-transparent AND there's something behind it to blur. On a flat white page, it's invisible.
