# Verdict ⚖️

> **"CI passed. The code is wrong."**  
> A panel of open-source models judges every PR your agent ships — in 30 seconds, with confidence scoring and auto-fix patches.

[![OpenFire Hackathon](https://img.shields.io/badge/OpenFire-Alan%20AI%20Hackathon-red.svg)](https://tryalan.ai/)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Built with Bun](https://img.shields.io/badge/runtime-Bun%201.3-black.svg)](https://bun.sh)

---

## 💡 The Problem

> *"AI Made Coding Cheap. Judgment Got Expensive."*  
> — Prasad Pilla, Founder & CEO of Alan AI

Coding agents write thousands of lines of code in seconds. CI pipelines run unit tests and report green ✅. But tests only test what you anticipated. Subtle concurrency bugs, auth edge cases, prompt leakage, and silent logical regressions slip past CI straight into production.

**Verdict** is the open-source judgment layer. It deploys an independent panel of specialized open-source models as a jury over git diffs before merging.

```
                        ┌───────────────────────────────────────┐
                        │              Pull Request             │
                        └───────────────────┬───────────────────┘
                                            │
                                            ▼
                        ┌───────────────────────────────────────┐
                        │             Verdict CLI               │
                        └───────────────────┬───────────────────┘
                                            │
                ┌───────────────────────────┼───────────────────────────┐
                ▼                           ▼                           ▼
    ┌───────────────────────┐   ┌───────────────────────┐   ┌───────────────────────┐
    │  DeepSeek V4 Pro      │   │  Qwen 2.5 Coder 32B   │   │  Llama 3.1 8B         │
    │  (Security & Logic)   │   │  (Syntax & Correctness│   │  (Spec Adherence & CI)│
    └───────────┬───────────┘   └───────────┬───────────┘   └───────────┬───────────┘
                │                           │                           │
                └───────────────────────────┼───────────────────────────┘
                                            ▼
                                ┌───────────────────────┐
                                │ Arbitrator & Scorer   │
                                └───────────┬───────────┘
                                            │
                        ┌───────────────────┴───────────────────┐
                        ▼                                       ▼
             [ APPROVE / REQUEST_CHANGES ]              [ Auto-Fix Git Patch ]
```

---

## ⚡ Quickstart

### Prerequisites
- [Bun](https://bun.sh) >= 1.0 (or Node.js >= 20)

### Installation
```bash
# Clone the repository
git clone https://github.com/Sarthak816/Verdict.git
cd Verdict

# Install dependencies
bun install
```

### Usage
```bash
# Judge local git diff
bun run dev

# Judge a GitHub PR
bun run dev --pr https://github.com/owner/repo/pull/42

# Generate auto-repair patch
bun run dev --fix
```

---

## 🧩 Alan AI Ecosystem (`SKILL.md`)

Verdict installs as an official Alan AI skill across Claude Code, Aiden, Cursor, and OpenCode:

```bash
npx skills add Sarthak816/Verdict
```

In your agent:
```
/verdict review this PR against the acceptance criteria
```

---

## 📜 License

Apache-2.0 © 2026 Sarthak
