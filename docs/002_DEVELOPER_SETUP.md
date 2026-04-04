# 002 — Developer setup (novelty-theory-lean)

## Prerequisites

- [Elan](https://github.com/leanprover/elan) (installs the pinned Lean from [`lean-toolchain`](../lean-toolchain))
- Network access for first **`lake build`** (fetches Mathlib)

## Clone and build

```bash
cd /path/to/novelty-theory-lean
lake build
```

Elan reads **`lean-toolchain`** automatically when you run `lake` from this directory.

## Verify

- **`lake build`** completes with no errors.
- Optional: open **`NoveltyTheory/Basic.lean`** in an editor with Lean LSP.

## After dependency bumps

1. Edit **`lean-toolchain`** and Mathlib tag in **`lakefile.lean`** per [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md).
2. Run **`lake update`** then **`lake build`**.
3. Commit **`lake-manifest.json`** with the Lean changes.

## Agent methodology

See **[`QUEUE.md`](../QUEUE.md)**, **[`NOTES/PROJECT_SEED.md`](../NOTES/PROJECT_SEED.md)**, and **[`CODING_PROTOCOLS.md`](../CODING_PROTOCOLS.md)**.
