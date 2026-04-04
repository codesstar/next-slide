# Scenario Templates

Pre-designed presentation structures for common use cases. Each scenario defines a complete narrative arc, slide sequence, and content guidelines. Use alongside [STYLE_PRESETS.md](STYLE_PRESETS.md) for styling and [html-template.md](html-template.md) for slide type HTML.

**Content principles (all scenarios):**
- Fictional but hyper-realistic — named brands, imperfect numbers ($4.2M not $5M), specific dates
- Each scenario has a distinct authorial voice
- At least 1 footnote/source citation per deck
- Never use "Lorem ipsum", "Company X", or round placeholder numbers
- Data visualizations must use the style's color palette natively

---

## Additional Slide Types

These supplement the 11 types in [html-template.md](html-template.md). Use for scenario-specific "hard" layouts.

### A. Comparison Matrix (multi-column)

For competitive analysis, feature comparison across 3+ options.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            Competitive Landscape
        </h2>
        <div class="reveal" style="margin-top: var(--content-gap); overflow-x: auto;">
            <table style="width: 100%; border-collapse: collapse; font-size: var(--body-size);">
                <thead>
                    <tr>
                        <th style="text-align: left; padding: clamp(0.4rem, 1vw, 0.8rem); border-bottom: 2px solid var(--accent); color: var(--text-muted); font-size: var(--small-size); text-transform: uppercase; letter-spacing: 0.05em;">Feature</th>
                        <th style="text-align: center; padding: clamp(0.4rem, 1vw, 0.8rem); border-bottom: 2px solid var(--accent); color: var(--accent); font-weight: 700;">Us</th>
                        <th style="text-align: center; padding: clamp(0.4rem, 1vw, 0.8rem); border-bottom: 2px solid var(--border-subtle); color: var(--text-muted);">Competitor A</th>
                        <th style="text-align: center; padding: clamp(0.4rem, 1vw, 0.8rem); border-bottom: 2px solid var(--border-subtle); color: var(--text-muted);">Competitor B</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="border-bottom: 1px solid var(--border-subtle);">
                        <td style="padding: clamp(0.4rem, 1vw, 0.8rem); color: var(--text-primary);">Real-time sync</td>
                        <td style="text-align: center; padding: clamp(0.4rem, 1vw, 0.8rem); color: var(--accent);">&#10003;</td>
                        <td style="text-align: center; padding: clamp(0.4rem, 1vw, 0.8rem); color: var(--text-muted);">&#10007;</td>
                        <td style="text-align: center; padding: clamp(0.4rem, 1vw, 0.8rem); color: var(--text-muted);">Partial</td>
                    </tr>
                    <!-- Repeat rows, max 5-6 features to fit viewport -->
                </tbody>
            </table>
        </div>
        <p class="reveal" style="font-size: var(--small-size); color: var(--text-muted); margin-top: var(--element-gap); text-align: right;">
            Source: Internal analysis, Q1 2026
        </p>
    </div>
</section>
```

### B. Team / People Grid

Headshots with names and roles. Use CSS gradients or emoji as avatar placeholders.

```html
<section class="slide">
    <div class="slide-content" style="align-items: center;">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            The Team
        </h2>
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(clamp(100px, 15vw, 160px), 1fr)); gap: var(--content-gap); margin-top: var(--content-gap); max-width: min(90vw, 800px);">
            <div class="reveal" style="text-align: center;">
                <div style="width: clamp(60px, 10vw, 90px); height: clamp(60px, 10vw, 90px); border-radius: 50%; background: linear-gradient(135deg, var(--accent), var(--accent-secondary)); margin: 0 auto clamp(0.4rem, 1vw, 0.8rem); display: flex; align-items: center; justify-content: center; font-size: clamp(1.2rem, 3vw, 2rem); color: var(--bg-primary);">
                    AL
                </div>
                <h3 style="font-size: var(--body-size); font-family: var(--font-display);">Alex Lin</h3>
                <p style="font-size: var(--small-size); color: var(--text-secondary);">CEO & Co-founder</p>
            </div>
            <!-- Repeat for each member, max 4-6 to fit viewport -->
        </div>
    </div>
