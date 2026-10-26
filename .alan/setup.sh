#!/usr/bin/env bash
# Install the Bun toolchain pinned by this project and its dependencies.
# Runs once per image build, in the repository directory, as `alan`.
set -euo pipefail

BUN_VERSION="1.4.4"

if ! command -v bun >/dev/null 2>&1 || [ "$(bun --version 2>/dev/null || true)" != "$BUN_VERSION" ]; then
  curl -fsSL https://bun.sh/install | bash -s "bun-v${BUN_VERSION}"
fi

# PATH already contains ~/.bun/bin, but keep a stable link for every shell.
mkdir -p "$HOME/.local/bin"
ln -sf "$HOME/.bun/bin/bun" "$HOME/.local/bin/bun"
if [ -x "$HOME/.bun/bin/bunx" ]; then
  ln -sf "$HOME/.bun/bin/bunx" "$HOME/.local/bin/bunx"
fi

export PATH="$HOME/.bun/bin:$PATH"

# Install exactly what bun.lock records; never rewrite the lockfile.
bun install --frozen-lockfile