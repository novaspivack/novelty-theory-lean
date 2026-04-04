# SPEC_001_ST1 — Repository bootstrap (novelty-theory-lean)

**Cite as:** **`SPEC_001_ST1`**.

## Status

**Complete** for bootstrap — repository scaffold verified with **`lake build`**; further work tracked under **Phase 1** of [`EPIC_001_MASTER_ORCHESTRATION.md`](EPIC_001_MASTER_ORCHESTRATION.md).

## Problem

The **novelty-theory-lean** repository needs a reproducible Lean 4 scaffold aligned with the canonical toolchain and agent methodology.

## Requirements

1. **`lean-toolchain`** — `leanprover/lean4:v4.29.0-rc6` ([`docs/003_LEAN_TOOLCHAIN_PIN.md`](../../../../docs/003_LEAN_TOOLCHAIN_PIN.md)).
2. **`lakefile.lean`** — package `«novelty-theory-lean»`, **Mathlib** at `v4.29.0-rc6`, default **`lean_lib «NoveltyTheory»`** with root `NoveltyTheory.Basic`.
3. **Library root** — `NoveltyTheory/Basic.lean` compiles (minimal scaffold; replace with real definitions/theorems as theory specs land).
4. **`MANIFEST.md`** — proof hygiene table at repo root; keep updated as `sorry` / axioms / scope change.
5. **Docs** — [`docs/001_PROJECT_OVERVIEW.md`](../../../../docs/001_PROJECT_OVERVIEW.md), [`docs/002_DEVELOPER_SETUP.md`](../../../../docs/002_DEVELOPER_SETUP.md), [`docs/004_LEAN_LIBRARY_LAYOUT.md`](../../../../docs/004_LEAN_LIBRARY_LAYOUT.md), [`docs/000_INDEX.md`](../../../../docs/000_INDEX.md) describe this repo accurately.
6. **`CODING_PROTOCOLS.md`** — **Project specifics** filled for Lean (build commands).
7. **Committed `lake-manifest.json`** after a successful **`lake build`** so clones reproduce dependencies.

## Acceptance criteria

- [x] `lake build` succeeds from a clean clone (after network fetch of Mathlib).
- [x] All items in **Requirements** are satisfied and cross-linked from [`EPIC_001_MASTER_ORCHESTRATION.md`](EPIC_001_MASTER_ORCHESTRATION.md).
- [x] No undocumented `sorry` or project `axiom` in default library (scaffold may use only `trivial` proofs).

## Out of scope

- Full mathematical development of novelty theory (follow-on **SPEC_00N_XXX** files).
