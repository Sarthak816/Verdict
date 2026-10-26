---
name: verdict
description: Deploy an open-source 3-model jury to judge PRs, diffs, and code patches before merging
triggers:
  - "review pr"
  - "judge pr"
  - "verdict"
  - "run verdict"
---

# Verdict Skill for Alan AI & Coding Agents

When invoked, this skill runs an independent panel of specialized open models:
1. **DeepSeek V4 Pro**: Deep security analysis, state synchronization & race condition checks.
2. **Qwen 2.5 Coder 32B**: Correctness, typing bugs, unhandled exceptions, and edge case detection.
3. **Llama 3.1 8B**: Specification adherence, test completeness, and regression triage.

## Usage
Run `/verdict` on the current working diff or pass a GitHub PR link.
