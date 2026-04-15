<p align="right">
  <a href="README.md">English</a> | <strong>中文</strong>
</p>

# Next PPT

### 你的下个 ppt，何必是 PPT

> 一句话描述你想要的，挑个风格，得到一份漂亮的 HTML 演示。不用 PowerPoint，不用打包工具，无任何依赖。

> 仓库 / 命令名为 `next-slide`，中文称呼 **Next PPT**。

兼容平台：**Claude Code** · **Hermes Agent** · **OpenClaw**

---

## 它做什么

跟你的 AI 编程助手用大白话说一句，Next PPT 就把它变成一份精致、带动画的 HTML 演示 —— 单个文件，浏览器打开就能放。

```
你："帮我做一个 AI agents 的演讲，10 页左右，科技感强一点"

→ AI 让你挑风格（50+ 选择，带实时预览）
→ 生成完整的 HTML 演示文稿
→ 浏览器直接打开，可以开讲
```

**输入**：自然语言、Markdown，或者一个现成的 .pptx 文件
**输出**：一个自包含的 HTML 文件 —— 动画、响应式布局、键盘导航全部内置

---

## 30 秒上手

```bash
# 1. 装到 AI 助手里（任选一个或多个平台）

# Claude Code
git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide

# Hermes Agent
git clone https://github.com/codesstar/next-slide ~/.hermes/skills/next-slide

# OpenClaw
clawhub install next-slide

# 一键全部：克隆后跑 install.sh，自动检测三个平台
git clone https://github.com/codesstar/next-slide && cd next-slide && bash install.sh
```

```bash
# 2. 直接用大白话
# "帮我做一个 AI agents 的 ppt"
# "把这个 markdown 转成幻灯片"
# 或直接调用 skill：
/next-slide

# 3. 演示
open my-presentation.html    # 单个文件，零依赖
```

### 三平台对比

| 平台 | 安装路径 | 自动更新 |
|------|---------|---------|
| **Claude Code** | `~/.claude/skills/next-slide`（symlink，repo 改了立即生效）| ✅ |
| **Hermes Agent** | `~/.hermes/skills/next-slide`（实体目录，需要重跑 install.sh）| ⚠️ 重装 |
| **OpenClaw** | 通过 `clawhub install` 管理 | ✅ |

> 用 `bash install.sh` 一键搞定 —— 它会自动检测三个平台并装好。

无运行时、无 API key、无厂商绑定。本质就是：Markdown 指令 + CSS/HTML 参考。

---

## 50+ 风格，7 大类

| 分类 | 数量 | 代表风格 | 适用场景 |
|------|------|---------|---------|
| **暗色** | 11 | Keynote Noir、Bold Signal、Neon Cyber、Terminal Green、Cinema Scope | 大会、发布会、技术分享 |
| **浅色** | 11 | Swiss Modern、Paper & Ink、Notebook Tabs、Wabi-Sabi Zen | 学术、商务、教学 |
| **编辑** | 4 | Editorial Serif、Fashion Editorial、Newsprint Broadsheet | 杂志风、深度长文 |
| **大胆** | 7 | Electric Studio、Pop Art、Bold Typography、Memphis Pop | 创业 pitch、创意提案 |
| **复古** | 5 | Grainy Retro、Art Deco Gatsby、Risograph Overprint、Retro Arcade | 怀旧、主题化 |
| **艺术** | 7 | Surrealism Gallery、Scrapbook Portfolio、Art Nouveau Botanical | 艺术、设计、作品集 |
| **文化** | 8 | 东方墨韵、和風、Blueprint、Bauhaus Primary、Chinese Ink Wash | 文化活动、主题演讲 |

每个风格都是完整的设计系统：精挑的字体、色板、版式、专属动画、响应式断点。

