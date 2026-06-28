#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-$HOME}"

if ! command -v stow &>/dev/null; then
  echo "Error: GNU Stow is not installed."
  echo "Install it: brew install stow  |  apt install stow  |  pacman -S stow"
  exit 1
fi

echo "Symlinking opencode-skills to $TARGET..."
cd "$REPO_DIR"
stow -t "$TARGET" --restow .

echo "Done. Skills and commands are now available globally."
echo "  Skills:   $TARGET/.config/opencode/skills/"
echo "  Commands: $TARGET/.config/opencode/commands/"
echo ""
echo "Restart OpenCode to use them."
