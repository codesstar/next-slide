#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_NAME="next-slide"
SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"

echo "Next Slide Installer"
echo "===================="
echo ""

installed=false

# --- Claude Code ---
if [ -d "$HOME/.claude/skills" ]; then
  echo "[1/2] Claude Code detected — installing skill..."

  if [ -L "$SKILL_DIR" ]; then
    echo "  Removing existing symlink at $SKILL_DIR"
    rm "$SKILL_DIR"
  elif [ -d "$SKILL_DIR" ]; then
    echo "  Removing existing directory at $SKILL_DIR"
    rm -rf "$SKILL_DIR"
  fi

  # Symlink so updates to the repo propagate automatically
  ln -s "$SCRIPT_DIR" "$SKILL_DIR"
  echo "  Symlinked $SCRIPT_DIR -> $SKILL_DIR"
  installed=true
else
  echo "[1/2] Claude Code not found (no ~/.claude/skills/) — skipping."
fi

echo ""

# --- OpenClaw ---
if command -v clawhub &>/dev/null; then
  echo "[2/2] OpenClaw detected — registering plugin..."
  clawhub install "$SCRIPT_DIR"
  installed=true
else
  echo "[2/2] OpenClaw not found — skipping."
fi

echo ""

if [ "$installed" = true ]; then
  echo "Done! Next Slide is ready."
  echo ""
  echo "Usage:"
  echo "  - In Claude Code: say '/next-slide' or '帮我做个演示'"
  echo "  - In OpenClaw:    the skill triggers on presentation-related prompts"
  echo ""
  echo "50+ styles, zero dependencies, bilingual. 你的下个 ppt，何必是 PPT"
else
  echo "Neither Claude Code nor OpenClaw was detected."
  echo ""
  echo "To install manually for Claude Code:"
  echo "  mkdir -p ~/.claude/skills"
  echo "  cp -r $SCRIPT_DIR ~/.claude/skills/$SKILL_NAME"
  echo ""
  echo "To install via OpenClaw:"
  echo "  clawhub install next-slide"
fi
