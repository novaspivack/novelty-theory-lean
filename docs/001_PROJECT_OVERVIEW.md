# 001 — Project overview (novelty-theory-lean)

## What this is

**novelty-theory-lean** is a **Lean 4** library for formal work on **novelty theory**, together with a **final-draft companion paper** in LaTeX. The repository is intended to be a **citable, buildable artifact**: sources, paper, and documentation needed to reproduce the formal claims.

## Toolchain

- **Lean:** `v4.29.1` — [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md)
- **Mathlib:** `v4.29.1` (pinned in [`lakefile.lean`](../lakefile.lean))

## Entry points

| Path | Role |
|------|------|
| [`NoveltyTheory/Basic.lean`](../NoveltyTheory/Basic.lean) | Default entry module (imports the aggregate) |
| [`MANIFEST.md`](../MANIFEST.md) | Proof hygiene and inventory roll-up |
| [`docs/THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md) | Theorem/lemma catalog |
| [`paper/Final Draft/COMPILE.md`](../paper/Final%20Draft/COMPILE.md) | Build the companion paper |

## Consumers

Depend on this tree via **git submodule**, a Lake dependency path, or a published artifact, according to your project. This directory is the **library root**.
