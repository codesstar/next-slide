# Animation Patterns Reference

Use this when generating presentations. Choose animations by the **feeling** the user wants, not by technical name.

---

## Mood-to-Animation Map

### Dramatic / Cinematic
**When to use:** keynotes, product launches, storytelling decks
**Tempo:** slow, deliberate (0.8-1.5s durations)

| Element | Animation | CSS |
|---------|-----------|-----|
| Title entrance | Slow fade + scale from 0.85 | `opacity 0→1, scale 0.85→1, 1.2s ease-out-expo` |
| Subtitle | Delayed fade up | `opacity 0→1, translateY(20px)→0, 0.8s, delay 0.4s` |
| Background | Slow gradient shift | `@keyframes` with `background-position` over 15s |
| Section transition | Blur in from nothing | `filter: blur(20px)→0, opacity 0→1, 1s` |
| Image reveal | Clip-path wipe from center | `clip-path: inset(50%)→inset(0), 1s ease-out-expo` |

```css
/* Dramatic: Clip-path wipe reveal */
.reveal-wipe {
    clip-path: inset(0 50% 0 50%);
    opacity: 0;
    transition: clip-path 1s var(--ease-out-expo), opacity 0.6s ease;
}
.visible .reveal-wipe {
    clip-path: inset(0 0 0 0);
    opacity: 1;
}

/* Dramatic: Spotlight focus */
.spotlight-bg {
    background:
        radial-gradient(ellipse 600px 400px at 50% 40%, rgba(255,255,255,0.06) 0%, transparent 100%),
        var(--bg-primary);
}
```

---

### Techy / Futuristic
**When to use:** SaaS demos, developer talks, AI/tech products
**Tempo:** medium-fast, precise (0.3-0.6s)

| Element | Animation | CSS |
|---------|-----------|-----|
| Title | Glitch/scramble text | JS character scramble → final text |
| Cards | Grid reveal (stagger from top-left) | `opacity + translateY, stagger 0.06s per item` |
| Accent | Neon glow pulse | `box-shadow` animation with accent color |
| Background | Particle canvas or grid lines | Canvas API or CSS grid pattern |
| Data | Counter roll-up | JS `requestAnimationFrame` counter |
| Border | Scanning line | `linear-gradient` animated along border |

```css
/* Tech: Neon glow pulse */
.glow {
    box-shadow: 0 0 10px var(--accent-glow), 0 0 30px var(--accent-glow);
    animation: glow-pulse 3s ease-in-out infinite alternate;
}
@keyframes glow-pulse {
    0% { box-shadow: 0 0 10px var(--accent-glow), 0 0 30px var(--accent-glow); }
    100% { box-shadow: 0 0 20px var(--accent-glow), 0 0 60px var(--accent-glow), 0 0 100px var(--accent-glow); }
}

/* Tech: Scanning border line */
.scan-border {
    position: relative;
    overflow: hidden;
}
.scan-border::after {
    content: '';
    position: absolute;
    top: 0; left: -100%;
    width: 100%; height: 2px;
    background: linear-gradient(90deg, transparent, var(--accent), transparent);
    animation: scan 3s linear infinite;
}
@keyframes scan {
    0% { left: -100%; }
    100% { left: 100%; }
}

/* Tech: Grid background */
.grid-bg {
    background-image:
        linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
        linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
    background-size: 50px 50px;
}
```

```javascript
/* Tech: Text scramble effect */
class TextScramble {
    constructor(el) {
        this.el = el;
        this.chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*';
        this.queue = [];
        this.frame = 0;
        this.resolve = null;
    }

    setText(newText) {
        const oldText = this.el.textContent;
        const length = Math.max(oldText.length, newText.length);
        return new Promise(resolve => {
            this.resolve = resolve;
            this.queue = [];
            for (let i = 0; i < length; i++) {
                const from = oldText[i] || '';
                const to = newText[i] || '';
                const start = Math.floor(Math.random() * 20);
                const end = start + Math.floor(Math.random() * 20);
                this.queue.push({ from, to, start, end });
            }
            cancelAnimationFrame(this.frameRequest);
            this.frame = 0;
            this.update();
        });
    }

    update() {
        let output = '';
        let complete = 0;
        for (let i = 0; i < this.queue.length; i++) {
            let { from, to, start, end, char } = this.queue[i];
            if (this.frame >= end) {
                complete++;
                output += to;
            } else if (this.frame >= start) {
                if (!char || Math.random() < 0.28) {
                    char = this.chars[Math.floor(Math.random() * this.chars.length)];
                    this.queue[i].char = char;
                }
                output += `<span style="color: var(--accent); opacity: 0.6;">${char}</span>`;
            } else {
                output += from;
            }
        }
        this.el.innerHTML = output;
        if (complete === this.queue.length) {
            this.resolve();
        } else {
            this.frameRequest = requestAnimationFrame(() => this.update());
            this.frame++;
        }
    }
}
```

