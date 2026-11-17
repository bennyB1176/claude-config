#!/usr/bin/env bash
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="$HOME/.claude/CLAUDE.md"

mkdir -p "$HOME/.claude"
if [ -L "$target" ] && [ "$(readlink "$target")" = "$repo/CLAUDE.md" ]; then
  echo "already linked: $target -> $repo/CLAUDE.md"
  exit 0
fi
if [ -e "$target" ] || [ -L "$target" ]; then
  backup="$target.backup-$(date +%Y%m%d-%H%M%S)"
  mv "$target" "$backup"
  echo "kept the previous file as $backup"
fi
ln -s "$repo/CLAUDE.md" "$target"
echo "linked: $target -> $repo/CLAUDE.md (update with: git -C $repo pull)"
