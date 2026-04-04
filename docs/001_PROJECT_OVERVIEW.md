# 001 — Project overview (novelty-theory-lean)

## What this is

**novelty-theory-lean** is a **Lean 4** library for formal developments in **novelty theory**. It uses the agent-oriented structure from Default-repo-stub: **`specs/`** for requirements, **`docs/`** for finished developer reference, and **[`QUEUE.md`](../QUEUE.md)** for cross-epic execution discipline.

## Toolchain

- **Lean:** `v4.29.0-rc6` — [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md)
- **Mathlib:** `v4.29.0-rc6` (pinned in [`lakefile.lean`](../lakefile.lean))

## Entry points

| Path | Role |
|------|------|
| [`NoveltyTheory/Basic.lean`](../NoveltyTheory/Basic.lean) | Default library root module (scaffold) |
| [`MANIFEST.md`](../MANIFEST.md) | Proof hygiene and artifact inventory |
| [`specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/) | Active epic and **SPEC_001_ST1** bootstrap |
| [`paper/`](../paper/README.md) | LaTeX paper bundle (prologue/preamble aligned with ugp-lean + `\leanref`; prep notes in **008**) |

## Parent repositories

Consumers should depend on this repo via **git submodule** or published artifact per their own specs; this repo does not embed a nested `*-lean` child.
