# HTML Presentation Template

Reference architecture for generating slide presentations. Every presentation MUST follow this structure. All CSS/JS is inline -- single-file output.

## Language Support

Detect the user's language from conversation context. Set `<html lang="...">` accordingly.
- Chinese presentations: use `lang="zh-CN"`, font stack prioritizes Noto Sans SC / Source Han Sans
- English presentations: use `lang="en"`, font stack uses Fontshare or Google Fonts display faces
- Bilingual: use `lang="zh-CN"` (primary), include both font families

## Base HTML Structure

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Presentation Title</title>

    <!-- Fonts: Fontshare / Google Fonts — NEVER system fonts alone -->
    <!-- Chinese: always include a CJK font for proper rendering -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://api.fontshare.com/v2/css?f[]=clash-display@400;500;600;700&f[]=satoshi@400;500;700&display=swap">

    <style>
        /* ===========================================
           CSS CUSTOM PROPERTIES (THEME)
           Change these to restyle the entire deck
           =========================================== */
        :root {
            /* --- Color Palette --- */
            --bg-primary: #0a0f1c;
            --bg-secondary: #111827;
            --bg-tertiary: #1a2235;
            --text-primary: #ffffff;
            --text-secondary: #9ca3af;
            --text-muted: #6b7280;
            --accent: #00ffcc;
            --accent-secondary: #7c3aed;
            --accent-glow: rgba(0, 255, 204, 0.3);
            --accent-glow-secondary: rgba(124, 58, 237, 0.2);
            --border-subtle: rgba(255, 255, 255, 0.08);
            --surface: rgba(255, 255, 255, 0.05);

            /* --- Typography — ALL sizes use clamp() --- */
            --font-display: 'Clash Display', 'Noto Sans SC', sans-serif;
            --font-body: 'Satoshi', 'Noto Sans SC', sans-serif;
            --font-mono: 'JetBrains Mono', 'Fira Code', monospace;

            --title-size: clamp(2rem, 6vw, 5rem);
            --h2-size: clamp(1.25rem, 3.5vw, 2.5rem);
            --h3-size: clamp(1rem, 2.5vw, 1.75rem);
            --subtitle-size: clamp(0.875rem, 2vw, 1.25rem);
            --body-size: clamp(0.75rem, 1.5vw, 1.125rem);
            --small-size: clamp(0.65rem, 1vw, 0.875rem);
            --stat-size: clamp(2rem, 8vw, 6rem);

            /* --- Spacing — ALL use clamp() --- */
            --slide-padding: clamp(1.5rem, 4vw, 4rem);
            --content-gap: clamp(1rem, 2vw, 2rem);
            --element-gap: clamp(0.25rem, 1vw, 1rem);

            /* --- Animation --- */
            --ease-out-expo: cubic-bezier(0.16, 1, 0.3, 1);
            --ease-out-back: cubic-bezier(0.34, 1.56, 0.64, 1);
            --ease-spring: cubic-bezier(0.175, 0.885, 0.32, 1.275);
            --duration-fast: 0.3s;
            --duration-normal: 0.6s;
            --duration-slow: 1s;
            --duration-dramatic: 1.5s;
        }

        /* ===========================================
           BASE RESET
           =========================================== */
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* --- PASTE viewport-base.css CONTENTS HERE --- */

        body {
            font-family: var(--font-body);
            background: var(--bg-primary);
            color: var(--text-primary);
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* ===========================================
           ANIMATIONS
           Triggered by .visible class (added by JS)
           =========================================== */
        .reveal {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity var(--duration-normal) var(--ease-out-expo),
                        transform var(--duration-normal) var(--ease-out-expo);
        }
        .slide.visible .reveal {
            opacity: 1;
            transform: translateY(0);
        }

        /* Staggered children — up to 8 elements */
        .reveal:nth-child(1) { transition-delay: 0.08s; }
        .reveal:nth-child(2) { transition-delay: 0.16s; }
        .reveal:nth-child(3) { transition-delay: 0.24s; }
        .reveal:nth-child(4) { transition-delay: 0.32s; }
        .reveal:nth-child(5) { transition-delay: 0.40s; }
        .reveal:nth-child(6) { transition-delay: 0.48s; }
        .reveal:nth-child(7) { transition-delay: 0.56s; }
        .reveal:nth-child(8) { transition-delay: 0.64s; }

        /* ===========================================
           PROGRESS BAR
           =========================================== */
        .progress-bar {
            position: fixed;
            top: 0;
            left: 0;
            height: 3px;
            background: linear-gradient(90deg, var(--accent), var(--accent-secondary));
            width: 0%;
            z-index: 9999;
            transition: width 0.3s ease;
        }

        /* ===========================================
           NAVIGATION DOTS
           =========================================== */
        .nav-dots {
            position: fixed;
            right: clamp(12px, 2vw, 24px);
            top: 50%;
            transform: translateY(-50%);
            display: flex;
            flex-direction: column;
            gap: 8px;
            z-index: 9998;
        }
        .nav-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--text-muted);
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            padding: 0;
        }
        .nav-dot.active {
            background: var(--accent);
            transform: scale(1.4);
            box-shadow: 0 0 8px var(--accent-glow);
        }

        /* ===========================================
           SLIDE NUMBER / PAGE INDICATOR
           =========================================== */
        .slide-counter {
            position: fixed;
            bottom: clamp(12px, 2vw, 24px);
            right: clamp(12px, 2vw, 24px);
            font-family: var(--font-mono);
            font-size: var(--small-size);
            color: var(--text-muted);
            z-index: 9998;
        }

        /* ... preset-specific styles generated per deck ... */
    </style>