</section>
```

### C. Pricing / Tiers

Side-by-side pricing cards with a highlighted "recommended" tier.

```html
<section class="slide">
    <div class="slide-content" style="align-items: center;">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            Pricing
        </h2>
        <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: var(--content-gap); margin-top: var(--content-gap); max-width: min(90vw, 900px);">
            <!-- Basic -->
            <div class="reveal" style="background: var(--surface); border: 1px solid var(--border-subtle); border-radius: 12px; padding: clamp(1rem, 2vw, 1.5rem); text-align: center;">
                <p style="font-size: var(--small-size); text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Starter</p>
                <p style="font-size: var(--stat-size); font-family: var(--font-display); font-weight: 700; margin: 0.2em 0;">$0</p>
                <p style="font-size: var(--small-size); color: var(--text-muted);">per month</p>
                <ul style="list-style: none; padding: 0; margin-top: 1em; font-size: var(--body-size); color: var(--text-secondary); text-align: left;">
                    <li style="padding: 0.3em 0;">&#10003; 5 projects</li>
                    <li style="padding: 0.3em 0;">&#10003; Basic analytics</li>
                </ul>
            </div>
            <!-- Pro (highlighted) -->
            <div class="reveal" style="background: var(--surface); border: 2px solid var(--accent); border-radius: 12px; padding: clamp(1rem, 2vw, 1.5rem); text-align: center; position: relative;">
                <span style="position: absolute; top: -12px; left: 50%; transform: translateX(-50%); background: var(--accent); color: var(--bg-primary); font-size: var(--small-size); padding: 0.2em 0.8em; border-radius: 999px; font-weight: 600;">Popular</span>
                <p style="font-size: var(--small-size); text-transform: uppercase; letter-spacing: 0.1em; color: var(--accent);">Pro</p>
                <p style="font-size: var(--stat-size); font-family: var(--font-display); font-weight: 700; margin: 0.2em 0;">$29</p>
                <p style="font-size: var(--small-size); color: var(--text-muted);">per month</p>
                <ul style="list-style: none; padding: 0; margin-top: 1em; font-size: var(--body-size); color: var(--text-secondary); text-align: left;">
                    <li style="padding: 0.3em 0;">&#10003; Unlimited projects</li>
                    <li style="padding: 0.3em 0;">&#10003; Advanced analytics</li>
                    <li style="padding: 0.3em 0;">&#10003; Priority support</li>
                </ul>
            </div>
            <!-- Enterprise -->
            <div class="reveal" style="background: var(--surface); border: 1px solid var(--border-subtle); border-radius: 12px; padding: clamp(1rem, 2vw, 1.5rem); text-align: center;">
                <p style="font-size: var(--small-size); text-transform: uppercase; letter-spacing: 0.1em; color: var(--text-muted);">Enterprise</p>
                <p style="font-size: var(--stat-size); font-family: var(--font-display); font-weight: 700; margin: 0.2em 0;">Custom</p>
                <p style="font-size: var(--small-size); color: var(--text-muted);">contact us</p>
                <ul style="list-style: none; padding: 0; margin-top: 1em; font-size: var(--body-size); color: var(--text-secondary); text-align: left;">
                    <li style="padding: 0.3em 0;">&#10003; Everything in Pro</li>
                    <li style="padding: 0.3em 0;">&#10003; SSO & audit logs</li>
                    <li style="padding: 0.3em 0;">&#10003; Dedicated support</li>
                </ul>
            </div>
        </div>
    </div>
