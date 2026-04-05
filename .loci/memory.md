---
project: next-slide
updated: 2026-04-06
status: paused
brain: /Users/callum/Desktop/cyc-brain
---

# Next Slide — 项目记忆

> "你的下个 ppt，何必是 PPT"

## 项目定位

Next Slide 是一个 Claude Code Skill，让用户通过自然语言生成零依赖、动画丰富的 HTML 演示文稿。50+ 预设风格，中英双语，支持 PPT 转换、Markdown 转换、一键部署。

- **GitHub**: https://github.com/codesstar/next-slide
- **Gallery（线上）**: https://next-slide-jet.vercel.app/gallery.html
- **安装**: `git clone https://github.com/codesstar/next-slide ~/.claude/skills/next-slide`
- **OpenClaw 插件**: 已配置 `openclaw.plugin.json`

## 核心架构

### 文件结构
| 文件 | 用途 |
|------|------|
| `SKILL.md` | 核心 Skill 规范，定义完整 Phase 0-7 流程 |
| `STYLE_PRESETS.md` | 50+ 风格的完整规格（颜色、字体、动画DNA） |
| `styles/{id}.html` | 每个风格的完整 working demo，生成时的主要参考 |
| `viewport-base.css` | 强制响应式 CSS（每个 slide 必须包含） |
| `html-template.md` | HTML 骨架 + JS 导航控制器 |
| `animation-patterns.md` | 动画片段参考 |
| `SCENARIO_TEMPLATES.md` | 场景结构、叙事弧线 |
| `gallery.html` | 在线风格画廊（带推荐系统） |
| `style-gallery.html` | 本地轻量风格画廊 |
| `landing/` | 产品着陆页 |

### 流程设计 (Phase 0-7)
1. **Phase 0**: 检测模式（新建/PPT转换/增强/参考匹配/Markdown/风格对比）
2. **Phase 1**: 内容 & 风格发现（一轮问4个问题）
3. **Phase 2**: 风格选择（推荐3个 + 打开 Gallery）
4. **Phase 3**: 生成演示文稿（读模板、读风格demo、生成单文件HTML）
5. **Phase 3.5**: QA 自检（10项检查：overflow、clamp、emoji、window.go等）
6. **Phase 5**: 交付（打开浏览器 + 使用说明）
7. **Phase 6**: 分享导出（Vercel部署 / PDF导出）
8. **Phase 7**: 风格对比（post-delivery，左右分屏对比两种风格）

## 关键设计决策

### 设计原则（来自 pbakaus/impeccable）
- **Anti-AI-Slop**: DO/DON'T 规则体系，避免生成"一看就是AI做的"演示文稿
- **适用范围**: DON'T 规则针对自定义风格设计；预设模板按模板来，但基本规则全局生效
- 基本规则：NO EMOJI、用 `overflow-wrap: break-word`（不用 `break-all`）、用 `clamp()` 适配、不用纯黑白

### 技术要点
- **Viewport Fitting**: 每个 slide 严格 100vh，overflow: hidden，所有尺寸用 clamp()
- **CJK 支持**: line-height 1.8，必须包含 CJK 字体 fallback（PingFang SC, Microsoft YaHei）
- **Google Fonts 中国 fallback**: `fonts.googleapis.cn` 镜像 + 系统字体 fallback
- **`window.go`**: 每个演示文稿暴露全局 `window.go(index)` 函数，供风格对比页面同步调用
- **Nav dots 溢出**: 15+ slides 时用 `max-height: 80vh; overflow-y: auto`
- **风格对比同步**: 父页面跟踪 `syncIndex`，方向键同时调用两个 iframe 的 `contentWindow.go()`

### 风格系统
- 50+ 风格分7大类：Dark / Light / Editorial / Bold & Creative / Retro & Vintage / Artistic / Cultural
- 每个风格有完整 HTML demo 在 `styles/` 目录
- Gallery 支持 URL 参数推荐：`?recommend=id1,id2,id3&reason_id1=...`
- 推荐映射：5种情绪（专业可信/兴奋激动/清晰专注/感动启发/好玩有创意）→ 各5个推荐风格

## 已完成

- [x] SKILL.md 完整规范（Phase 0-7 + QA + 所有模式）
- [x] 50+ 风格预设定义 + ~20个 HTML demo
- [x] 在线 Gallery 带推荐系统（Vercel 部署）
- [x] viewport-base.css / html-template.md / animation-patterns.md
- [x] 场景模板库（45个示例）
- [x] PPT 转换脚本
- [x] 风格对比功能（Phase 7）
- [x] 专家评审（PM/Designer/Engineer）并修复所有问题
- [x] OpenClaw 插件配置
- [x] README + 安装说明

## 未来可做

- [ ] 更多风格 demo HTML（目标50+）
- [ ] Gallery 在线预览增强
- [ ] PDF 导出优化（Playwright）
- [ ] 社区贡献风格的 PR 模板
- [ ] OpenClaw 社区推广