</head>
<body>
    <!-- Progress bar -->
    <div class="progress-bar" id="progressBar"></div>

    <!-- Navigation dots (generated by JS) -->
    <nav class="nav-dots" id="navDots" aria-label="Slide navigation"></nav>

    <!-- Slide counter -->
    <div class="slide-counter" id="slideCounter" aria-live="polite"></div>

    <!-- =================== SLIDES =================== -->

    <!-- TITLE SLIDE -->
    <section class="slide title-slide" aria-label="Title">
        <div class="slide-content">
            <h1 class="reveal">Presentation Title</h1>
            <p class="subtitle reveal">Subtitle or tagline</p>
            <p class="author reveal">Author Name  |  Date</p>
        </div>
    </section>

    <!-- CONTENT SLIDES (see Slide Type Templates below) -->

    <!-- CLOSING SLIDE -->
    <section class="slide closing-slide" aria-label="Closing">
        <div class="slide-content">
            <h2 class="reveal">Thank You</h2>
            <p class="reveal">Contact / CTA / next steps</p>
        </div>
        <!-- Watermark (default: on, opt-out with "no watermark") -->
        <p style="position: absolute; bottom: clamp(8px, 1.5vw, 16px); left: 50%; transform: translateX(-50%); font-size: var(--small-size); color: var(--text-muted); opacity: 0.5;">
            Made with <a href="https://github.com/user/next-slide" style="color: inherit; text-decoration: underline;" target="_blank">Next Slide</a>
        </p>
    </section>
    <!-- NOTE: Include the watermark by default on the last slide. Remove only if user explicitly requests "no watermark". -->

    <script>
        /* ===========================================
           SLIDE PRESENTATION CONTROLLER
           Full-featured, production-ready
           =========================================== */
        class SlidePresentation {
            constructor() {
                this.slides = [...document.querySelectorAll('.slide')];
                this.currentSlide = 0;
                this.isAnimating = false;
                this.touchStartY = 0;
                this.touchStartX = 0;

                this.init();
            }

            init() {
                this.setupIntersectionObserver();
                this.setupKeyboardNav();
                this.setupTouchNav();
                this.setupWheelNav();
                this.setupProgressBar();
                this.setupNavDots();
                this.setupSlideCounter();

                // Mark first slide visible
                if (this.slides[0]) {
                    this.slides[0].classList.add('visible');
                }
            }

            /* --- Intersection Observer: triggers .visible on scroll --- */
            setupIntersectionObserver() {
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            entry.target.classList.add('visible');
                            const idx = this.slides.indexOf(entry.target);
                            if (idx !== -1) {
                                this.currentSlide = idx;
                                this.updateUI();
                            }
                        }
                    });
                }, { threshold: 0.5 });

                this.slides.forEach(slide => observer.observe(slide));
            }

            /* --- Keyboard: arrows, space, pgup/pgdown, home/end --- */
            setupKeyboardNav() {
                document.addEventListener('keydown', (e) => {
                    // Skip if user is editing text
                    if (e.target.getAttribute('contenteditable')) return;

                    switch (e.key) {
                        case 'ArrowDown':
                        case 'ArrowRight':
                        case ' ':
                        case 'PageDown':
                            e.preventDefault();
                            this.goToSlide(this.currentSlide + 1);
                            break;
                        case 'ArrowUp':
                        case 'ArrowLeft':
                        case 'PageUp':
                            e.preventDefault();
                            this.goToSlide(this.currentSlide - 1);
                            break;
                        case 'Home':
                            e.preventDefault();
                            this.goToSlide(0);
                            break;
                        case 'End':
                            e.preventDefault();
                            this.goToSlide(this.slides.length - 1);
                            break;
                    }
                });
            }

            /* --- Touch: swipe up/down with 50px threshold --- */
            setupTouchNav() {
                document.addEventListener('touchstart', (e) => {
                    this.touchStartY = e.touches[0].clientY;
                    this.touchStartX = e.touches[0].clientX;
                }, { passive: true });

                document.addEventListener('touchend', (e) => {
                    const deltaY = this.touchStartY - e.changedTouches[0].clientY;
                    const deltaX = this.touchStartX - e.changedTouches[0].clientX;

                    // Only respond to vertical swipes (ignore horizontal)
                    if (Math.abs(deltaY) < 50 || Math.abs(deltaX) > Math.abs(deltaY)) return;

                    if (deltaY > 0) this.goToSlide(this.currentSlide + 1);
                    else this.goToSlide(this.currentSlide - 1);
                }, { passive: true });
            }

            /* --- Mouse wheel with debounce --- */
            setupWheelNav() {
                let wheelTimeout;
                document.addEventListener('wheel', (e) => {
                    clearTimeout(wheelTimeout);
                    wheelTimeout = setTimeout(() => {
                        if (e.deltaY > 30) this.goToSlide(this.currentSlide + 1);
                        else if (e.deltaY < -30) this.goToSlide(this.currentSlide - 1);
                    }, 50);
                }, { passive: true });
            }

            /* --- Progress bar --- */
            setupProgressBar() {
                this.progressBar = document.getElementById('progressBar');
            }

            /* --- Navigation dots --- */
            setupNavDots() {
                const container = document.getElementById('navDots');
                if (!container) return;

                this.slides.forEach((_, i) => {
                    const dot = document.createElement('button');
                    dot.className = 'nav-dot' + (i === 0 ? ' active' : '');
                    dot.setAttribute('aria-label', `Go to slide ${i + 1}`);
                    dot.addEventListener('click', () => this.goToSlide(i));
                    container.appendChild(dot);
                });
            }

            /* --- Slide counter --- */
            setupSlideCounter() {
                this.counter = document.getElementById('slideCounter');
                this.updateUI();
            }

            /* --- Navigation core --- */
            goToSlide(index) {
                if (index < 0 || index >= this.slides.length || this.isAnimating) return;
                this.isAnimating = true;
                this.currentSlide = index;
                this.slides[index].scrollIntoView({ behavior: 'smooth' });
                this.updateUI();
                setTimeout(() => { this.isAnimating = false; }, 600);
            }

            /* --- Update all UI indicators --- */
            updateUI() {
                const total = this.slides.length;
                const current = this.currentSlide;

                // Progress bar
                if (this.progressBar) {
                    this.progressBar.style.width = `${((current + 1) / total) * 100}%`;
                }

                // Nav dots
                document.querySelectorAll('.nav-dot').forEach((dot, i) => {
                    dot.classList.toggle('active', i === current);
                });

                // Counter
                if (this.counter) {
                    this.counter.textContent = `${current + 1} / ${total}`;
                }
            }
        }

        // Initialize on DOM ready
        document.addEventListener('DOMContentLoaded', () => {
            new SlidePresentation();
        });
    </script>