---

### Playful / Friendly
**When to use:** education, community, consumer products, casual pitches
**Tempo:** bouncy, springy (0.4-0.8s with overshoot)

| Element | Animation | CSS |
|---------|-----------|-----|
| Cards | Bounce in from below | `translateY(60px)→0` with `ease-out-back` |
| Icons | Pop + slight rotate | `scale(0)→1.1→1, rotate(-5deg)→0` |
| Hover | Float / bob on hover | `translateY(-4px)` with spring easing |
| Background | Soft gradient blobs | Animated radial gradients, slow drift |
| Transitions | Elastic slide | `ease-spring` with overshoot |

```css
/* Playful: Bounce in */
.reveal-bounce {
    opacity: 0;
    transform: translateY(60px) scale(0.9);
    transition: opacity 0.5s ease, transform 0.6s var(--ease-out-back);
}
.visible .reveal-bounce {
    opacity: 1;
    transform: translateY(0) scale(1);
}

/* Playful: Pop with rotate */
.reveal-pop {
    opacity: 0;
    transform: scale(0) rotate(-10deg);
    transition: opacity 0.3s ease, transform 0.5s var(--ease-spring);
}
.visible .reveal-pop {
    opacity: 1;
    transform: scale(1) rotate(0);
}

/* Playful: Float on hover */
.float-hover {
    transition: transform 0.3s var(--ease-out-back), box-shadow 0.3s ease;
}
.float-hover:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

/* Playful: Soft blob background */
.blob-bg {
    background:
        radial-gradient(ellipse at 25% 75%, rgba(255, 182, 193, 0.3) 0%, transparent 50%),
        radial-gradient(ellipse at 75% 25%, rgba(135, 206, 250, 0.3) 0%, transparent 50%),
        radial-gradient(ellipse at 50% 50%, rgba(255, 255, 150, 0.15) 0%, transparent 40%),
        var(--bg-primary);
}
```

---

### Professional / Corporate
**When to use:** investor decks, quarterly reviews, B2B sales
**Tempo:** crisp, fast, no-nonsense (0.2-0.4s)

| Element | Animation | CSS |
|---------|-----------|-----|
| All elements | Quick fade up | `opacity + translateY(15px), 0.3s ease-out` |
| Charts/data | Draw-in / counter | SVG `stroke-dashoffset` or JS counter |
| Transitions | Clean slide | Minimal, no overshoot |
| Cards | Subtle lift on hover | `translateY(-2px), box-shadow` |
| Accent | Thin line reveals | `width: 0→100%` underline |

```css
/* Corporate: Crisp fade */
.reveal-crisp {
    opacity: 0;
    transform: translateY(15px);
    transition: opacity 0.3s ease-out, transform 0.3s ease-out;
}
.visible .reveal-crisp {
    opacity: 1;
    transform: translateY(0);
}

/* Corporate: Line reveal accent */
.line-accent {
    position: relative;
    display: inline-block;
}
.line-accent::after {
    content: '';
    position: absolute;
    bottom: -4px;
    left: 0;
    width: 0;
    height: 2px;
    background: var(--accent);
    transition: width 0.5s var(--ease-out-expo);
}
.visible .line-accent::after {
    width: 100%;
}

/* Corporate: Data card */
.data-card {
    background: var(--surface);
    border: 1px solid var(--border-subtle);
    border-radius: 8px;
    padding: 1.2em;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}
.data-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
```

---

### Calm / Minimal
**When to use:** wellness, art, personal stories, meditation-style talks
**Tempo:** very slow, gentle (1-2s durations)

