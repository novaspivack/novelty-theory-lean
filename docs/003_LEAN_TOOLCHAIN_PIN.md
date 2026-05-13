# 003 — Canonical Lean 4 toolchain pin (stub standard)

**Purpose:** One place that records which **Lean 4 release candidate** nested `*-lean` libraries created from this stub should use, so they stay aligned with your other Lean repositories.

## Pinned toolchain

The single line in each nested repo’s **`lean-toolchain`** file must be:

```text
leanprover/lean4:v4.29.1
```

## Source of truth (verification)

This pin is kept in sync with:

- **`reflexive-architecture-lean`:** `reflexive-architecture/reflexive-architecture-lean/lean-toolchain` (authoritative workspace layout on this machine: `~/reflexive-architecture/reflexive-architecture-lean`).

When you bump the RC across your libraries, **update this doc** and every nested `lean-toolchain` in repos derived from the stub, then run `lake update` / `lake build` as needed.

## Applying to a new nested Lean repo

1. Create or edit **`lean-toolchain`** in the library root so it contains exactly the line above (no extra whitespace).
2. Run `lake build` and commit any resulting **`lake-manifest.json`** changes with the toolchain bump.

## Mathlib and dependencies

Libraries that **`require mathlib`** should pin Mathlib in **`lakefile.lean`** to the tag that matches this Lean version (see upstream Mathlib release notes for **`v4.29.1`**). **novelty-theory-lean** pins Mathlib at **`v4.29.1`** in [`lakefile.lean`](../lakefile.lean).

---

_Update this file whenever the canonical RC in `reflexive-architecture-lean` changes._