</body>
</html>
```

---

## Slide Type Templates

Use these as building blocks. Mix and match per deck. Every slide type uses semantic HTML and respects the viewport constraint.

### 1. Title Slide

```html
<section class="slide title-slide">
    <div class="slide-content" style="align-items: center; text-align: center;">
        <h1 class="reveal" style="font-size: var(--title-size); font-family: var(--font-display); font-weight: 700;">
            Presentation Title
        </h1>
        <p class="subtitle reveal" style="font-size: var(--subtitle-size); color: var(--text-secondary); margin-top: var(--element-gap);">
            A compelling one-liner
        </p>
        <p class="author reveal" style="font-size: var(--small-size); color: var(--text-muted); margin-top: var(--content-gap);">
            Author  |  2026.04.02
        </p>
    </div>
</section>
```

### 2. Section Divider

Big text, full-bleed color or gradient. Marks a new section of the deck.

```html
<section class="slide section-divider">
    <div class="slide-content" style="align-items: center; justify-content: center; text-align: center;">
        <span class="reveal" style="font-size: var(--small-size); text-transform: uppercase; letter-spacing: 0.2em; color: var(--accent);">
            Part 02
        </span>
        <h2 class="reveal" style="font-size: var(--title-size); font-family: var(--font-display); margin-top: var(--element-gap);">
            Section Title
        </h2>
    </div>
