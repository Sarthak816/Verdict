#!/usr/bin/env bash
# Verdict is a CLI, so there are no long-running services to start here.
# This only makes sure the pinned toolchain and dependencies are present on a
# fresh boot or a resumed disk before a session runs the CLI.
set -euo pipefail

export PATH="$HOME/.bun/bin:$PATH"

if ! command -v bun >/dev/null 2>&1; then
  echo "start.sh: bun is missing; run 'bash .alan/setup.sh'" >&2
  exit 1
fi

if [ ! -d node_modules ]; then
  bun install --frozen-lockfile
fi