| Element | Animation | CSS |
|---------|-----------|-----|
| Text | Gentle fade, no movement | `opacity 0→1, 1.5s ease` |
| Images | Very slow scale | `scale(1.02)→1, 2s ease` |
| Spacing | Breathe (subtle scale) | `@keyframes breathe` oscillation |
| Background | Slow gradient morph | `background-position` over 20s+ |
| Everything | Reduced motion friendly | Minimal transforms, opacity only |

```css
/* Calm: Gentle fade only */
.reveal-gentle {
    opacity: 0;
    transition: opacity 1.5s ease;
}
.visible .reveal-gentle {
    opacity: 1;
}

/* Calm: Slow zoom settle */
.reveal-zoom-settle {
    opacity: 0;
    transform: scale(1.04);
    transition: opacity 1.5s ease, transform 2s ease;
}
.visible .reveal-zoom-settle {
    opacity: 1;
    transform: scale(1);
}

/* Calm: Breathing animation for decorative elements */
@keyframes breathe {
    0%, 100% { transform: scale(1); opacity: 0.6; }
    50% { transform: scale(1.03); opacity: 0.8; }
}
.breathe {
    animation: breathe 6s ease-in-out infinite;
}
```

---

### Editorial / Magazine
**When to use:** media, journalism, culture, design showcases
**Tempo:** deliberate, staggered (0.4-0.8s with strong stagger)

| Element | Animation | CSS |
|---------|-----------|-----|
| Headlines | Mask reveal (text clips in) | `clip-path: inset(0 0 100% 0)→inset(0)` |
| Body text | Staggered line-by-line | Each `<span>` delayed 0.05s |
| Images | Parallax on scroll | JS `transform: translateY(scroll * rate)` |
| Pull quotes | Slide from left with bar | `translateX(-30px)→0` with left border |
| Grid items | Sequential column reveal | Stagger by column index |

```css
/* Editorial: Mask reveal for headlines */
.reveal-mask {
    clip-path: inset(0 0 100% 0);
    transition: clip-path 0.7s var(--ease-out-expo);
}
.visible .reveal-mask {
    clip-path: inset(0 0 0 0);
}

/* Editorial: Pull quote slide-in */
.reveal-quote {
    opacity: 0;
    transform: translateX(-30px);
    border-left: 3px solid var(--accent);
    padding-left: 1.2em;
    transition: opacity 0.6s ease, transform 0.6s var(--ease-out-expo);
}
.visible .reveal-quote {
    opacity: 1;
    transform: translateX(0);
}

/* Editorial: Image parallax container */
.parallax-container {
    overflow: hidden;
    position: relative;
}
.parallax-container img {
    transform: translateY(var(--parallax-offset, 0));
    transition: transform 0.1s linear;
    /* Slightly oversized to allow movement */
    width: 100%;
    height: 120%;
    object-fit: cover;
}
```

---

### Energetic / Dynamic
**When to use:** sports, gaming, events, youth brands
**Tempo:** fast, punchy (0.2-0.5s with high contrast motion)

| Element | Animation | CSS |
|---------|-----------|-----|
| Title | Slam in from top | `translateY(-100vh)→0, 0.4s ease-out` |
| Cards | Rapid stagger pop | `scale(0.5)→1, stagger 0.04s` |
| Background | High-contrast color flash | Quick `background-color` transition |
| Accents | Stripe / slash animations | Diagonal clip-path reveals |
| Text | Bold typewriter punch | JS typewriter at 30ms per char |

```css
/* Energetic: Slam entrance */
.reveal-slam {
    opacity: 0;
    transform: translateY(-80px) scale(1.1);
    transition: opacity 0.3s ease, transform 0.4s var(--ease-out-expo);
}
.visible .reveal-slam {
    opacity: 1;
    transform: translateY(0) scale(1);
}

/* Energetic: Diagonal wipe */
.reveal-diagonal {
    clip-path: polygon(0 0, 0 0, 0 100%, 0 100%);
    transition: clip-path 0.6s var(--ease-out-expo);
}
.visible .reveal-diagonal {
    clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
}

/* Energetic: Rapid stagger (use with .grid children) */
.rapid-stagger > * {
    opacity: 0;
    transform: scale(0.5);
    transition: opacity 0.3s ease, transform 0.3s var(--ease-out-back);
}
.visible .rapid-stagger > *:nth-child(1) { transition-delay: 0.02s; }
.visible .rapid-stagger > *:nth-child(2) { transition-delay: 0.06s; }
.visible .rapid-stagger > *:nth-child(3) { transition-delay: 0.10s; }
.visible .rapid-stagger > *:nth-child(4) { transition-delay: 0.14s; }
.visible .rapid-stagger > *:nth-child(5) { transition-delay: 0.18s; }
.visible .rapid-stagger > *:nth-child(6) { transition-delay: 0.22s; }
.visible .rapid-stagger > * {
    opacity: 1;
    transform: scale(1);
}
```