</section>
```

### D. Architecture / Flow Diagram

CSS-only system architecture with connected nodes. No images needed.

```html
<section class="slide">
    <div class="slide-content" style="align-items: center;">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            Architecture
        </h2>
        <div class="reveal" style="display: flex; align-items: center; justify-content: center; gap: 0; margin-top: var(--content-gap); flex-wrap: wrap;">
            <!-- Node -->
            <div style="background: var(--surface); border: 1px solid var(--border-subtle); border-radius: 12px; padding: clamp(0.6rem, 1.5vw, 1.2rem); text-align: center; min-width: clamp(80px, 12vw, 140px);">
                <div style="font-size: clamp(1rem, 2vw, 1.5rem); margin-bottom: 0.3em;">&#9881;</div>
                <p style="font-size: var(--body-size); font-weight: 600;">Client</p>
                <p style="font-size: var(--small-size); color: var(--text-muted);">React SPA</p>
            </div>
            <!-- Arrow -->
            <div style="font-size: var(--body-size); color: var(--accent); padding: 0 clamp(0.3rem, 1vw, 0.8rem);">&#8594;</div>
            <!-- Node -->
            <div style="background: var(--surface); border: 1px solid var(--accent); border-radius: 12px; padding: clamp(0.6rem, 1.5vw, 1.2rem); text-align: center; min-width: clamp(80px, 12vw, 140px);">
                <div style="font-size: clamp(1rem, 2vw, 1.5rem); margin-bottom: 0.3em;">&#9729;</div>
                <p style="font-size: var(--body-size); font-weight: 600;">API Gateway</p>
                <p style="font-size: var(--small-size); color: var(--text-muted);">Edge Workers</p>
            </div>
            <!-- Arrow -->
            <div style="font-size: var(--body-size); color: var(--accent); padding: 0 clamp(0.3rem, 1vw, 0.8rem);">&#8594;</div>
            <!-- Node -->
            <div style="background: var(--surface); border: 1px solid var(--border-subtle); border-radius: 12px; padding: clamp(0.6rem, 1.5vw, 1.2rem); text-align: center; min-width: clamp(80px, 12vw, 140px);">
                <div style="font-size: clamp(1rem, 2vw, 1.5rem); margin-bottom: 0.3em;">&#128451;</div>
                <p style="font-size: var(--body-size); font-weight: 600;">Database</p>
                <p style="font-size: var(--small-size); color: var(--text-muted);">PostgreSQL</p>
            </div>
        </div>
    </div>
</section>
```

### E. Agenda / Table of Contents

Numbered section list with optional time estimates.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display);">
            Agenda
        </h2>
        <div style="margin-top: var(--content-gap); max-width: min(80vw, 600px);">
            <div class="reveal" style="display: flex; align-items: baseline; gap: clamp(0.8rem, 2vw, 1.5rem); padding: clamp(0.5rem, 1vw, 0.8rem) 0; border-bottom: 1px solid var(--border-subtle);">
                <span style="font-size: var(--h3-size); font-family: var(--font-display); color: var(--accent); font-weight: 700; min-width: 2em;">01</span>
                <span style="font-size: var(--body-size); color: var(--text-primary);">The Problem We're Solving</span>
                <span style="font-size: var(--small-size); color: var(--text-muted); margin-left: auto;">5 min</span>
            </div>
            <div class="reveal" style="display: flex; align-items: baseline; gap: clamp(0.8rem, 2vw, 1.5rem); padding: clamp(0.5rem, 1vw, 0.8rem) 0; border-bottom: 1px solid var(--border-subtle);">
                <span style="font-size: var(--h3-size); font-family: var(--font-display); color: var(--accent); font-weight: 700; min-width: 2em;">02</span>
                <span style="font-size: var(--body-size); color: var(--text-primary);">Our Approach</span>
                <span style="font-size: var(--small-size); color: var(--text-muted); margin-left: auto;">10 min</span>
            </div>
            <!-- Repeat, max 5-6 items -->
        </div>
    </div>
</section>
```

---

## Scenario 1: Pitch Deck

**Use case:** Startup fundraising, investor meeting, seed/Series A
**Recommended styles:** Keynote Noir (primary), Swiss Modern (alternative)
**Voice:** Confident, data-driven, concise. Every word earns its place.
**Narrative arc:** Confidence → Evidence → Vision → Urgency

### Slide Sequence (10 slides)