**看全部风格**：[Style Gallery](https://next-slide.vercel.app/gallery)，或本地 `open style-gallery.html`。

---

## 工作原理

```
┌──────────────────────────────────────────────────┐
│  1. 内容                                          │
│     大白话描述、贴 Markdown，                      │
│     或者直接丢一个 .pptx 文件                      │
├──────────────────────────────────────────────────┤
│  2. 选风格                                        │
│     看 50+ 风格 → 挑个调性 →                       │
│     看 3 个实时预览 → 选定                         │
│    （或者说"照这张截图来"）                        │
├──────────────────────────────────────────────────┤
│  3. 生成                                          │
│     AI 出整份 deck：版式、动画、                   │
│     响应式 CSS、键盘导航                           │
├──────────────────────────────────────────────────┤
│  4. 交付                                          │
│     浏览器打开。按 E 直接编辑文字。                │
│     一行命令部署到 Vercel。                        │
└──────────────────────────────────────────────────┘
```

---

## 特性

- **50+ 精选风格** —— 不是换个颜色那么简单，每个都是独立设计语言（带 Layout DNA）
- **零依赖** —— 单 HTML 文件，CSS/JS 全内联
- **中英文原生** —— 中文 CJK 字体支持到位
- **5 种输入方式** —— 从零开始 / Markdown / PPT 转换 / 增强已有 deck / 截图匹配
- **响应式** —— 手机到 4K 投影都适配
- **键盘导航** —— 方向键、空格、Home/End
- **行内编辑** —— 按 `E` 在浏览器里直接改文字
- **一键部署** —— `npx vercel --prod` 直接拿到线上 URL
- **质量自检** —— 生成后自动检查溢出、字体、信息密度
- **字号精确** —— 每个风格的 `clamp()` 数值都从手工参考稿里抠出来

---

## 输入方式

| 方式 | 例子 |
|------|------|
| 自然语言 | "做一份 10 页的 AI agents pitch deck" |
| Markdown | 喂一个 `.md` 文件 —— 标题变 slide |
| PowerPoint | 拖一个 `.pptx` —— 内容抽出来重新设计 |
| 参考截图 | 发张图 —— AI 找最接近的风格 |
| 增强已有 | 指向一份现成 HTML deck —— AI 帮你改进 |

---

## 设计哲学

Next PPT 不是模板引擎。它是一套有立场的设计系统，教 AI 像设计师一样思考：

1. **拒绝 AI 屎山** —— 每个风格都是手工调教的字体、间距、动效。AI 跟着精确规格走，不靠"感觉"
2. **Layout DNA** —— 每个风格都定义了结构模式：slide 机制、标题对齐、导航样式、背景处理、动画路数、组件结构
3. **字号精确** —— 每个元素都有精确的 `clamp()` 值，确保 AI 能复现字号、字重、行高、字距
4. **Viewport First** —— 每页正好 100vh。不滚动。内容超了？自动拆成多页
5. **零依赖** —— 一个 HTML。哪儿都能开。无 npm、无打包、无可能挂掉的 CDN

---

## 键盘快捷键

| 键 | 动作 |
|----|------|
| `←` `→` `↑` `↓` | 切换 slide |
| `空格` | 下一页 |
| `Home` / `End` | 首页 / 末页 |
| `E` | 切换编辑模式 |

---

## 自定义

每份演示用 CSS 自定义属性。在 `:root` 里覆盖：

```css
:root {
    --bg-primary: #0a0a0a;
    --accent: #ff6b35;
    --font-display: '你的字体', sans-serif;
}
```

---

## 文件结构

```
next-slide/
├── SKILL.md               # AI 指令（大脑）
├── STYLE_PRESETS.md        # 50+ 风格定义（带 Layout DNA）
├── style-gallery.html      # 本地风格浏览器
├── viewport-base.css       # 响应式 CSS（每个 deck 都内置）
├── html-template.md        # HTML 架构参考
├── animation-patterns.md   # 各情绪的动画片段
├── styles/                 # 每个风格的参考演示
├── scripts/extract-pptx.py # PPT 内容抽取
├── openclaw.plugin.json    # OpenClaw 插件清单
└── install.sh              # 三平台自动检测安装
```

---

## License

MIT. Copyright 2026 Callum.