---

## Universal Entrance Animations

These work across all moods. Pick based on element type.

```css
/* Fade + Slide Up (most versatile — use as default) */
.reveal {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.6s var(--ease-out-expo),
                transform 0.6s var(--ease-out-expo);
}
.visible .reveal {
    opacity: 1;
    transform: translateY(0);
}

/* Scale In (for cards, images) */
.reveal-scale {
    opacity: 0;
    transform: scale(0.9);
    transition: opacity 0.6s ease, transform 0.6s var(--ease-out-expo);
}
.visible .reveal-scale {
    opacity: 1;
    transform: scale(1);
}

/* Slide from Left (for text blocks, quotes) */
.reveal-left {
    opacity: 0;
    transform: translateX(-50px);
    transition: opacity 0.6s ease, transform 0.6s var(--ease-out-expo);
}
.visible .reveal-left {
    opacity: 1;
    transform: translateX(0);
}

/* Slide from Right */
.reveal-right {
    opacity: 0;
    transform: translateX(50px);
    transition: opacity 0.6s ease, transform 0.6s var(--ease-out-expo);
}
.visible .reveal-right {
    opacity: 1;
    transform: translateX(0);
}

/* Blur In (for hero elements, dramatic reveals) */
.reveal-blur {
    opacity: 0;
    filter: blur(10px);
    transition: opacity 0.8s ease, filter 0.8s var(--ease-out-expo);
}
.visible .reveal-blur {
    opacity: 1;
    filter: blur(0);
}

/* Flip In (for cards with 3D effect) */
.reveal-flip {
    opacity: 0;
    transform: perspective(800px) rotateX(15deg);
    transition: opacity 0.6s ease, transform 0.6s var(--ease-out-expo);
}
.visible .reveal-flip {
    opacity: 1;
    transform: perspective(800px) rotateX(0);
}
```

---

## Background Effects

```css
/* Gradient Mesh — layered radials for depth */
.gradient-bg {
    background:
        radial-gradient(ellipse at 20% 80%, rgba(120, 0, 255, 0.3) 0%, transparent 50%),
        radial-gradient(ellipse at 80% 20%, rgba(0, 255, 200, 0.2) 0%, transparent 50%),
        var(--bg-primary);
}

/* Animated gradient drift */
.gradient-drift {
    background: linear-gradient(135deg, var(--bg-primary), var(--bg-secondary), var(--bg-tertiary), var(--bg-primary));
    background-size: 400% 400%;
    animation: gradient-drift 15s ease infinite;
}
@keyframes gradient-drift {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Noise Texture — inline SVG grain */
.noise-bg::before {
    content: '';
    position: absolute;
    inset: 0;
    background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.04'/%3E%3C/svg%3E");
    pointer-events: none;
    z-index: 0;
}

/* Dot pattern */
.dot-bg {
    background-image: radial-gradient(circle, rgba(255,255,255,0.05) 1px, transparent 1px);
    background-size: 24px 24px;
}

/* Vignette overlay */
.vignette::after {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(ellipse at center, transparent 50%, rgba(0,0,0,0.4) 100%);
    pointer-events: none;
}
```

---

## Interactive Effects