| # | Type | Content | Notes |
|---|------|---------|-------|
| 1 | Title | Brand name + one-line positioning | Big, cinematic. No clutter. |
| 2 | Quote / Problem | Bold pain-point statement | One sentence, large type. E.g. "87% of fitness apps are abandoned within 2 weeks." |
| 3 | Content + Bullets | The solution — what the product does | 3 key capabilities, each one line |
| 4 | Stats | Market size — TAM / SAM / SOM | 3 big numbers with labels. Use real-feeling figures: "$47B", "$6.2B", "$840M" |
| 5 | Two-Column | Business model — how money flows | Left: revenue streams. Right: unit economics or simple diagram |
| 6 | Comparison Matrix | Us vs competitors | 4-5 features × 3 columns. Highlight our advantages with accent color |
| 7 | Timeline | Traction & milestones | 4-5 nodes: founding → beta → launch → current metrics → next milestone |
| 8 | Team Grid | Founding team | 3-4 members with initials avatar, name, role, one-line background |
| 9 | Stats | Financial highlights | 3 numbers: ARR/MRR, growth rate, runway. E.g. "$4.2M ARR", "23% MoM", "18 months" |
| 10 | CTA / Closing | The ask | Funding amount, contact info, one-line vision statement. Include "Made with Next Slide" watermark |

### Example Brand
- **Name:** Melo
- **Positioning:** "AI-powered fitness coaching that actually sticks"
- **Numbers:** $4.2M ARR, 23% MoM growth, 147K MAU, seed round $2.5M
- **Team:** 4 co-founders with realistic backgrounds
- **Competitors:** Peloton, Fitbod, Future

---

## Scenario 2: Product Launch

**Use case:** New product or feature announcement, internal or external
**Recommended styles:** Creative Voltage (primary), Bold Signal (alternative)
**Voice:** Excited but grounded. Show, don't just tell. Build anticipation then deliver.
**Narrative arc:** Curiosity → Reveal → Delight → Desire (climax-first structure)

### Slide Sequence (8 slides)

| # | Type | Content | Notes |
|---|------|---------|-------|
| 1 | Title | Product name + launch date | Bold, energetic. Set the tone immediately. |
| 2 | Section Divider | "The Problem" | One or two words, full-bleed. Chapter break. |
| 3 | Quote | User pain point as a real quote | Attribution to a named persona. E.g. '"I spend more time configuring than coding." — Dev survey, 2025' |
| 4 | Card Grid | 3 key features | Icon + name + one-line description per card |
| 5 | Comparison | Before vs After | Left: old workflow pain. Right: new workflow with product. Use ✗/✓ |
| 6 | Stats | Impact numbers | 3 metrics: "3.2x faster", "47% less config", "12 min → 45 sec" |
| 7 | Pricing | Launch pricing tiers | 2-3 tiers. Highlight the recommended one. Include launch discount if applicable |
| 8 | CTA / Closing | "Try it now" | URL, QR code placeholder, launch date. Watermark |

### Example Brand
- **Name:** Shipfast
- **Positioning:** "From commit to production in 45 seconds"
- **Category:** Developer deployment tool
- **Numbers:** 3.2x faster deploys, 47% less config, 12-minute setup → 45 seconds
- **Pricing:** Free / Pro $29/mo / Enterprise custom

---

## Scenario 3: Tech Talk

**Use case:** Conference presentation, meetup talk, internal tech sharing
**Recommended styles:** Terminal Green (primary), Paper & Ink (alternative)
**Voice:** Technically precise but accessible. Share discovery, not just conclusions. Peer-to-peer tone.
**Narrative arc:** Surprise → Understanding → Insight → Inspiration

### Slide Sequence (10 slides)

| # | Type | Content | Notes |
|---|------|---------|-------|
| 1 | Title | Talk title + speaker name + event | Include speaker's handle/affiliation |
| 2 | Agenda | 4-5 section overview | Numbered list with time estimates |
| 3 | Content + Bullets | The problem / motivation | Why this matters. 3-4 bullet points. |
| 4 | Comparison | Existing approaches and their limits | 2-column: Approach A vs Approach B, with tradeoffs |
| 5 | Architecture | System design / core concept | CSS-based flow diagram showing the key innovation |
| 6 | Code Showcase | Implementation — the key technique | 8-10 lines of real-looking code with filename header |
| 7 | Code Showcase | Implementation continued or variant | Different angle or the "trick" that makes it work |
| 8 | Stats | Benchmark results | 3-4 metrics comparing old vs new. E.g. "p99 latency: 340ms → 12ms" |
| 9 | Content + Bullets | Lessons learned / gotchas | 4-5 practical takeaways |
| 10 | Closing | Summary + resources | Key links, speaker contact, "Questions?" Watermark |