</section>
```

### 3. Content + Bullets

Standard workhorse slide: heading, optional subheading, bullet list.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display);">Slide Heading</h2>
        <p class="reveal" style="font-size: var(--subtitle-size); color: var(--text-secondary); margin-top: var(--element-gap);">
            Optional supporting sentence.
        </p>
        <ul class="bullet-list" style="margin-top: var(--content-gap); list-style: none; padding: 0;">
            <li class="reveal" style="display: flex; align-items: baseline; gap: 0.75em; padding: 0.4em 0;">
                <span style="color: var(--accent); font-size: 0.6em;">&#9679;</span>
                <span>First point with explanation</span>
            </li>
            <li class="reveal" style="display: flex; align-items: baseline; gap: 0.75em; padding: 0.4em 0;">
                <span style="color: var(--accent); font-size: 0.6em;">&#9679;</span>
                <span>Second point</span>
            </li>
            <li class="reveal" style="display: flex; align-items: baseline; gap: 0.75em; padding: 0.4em 0;">
                <span style="color: var(--accent); font-size: 0.6em;">&#9679;</span>
                <span>Third point</span>
            </li>
        </ul>
    </div>
</section>
```

### 4. Two-Column / Side-by-Side

Text on one side, image/visual on the other. Stacks vertically on mobile.

```html
<section class="slide">
    <div class="slide-content" style="flex-direction: row; align-items: center; gap: var(--content-gap);">
        <div style="flex: 1; min-width: 0;">
            <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display);">Left Heading</h2>
            <p class="reveal" style="font-size: var(--body-size); color: var(--text-secondary); margin-top: var(--element-gap); line-height: 1.6;">
                Supporting text with detail. Keep it concise — this is a slide, not a document.
            </p>
        </div>
        <div style="flex: 1; min-width: 0; display: flex; justify-content: center;">
            <!-- Image, chart, code block, or visual element -->
            <img src="assets/visual.png" alt="Description" class="reveal slide-image">
        </div>
    </div>
</section>
```

### 5. Card Grid

3-4 items in a responsive grid. Great for features, team members, pillars.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            Grid Heading
        </h2>
        <div class="grid" style="margin-top: var(--content-gap);">
            <div class="reveal card" style="background: var(--surface); border: 1px solid var(--border-subtle); border-radius: 12px; padding: clamp(1rem, 2vw, 1.5rem);">
                <div style="font-size: 1.5em; margin-bottom: 0.5em;">Icon</div>
                <h3 style="font-size: var(--h3-size); font-family: var(--font-display); margin-bottom: 0.4em;">Card Title</h3>
                <p style="font-size: var(--body-size); color: var(--text-secondary); line-height: 1.5;">Short description.</p>
            </div>
            <!-- Repeat for each card -->
        </div>
    </div>
