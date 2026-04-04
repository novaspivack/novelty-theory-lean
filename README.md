# novelty-theory-lean

Lean 4 library for formal work on **novelty theory**: Mathlib **`v4.29.0-rc6`**, toolchain pinned to **`leanprover/lean4:v4.29.0-rc6`** (see [`docs/003_LEAN_TOOLCHAIN_PIN.md`](docs/003_LEAN_TOOLCHAIN_PIN.md)).

## Quick start

```bash
lake build
```

Setup details: [`docs/002_DEVELOPER_SETUP.md`](docs/002_DEVELOPER_SETUP.md).

## For agents

| File | Role |
|------|------|
| [`QUEUE.md`](QUEUE.md) | Cross-epic queue + **execution contract** |
| [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) | Methodology |
| [`CODING_PROTOCOLS.md`](CODING_PROTOCOLS.md) | Proof quality + Git/discipline |
| [`docs/000_INDEX.md`](docs/000_INDEX.md) | Documentation map |
| [`MANIFEST.md`](MANIFEST.md) | Proof hygiene inventory |

Active epic: **`EPIC_001_NOVELTY_THEORY_LEAN`** — bootstrap spec **`SPEC_001_ST1`**.

This repo **is** the library root; parent projects may add it as a **`git submodule`**.

## Layout

- **`NoveltyTheory/`** — main library modules (default root: `Basic.lean`)
- **`specs/`** — normative specs (`SPEC_NNN_XXX`)
- **`docs/`** — developer docs (not specs)

## License

_Add a `LICENSE` file when you publish._