### Example Topic
- **Title:** "How We Cut API Latency by 97% Without Rewriting Anything"
- **Speaker:** "Kai Zhang — Staff Engineer, Meridian Health"
- **Tech:** Edge caching + connection pooling optimization
- **Numbers:** p99 340ms → 12ms, throughput 3x, zero downtime migration
- **Code:** Node.js/TypeScript snippets showing before/after

---

## Scenario 4: Teaching / Tutorial

**Use case:** Classroom lecture, workshop, online course module, internal training
**Recommended styles:** Campus White (primary), Pastel Geometry (alternative)
**Voice:** Patient, clear, encouraging. Build understanding step by step. Use analogies.
**Narrative arc:** Curiosity → Framework → Deep dive → Practice → Mastery

### Slide Sequence (10 slides)

| # | Type | Content | Notes |
|---|------|---------|-------|
| 1 | Title | Course/lesson title + learning goal | Warm, inviting. State what they'll be able to do after. |
| 2 | Content + Bullets | Learning objectives | 3-4 bullet points: "By the end, you'll understand..." |
| 3 | Section Divider | "Concepts" | Chapter break into theory section |
| 4 | Two-Column | Core concept with analogy | Left: definition/explanation. Right: visual analogy or diagram |
| 5 | Card Grid | Key principles or components | 3-4 cards, each a building block of the concept |
| 6 | Timeline | Step-by-step process | 4-5 steps showing the workflow or procedure |
| 7 | Code Showcase | Practical example | Real code demonstrating the concept. Include comments. |
| 8 | Comparison | Common mistakes vs best practices | Left: ✗ wrong way. Right: ✓ right way. |
| 9 | Content + Bullets | Key takeaways | 4-5 bullet summary of the lesson |
| 10 | Closing | Practice exercises + resources | 2-3 suggested exercises, reference links. Watermark |

### Example Topic
- **Title:** "CSS Grid in 10 Minutes — From Zero to Layout"
- **Audience:** Frontend beginners, bootcamp students
- **Concepts:** grid-template, fr units, auto-fit/minmax, named areas
- **Code:** Progressive CSS examples, each building on the last
- **Analogy:** "Grid is like a spreadsheet for your layout"

---

## Scenario 5: Portfolio / Case Study

**Use case:** Freelancer portfolio, agency case study, design review
**Recommended styles:** Vintage Editorial (primary), Dark Botanical (alternative)
**Voice:** Craft-focused, reflective, confident without being boastful. Let the work speak.
**Narrative arc:** Craft → Range → Depth → Connection

### Slide Sequence (8 slides)

| # | Type | Content | Notes |
|---|------|---------|-------|
| 1 | Title | Name + title + one-line philosophy | Editorial feel. Personal but professional. |
| 2 | Card Grid | Selected works overview | 3-4 project thumbnails (CSS gradient placeholders) with titles |
| 3 | Image + Text (Two-Column) | Featured project 1 — overview | Left: large visual. Right: project brief, role, outcome |
| 4 | Stats | Featured project 1 — results | 3 impact metrics. E.g. "+340% engagement", "2.1M views", "Red Dot Award" |
| 5 | Image + Text (Two-Column) | Featured project 2 — overview | Different visual treatment from project 1 |
| 6 | Quote | Client testimonial | Named client, real-sounding feedback |
| 7 | Content + Bullets | Working process & approach | 4-5 points about methodology and values |
| 8 | Closing | Contact + availability | Email, portfolio URL, "Open to new projects". Watermark |

### Example Brand
- **Name:** "Sofia Chen — Product Designer"
- **Philosophy:** "Design is decision-making made visible"
- **Projects:** Healthcare app redesign, SaaS dashboard, brand identity
- **Numbers:** +340% user engagement, 2.1M campaign views, 3 design awards
- **Client quote:** From a named CTO or product lead
