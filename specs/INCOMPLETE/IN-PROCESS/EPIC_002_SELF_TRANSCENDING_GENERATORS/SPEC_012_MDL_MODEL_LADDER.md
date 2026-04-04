# SPEC_012_MDL — Concrete model ladder

**Cite as:** **`SPEC_012_MDL`**.

## Status

**Draft** — constructive paths for proving ridge and summit theorems without premature philosophical generality.

## Problem

Abstract primitives must be **instantiated** so that:
- irreducibility is **real** (fresh symbols / arities / certified distinctions),
- diagonal stages have **witnesses**,
- upward necessity has a **semantic story** where vocabulary extension unlocks trace truths.

## Requirements

### Model A — Signature-extension tower

Each phase requires **fresh** logical vocabulary (relation symbol, arity, or sorted extension) to express its invariant. Delivers clean **strict irreducibility** and **conservative extension** smoke tests.

**Deliverables:** `NoveltyTheory/Models/SignatureTower/` (or equivalent); lemmas used by Foundation/Ridge tests.

### Model B — Reducer-diagonal generator

Enumerate **`𝓔_adm`** candidates; stage `n` produces a phase whose invariant **defeats** reducer `n` while preserving prior history. Primary engine for **`SPEC_009_DST`**.

**Deliverables:** `NoveltyTheory/Models/ReducerDiagonal/`; ties to finite presentation of `G`.

### Model C — Upward-explanation model

Phases where a **structural truth** about the trace is **expressible or provable only** after extending invariants (links **`SPEC_010_UEN`**). May trail Model A/B if complexity demands it—track in orchestration.

**Deliverables:** `NoveltyTheory/Models/InvariantTower/` or dedicated submodule per **`SPEC_003_RCT`**.

## Cross-cutting requirements

1. **Smoke tests** — Each model compiles and demonstrates at least one nontrivial lemma used higher in the stack.

2. **Non-circularity** — Models may depend on Core definitions, not on summit files (imports face **upward** only).

3. **Documentation** — Short external-facing comments on what each model **discharges** as obligation for the abstract layer.

## Acceptance criteria

- [ ] All three model folders exist OR deferrals are explicit in [`EPIC_002_MASTER_ORCHESTRATION.md`](EPIC_002_MASTER_ORCHESTRATION.md) with blocker text (**STOP AND ASK** policy in [`NOTES/PROJECT_SEED.md`](../../../../NOTES/PROJECT_SEED.md) §5.2 if the deferral is not owner-approved).
- [ ] `lake build` passes.

## Dependencies

- **`SPEC_004_GSY`**–**`SPEC_008_PSH`** minimum for meaningful models.

## Out of scope

- Claiming empirical relevance beyond mathematical instantiation.
