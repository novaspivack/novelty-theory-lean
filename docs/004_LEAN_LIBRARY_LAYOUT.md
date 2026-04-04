# 004 — Lean library layout (novelty-theory-lean)

**Purpose:** Describe how Lake, modules, and repository metadata fit together.

## Repository role

This repository **is** the **novelty-theory-lean** library. Lean sources, `lakefile.lean`, and `lean-toolchain` live at the **repo root**. A separate prose or paper repository may add this project as a **`git submodule`** ([`NOTES/PROJECT_SEED.md`](../NOTES/PROJECT_SEED.md) §7.3).

## Lake

| File | Role |
|------|------|
| [`lean-toolchain`](../lean-toolchain) | Pin to `leanprover/lean4:v4.29.0-rc6` — see [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md) |
| [`lakefile.lean`](../lakefile.lean) | Package `«novelty-theory-lean»`, Mathlib dependency, default `lean_lib «NoveltyTheory»` |
| [`lake-manifest.json`](../lake-manifest.json) | Locked dependency revisions (commit after `lake update` / successful build) |

## Source layout

```text
NoveltyTheory/
  Basic.lean          # default root module (extend with more files / namespaces)
MANIFEST.md           # proof hygiene / known gaps
```

Add further roots in **`lakefile.lean`** only when you introduce additional **`lean_lib`** targets.

## Docs and specs (not Lean sources)

- **`docs/`** — developer reference (this file, setup, toolchain pin).
- **`specs/`** — normative work specs; cite as **`SPEC_NNN_XXX`**.

---

_Keep this doc aligned with `lakefile.lean` and the active epic in `specs/INCOMPLETE/IN-PROCESS/`._
