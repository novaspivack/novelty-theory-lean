# 001 — Project overview (novelty-theory-lean)

## What this is

**novelty-theory-lean** is a **Lean 4** library for formal developments in **novelty theory**. This repository is the **public artifact**: library sources, final paper, and developer-facing documentation.

**Normative specs**, epic orchestration, and maintainer queues live in **[novelty-theory](https://github.com/novaspivack/novelty-theory)** (companion repo). Links to `specs/…` elsewhere in `docs/` point at that repository when a path is needed.

## Toolchain

- **Lean:** `v4.29.0-rc6` — [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md)
- **Mathlib:** `v4.29.0-rc6` (pinned in [`lakefile.lean`](../lakefile.lean))

## Entry points

| Path | Role |
|------|------|
| [`NoveltyTheory/Basic.lean`](../NoveltyTheory/Basic.lean) | Default library root module (scaffold) |
| [`MANIFEST.md`](../MANIFEST.md) | Proof hygiene and artifact inventory |
| [`docs/THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md) | Theorem/lemma catalog |
| [`paper/Final Draft/COMPILE.md`](../paper/Final%20Draft/COMPILE.md) | Build the companion paper |

## Consumers

Depend on this repo via **git submodule**, git dependency, or a published artifact, per your project’s layout. This tree **is** the library root.