```javascript
/* 3D Tilt on Hover — adds depth to cards */
class TiltEffect {
    constructor(element, intensity = 10) {
        this.el = element;
        this.intensity = intensity;
        this.el.style.transformStyle = 'preserve-3d';
        this.el.style.transition = 'transform 0.15s ease-out';

        this.el.addEventListener('mousemove', (e) => {
            const rect = this.el.getBoundingClientRect();
            const x = (e.clientX - rect.left) / rect.width - 0.5;
            const y = (e.clientY - rect.top) / rect.height - 0.5;
            this.el.style.transform =
                `perspective(1000px) rotateY(${x * this.intensity}deg) rotateX(${-y * this.intensity}deg)`;
        });

        this.el.addEventListener('mouseleave', () => {
            this.el.style.transform = 'perspective(1000px) rotateY(0) rotateX(0)';
        });
    }
}

/* Magnetic button — cursor attracts the element */
class MagneticButton {
    constructor(element, strength = 0.3) {
        this.el = element;
        this.strength = strength;

        this.el.addEventListener('mousemove', (e) => {
            const rect = this.el.getBoundingClientRect();
            const x = e.clientX - rect.left - rect.width / 2;
            const y = e.clientY - rect.top - rect.height / 2;
            this.el.style.transform = `translate(${x * this.strength}px, ${y * this.strength}px)`;
        });

        this.el.addEventListener('mouseleave', () => {
            this.el.style.transform = 'translate(0, 0)';
            this.el.style.transition = 'transform 0.4s var(--ease-out-expo)';
        });

        this.el.addEventListener('mouseenter', () => {
            this.el.style.transition = 'none';
        });
    }
}

/* Custom cursor with trail */
class CursorTrail {
    constructor(color = 'var(--accent)') {
        this.cursor = document.createElement('div');
        Object.assign(this.cursor.style, {
            position: 'fixed', width: '8px', height: '8px',
            borderRadius: '50%', background: color,
            pointerEvents: 'none', zIndex: '99999',
            transition: 'transform 0.15s ease-out, opacity 0.3s ease',
            mixBlendMode: 'difference'
        });
        document.body.appendChild(this.cursor);

        document.addEventListener('mousemove', (e) => {
            this.cursor.style.left = e.clientX - 4 + 'px';
            this.cursor.style.top = e.clientY - 4 + 'px';
        });
    }
}

/* Parallax scroll handler */
function setupParallax() {
    const parallaxEls = document.querySelectorAll('[data-parallax]');
    window.addEventListener('scroll', () => {
        const scrollY = window.scrollY;
        parallaxEls.forEach(el => {
            const rate = parseFloat(el.dataset.parallax) || 0.3;
            const rect = el.getBoundingClientRect();
            const offset = (rect.top + scrollY - window.innerHeight / 2) * rate;
            el.style.setProperty('--parallax-offset', offset + 'px');
        });
    }, { passive: true });
}
```

---

## Easing Reference

```css
:root {
    /* Standard curves */
    --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);      /* Smooth deceleration */
    --ease-out-back: cubic-bezier(0.34, 1.56, 0.64, 1);   /* Slight overshoot */
    --ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.275); /* Springy bounce */
    --ease-out-quart: cubic-bezier(0.25, 1, 0.5, 1);      /* Quick start, gentle stop */
    --ease-in-out-cubic: cubic-bezier(0.65, 0, 0.35, 1);  /* Symmetric, natural */

    /* Duration guidelines */
    --duration-instant: 0.15s;   /* Hover states, micro-interactions */
    --duration-fast: 0.3s;       /* Corporate, professional */
    --duration-normal: 0.6s;     /* General purpose */
    --duration-slow: 1s;         /* Dramatic, editorial */
    --duration-dramatic: 1.5s;   /* Cinematic, calm */
}
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Fonts not loading | Check Fontshare/Google Fonts URL; ensure font names match in CSS; include CJK font for Chinese |
| Animations not triggering | Verify Intersection Observer is running; check `.visible` class is being added to parent `.slide` |
| Scroll snap not working | Ensure `scroll-snap-type: y mandatory` on `html`; each `.slide` needs `scroll-snap-align: start` |
| Mobile issues | Disable heavy effects at 768px breakpoint; test touch events; reduce particle count |
| Performance jank | Use `will-change` sparingly; prefer `transform`/`opacity` only; throttle scroll handlers |
| CJK text clipping | Ensure `line-height >= 1.5` for Chinese text; check `overflow: hidden` on parent |
| Animation too fast/slow | Adjust duration per mood table above; never hardcode -- use CSS custom properties |
| Reduced motion | All animations must degrade gracefully; `prefers-reduced-motion` media query in viewport-base.css |