</section>
```

### 6. Comparison (A vs B)

Two columns with contrasting content, separated by a visual divider.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            Before vs After
        </h2>
        <div class="reveal" style="display: grid; grid-template-columns: 1fr auto 1fr; gap: var(--content-gap); margin-top: var(--content-gap); align-items: stretch;">
            <!-- Left: Before -->
            <div style="background: rgba(239, 68, 68, 0.08); border: 1px solid rgba(239, 68, 68, 0.2); border-radius: 12px; padding: clamp(1rem, 2vw, 1.5rem);">
                <h3 style="font-size: var(--h3-size); color: #f87171; margin-bottom: 0.8em;">Before / Old Way</h3>
                <ul style="list-style: none; padding: 0; font-size: var(--body-size); color: var(--text-secondary);">
                    <li style="padding: 0.3em 0;">&#10007; Pain point one</li>
                    <li style="padding: 0.3em 0;">&#10007; Pain point two</li>
                    <li style="padding: 0.3em 0;">&#10007; Pain point three</li>
                </ul>
            </div>
            <!-- Divider -->
            <div style="width: 2px; background: var(--border-subtle); align-self: stretch;"></div>
            <!-- Right: After -->
            <div style="background: rgba(0, 255, 204, 0.05); border: 1px solid rgba(0, 255, 204, 0.15); border-radius: 12px; padding: clamp(1rem, 2vw, 1.5rem);">
                <h3 style="font-size: var(--h3-size); color: var(--accent); margin-bottom: 0.8em;">After / New Way</h3>
                <ul style="list-style: none; padding: 0; font-size: var(--body-size); color: var(--text-secondary);">
                    <li style="padding: 0.3em 0;">&#10003; Benefit one</li>
                    <li style="padding: 0.3em 0;">&#10003; Benefit two</li>
                    <li style="padding: 0.3em 0;">&#10003; Benefit three</li>
                </ul>
            </div>
        </div>
    </div>
</section>
```

### 7. Timeline / Process Steps

Horizontal or vertical timeline with numbered steps.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            Our Process
        </h2>
        <div style="display: flex; align-items: flex-start; gap: 0; margin-top: var(--content-gap); position: relative;">
            <!-- Connecting line -->
            <div style="position: absolute; top: 20px; left: 20px; right: 20px; height: 2px; background: var(--border-subtle);"></div>

            <!-- Step 1 -->
            <div class="reveal" style="flex: 1; text-align: center; position: relative; z-index: 1;">
                <div style="width: 40px; height: 40px; border-radius: 50%; background: var(--accent); color: var(--bg-primary); display: inline-flex; align-items: center; justify-content: center; font-weight: 700; font-size: var(--body-size);">1</div>
                <h3 style="font-size: var(--h3-size); margin-top: 0.6em;">Research</h3>
                <p style="font-size: var(--small-size); color: var(--text-secondary); margin-top: 0.3em; padding: 0 0.5em;">Brief description of this phase</p>
            </div>
            <!-- Step 2 -->
            <div class="reveal" style="flex: 1; text-align: center; position: relative; z-index: 1;">
                <div style="width: 40px; height: 40px; border-radius: 50%; background: var(--accent); color: var(--bg-primary); display: inline-flex; align-items: center; justify-content: center; font-weight: 700; font-size: var(--body-size);">2</div>
                <h3 style="font-size: var(--h3-size); margin-top: 0.6em;">Design</h3>
                <p style="font-size: var(--small-size); color: var(--text-secondary); margin-top: 0.3em; padding: 0 0.5em;">Brief description</p>
            </div>
            <!-- Step 3 -->
            <div class="reveal" style="flex: 1; text-align: center; position: relative; z-index: 1;">
                <div style="width: 40px; height: 40px; border-radius: 50%; background: var(--accent); color: var(--bg-primary); display: inline-flex; align-items: center; justify-content: center; font-weight: 700; font-size: var(--body-size);">3</div>
                <h3 style="font-size: var(--h3-size); margin-top: 0.6em;">Deliver</h3>
                <p style="font-size: var(--small-size); color: var(--text-secondary); margin-top: 0.3em; padding: 0 0.5em;">Brief description</p>
            </div>
        </div>
    </div>
</section>
```

### 8. Quote / Testimonial

Large pull-quote with attribution.

```html
<section class="slide">
    <div class="slide-content" style="align-items: center; justify-content: center; text-align: center; max-width: min(80vw, 800px); margin: 0 auto;">
        <div class="reveal" style="font-size: clamp(2rem, 5vw, 4rem); color: var(--accent); line-height: 1; opacity: 0.3; font-family: Georgia, serif;">
            &ldquo;
        </div>
        <blockquote class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); font-weight: 500; line-height: 1.4; margin-top: -0.5em;">
            The quote text goes here. Keep it to one or two sentences for maximum impact.
        </blockquote>
        <cite class="reveal" style="display: block; margin-top: var(--content-gap); font-size: var(--body-size); color: var(--text-secondary); font-style: normal;">
            &mdash; Author Name, Title / Company
        </cite>
    </div>
