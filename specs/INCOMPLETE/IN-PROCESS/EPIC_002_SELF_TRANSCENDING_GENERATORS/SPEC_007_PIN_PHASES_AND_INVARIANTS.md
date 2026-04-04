# SPEC_007_PIN — Phases and invariants

**Cite as:** **`SPEC_007_PIN`**.

## Status

**Implemented** — [`NoveltyTheory/Core/Phase.lean`](../../../../NoveltyTheory/Core/Phase.lean); closure [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Problem

Phases are **not** mere outputs: they are structurally coherent regions of the generator’s trajectory with an **invariant signature** that explanatory regimes must respect. Phase change must be tied to **minimal adequate regime** shifts, not only new states.

## Requirements

1. **`Phase`** — Minimal bundled object (as in **`SPEC_002_OCN`**): e.g. carrier `U` (family of outputs or states-as-seen-from-phase) and `I` a type family or predicate capturing **structural invariants** to be explained at that phase. Implementation may refine `U` as subsets, fibers, or orbits—choose the most reusable Mathlib-first pattern.

2. **`GeneratedBy G P`** — Relation (or predicate) stating phase `P` is **causally realized** along the trajectory of generator `G`. Must connect to `GenerativeSystem` from **`SPEC_004_GSY`**.

3. **Phase invariants** — API for extracting or certifying invariants `I` and for comparing invariant **strength** across phases when needed by **`SPEC_008_PSH`**.

4. **History objects** — Type for “history up to stage `n`” (`P_{≤ n}` style) supporting conservative-extension statements in **`SPEC_008_PSH`**.

5. **Extension points** — Hooks for **model-level** definitions of phases (signature extensions, diagonal stages) in **`SPEC_012_MDL`**.

## Acceptance criteria

- [x] `Phase`, `generatedBy`, and related API used across adequacy / reductions / models.
- [x] `NoveltyTheory/Foundation/` lemmas compose with phases without circular imports (**`SPEC_003_RCT`**).
- [x] Default library: no undocumented `sorry` / stray project `axiom` (per [`MANIFEST.md`](../../../../MANIFEST.md)).

**Closure:** [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Dependencies

- **`SPEC_003_RCT`**, **`SPEC_004_GSY`**.

## Out of scope

- Defining `ParadigmShift` (that is **`SPEC_008_PSH`**).