</section>
```

### 9. Stats / Numbers

Big numbers with labels. High visual impact for data points.

```html
<section class="slide">
    <div class="slide-content" style="align-items: center;">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display); text-align: center;">
            By the Numbers
        </h2>
        <div style="display: flex; justify-content: center; gap: clamp(2rem, 6vw, 6rem); margin-top: var(--content-gap); flex-wrap: wrap;">
            <div class="reveal" style="text-align: center;">
                <div class="counter" data-target="150" style="font-size: var(--stat-size); font-family: var(--font-display); font-weight: 700; color: var(--accent);">0</div>
                <div style="font-size: var(--body-size); color: var(--text-secondary); margin-top: 0.3em;">Active Users</div>
            </div>
            <div class="reveal" style="text-align: center;">
                <div class="counter" data-target="99" data-suffix="%" style="font-size: var(--stat-size); font-family: var(--font-display); font-weight: 700; color: var(--accent);">0</div>
                <div style="font-size: var(--body-size); color: var(--text-secondary); margin-top: 0.3em;">Uptime</div>
            </div>
            <div class="reveal" style="text-align: center;">
                <div class="counter" data-target="3" data-suffix="x" style="font-size: var(--stat-size); font-family: var(--font-display); font-weight: 700; color: var(--accent);">0</div>
                <div style="font-size: var(--body-size); color: var(--text-secondary); margin-top: 0.3em;">Faster</div>
            </div>
        </div>
    </div>
</section>
```

Counter animation JS (include when using stats slides):
```javascript
/* Animate counters when slide becomes visible */
const counters = document.querySelectorAll('.counter');
const counterObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const el = entry.target;
            const target = parseInt(el.dataset.target);
            const suffix = el.dataset.suffix || '';
            const prefix = el.dataset.prefix || '';
            const duration = 1500;
            const start = performance.now();

            function tick(now) {
                const elapsed = now - start;
                const progress = Math.min(elapsed / duration, 1);
                // Ease-out cubic
                const eased = 1 - Math.pow(1 - progress, 3);
                el.textContent = prefix + Math.round(target * eased).toLocaleString() + suffix;
                if (progress < 1) requestAnimationFrame(tick);
            }
            requestAnimationFrame(tick);
            counterObserver.unobserve(el);
        }
    });
}, { threshold: 0.5 });
counters.forEach(c => counterObserver.observe(c));
```

### 10. Image Showcase

Full-bleed or centered image with minimal text overlay.

```html
<section class="slide" style="padding: 0;">
    <div style="position: absolute; inset: 0;">
        <img src="assets/hero.jpg" alt="Description" style="width: 100%; height: 100%; object-fit: cover; opacity: 0.4;">
    </div>
    <div class="slide-content" style="position: relative; z-index: 1; align-items: center; justify-content: center; text-align: center;">
        <h2 class="reveal" style="font-size: var(--title-size); font-family: var(--font-display); text-shadow: 0 2px 20px rgba(0,0,0,0.5);">
            Image Title
        </h2>
        <p class="reveal" style="font-size: var(--subtitle-size); color: var(--text-secondary); text-shadow: 0 1px 10px rgba(0,0,0,0.5);">
            Caption or description
        </p>
    </div>
</section>
```

### 11. Code Showcase

For technical presentations -- syntax-highlighted code with annotation.

```html
<section class="slide">
    <div class="slide-content">
        <h2 class="reveal" style="font-size: var(--h2-size); font-family: var(--font-display);">Implementation</h2>
        <div class="reveal" style="margin-top: var(--content-gap); background: var(--bg-secondary); border: 1px solid var(--border-subtle); border-radius: 12px; overflow: hidden;">
            <div style="padding: 0.6em 1em; background: var(--bg-tertiary); font-size: var(--small-size); color: var(--text-muted); font-family: var(--font-mono); display: flex; justify-content: space-between;">
                <span>example.ts</span>
                <span style="opacity: 0.5;">TypeScript</span>
            </div>
            <pre style="padding: 1em 1.2em; font-family: var(--font-mono); font-size: var(--body-size); line-height: 1.6; overflow-x: auto; color: var(--text-primary);"><code>const greeting = (name: string): string => {
    return `Hello, ${name}!`;
};</code></pre>
        </div>
    </div>
</section>
```

---

## Inline Editing (Opt-In Only)

**If the user chose "No" for inline editing, do NOT generate any edit-related HTML, CSS, or JS.**

Use JS-based hover with 400ms delay timeout. Do NOT use CSS `~` sibling selector -- it breaks because `pointer-events: none` disrupts the hover chain.

```html
<div class="edit-hotzone"></div>
<button class="edit-toggle" id="editToggle" title="Edit mode (E)">&#9998;</button>
```

```css
.edit-hotzone {
    position: fixed; top: 0; left: 0;
    width: 80px; height: 80px;
    z-index: 10000;
    cursor: pointer;
}
.edit-toggle {
    position: fixed; top: 16px; left: 16px;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.3s ease;
    z-index: 10001;
    background: var(--surface);
    border: 1px solid var(--border-subtle);
    color: var(--text-primary);
    padding: 8px 12px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 14px;
}
.edit-toggle.show,
.edit-toggle.active {
    opacity: 1;
    pointer-events: auto;
}
```

```javascript
const hotzone = document.querySelector('.edit-hotzone');
const editToggle = document.getElementById('editToggle');
let hideTimeout = null;

hotzone.addEventListener('mouseenter', () => {
    clearTimeout(hideTimeout);
    editToggle.classList.add('show');
});
hotzone.addEventListener('mouseleave', () => {
    hideTimeout = setTimeout(() => {
        if (!editToggle.classList.contains('active')) editToggle.classList.remove('show');
    }, 400);
});
editToggle.addEventListener('mouseenter', () => clearTimeout(hideTimeout));
editToggle.addEventListener('mouseleave', () => {
    hideTimeout = setTimeout(() => {
        if (!editToggle.classList.contains('active')) editToggle.classList.remove('show');
    }, 400);
});
hotzone.addEventListener('click', () => toggleEditMode());
editToggle.addEventListener('click', () => toggleEditMode());

document.addEventListener('keydown', (e) => {
    if ((e.key === 'e' || e.key === 'E') && !e.target.getAttribute('contenteditable')) {
        toggleEditMode();
    }
});

function toggleEditMode() {
    const isActive = editToggle.classList.toggle('active');
    document.querySelectorAll('h1, h2, h3, p, li, blockquote, cite, span')
        .forEach(el => {
            if (el.closest('.nav-dots, .edit-toggle, .slide-counter')) return;
            el.contentEditable = isActive;
            el.style.outline = isActive ? '1px dashed var(--accent-glow)' : 'none';
        });
}
```

---

## Image Pipeline (Skip If No Images)

**Dependency:** `pip install Pillow`

```python
from PIL import Image, ImageDraw

def crop_circle(input_path, output_path):
    img = Image.open(input_path).convert('RGBA')
    w, h = img.size
    size = min(w, h)
    left, top = (w - size) // 2, (h - size) // 2
    img = img.crop((left, top, left + size, top + size))
    mask = Image.new('L', (size, size), 0)
    ImageDraw.Draw(mask).ellipse([0, 0, size, size], fill=255)
    img.putalpha(mask)
    img.save(output_path, 'PNG')

def resize_max(input_path, output_path, max_dim=1200):
    img = Image.open(input_path)
    img.thumbnail((max_dim, max_dim), Image.LANCZOS)
    img.save(output_path, quality=85)
```

Use direct file paths (`src="assets/..."`) not base64. Presentations are viewed locally.

---

## Code Quality Checklist

- [ ] All sizes use `clamp()` -- no fixed px/rem for text or spacing
- [ ] `<html lang="...">` matches presentation language
- [ ] Semantic HTML: `<section>`, `<nav>`, `<blockquote>`, `<cite>`
- [ ] ARIA labels on interactive elements
- [ ] `prefers-reduced-motion` support (from viewport-base.css)
- [ ] Keyboard navigation fully functional
- [ ] Every CSS/JS section has a comment block explaining its purpose
- [ ] Single file output: all CSS and JS inline
- [ ] CJK font included if any Chinese text appears

## File Structure

Single presentation:
```
presentation.html    # Self-contained, all CSS/JS inline
assets/              # Images only, if any
```

Multiple presentations in one project:
```
[name].html
[name]-assets/
```
