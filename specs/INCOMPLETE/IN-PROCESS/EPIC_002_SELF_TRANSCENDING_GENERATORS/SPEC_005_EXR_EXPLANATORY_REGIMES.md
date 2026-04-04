# SPEC_005_EXR — Explanatory regimes and adequacy

**Cite as:** **`SPEC_005_EXR`**.

## Status

**Implemented** — [`NoveltyTheory/Core/ExplanatoryRegime.lean`](../../../../NoveltyTheory/Core/ExplanatoryRegime.lean); closure [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Problem

“Reduction” errors if a regime is only a syntax for outputs. A regime must carry **explanatory** structure: what it can **express**, which **invariants** it tracks, and when it is **adequate** for a phase. Without this, trivial encodings refute the summit theorems.

## Requirements

1. **`ExplanatoryRegime`** — Carrier type(s) for **descriptions** (or propositions) and structure linking:
   - what it means for the regime to **express** or **carry** a class of phase invariants (see **`SPEC_007_PIN`** for invariant attachment),
   - an **adequacy** predicate `Adequate R P` (regime `R`, phase `P`) that does **not** reduce to “some bijection to raw outputs.”

2. **Adequacy vs coding** — Document the intended anti-triviality interface: adequacy implies preservation of **certified** structural distinctions for the phase (exact formalization crosses **`SPEC_006_ADR`** and **`SPEC_007_PIN`**). This spec states the design goal; **`SPEC_006_ADR`** supplies reduction morphisms and non-collapse.

3. **Order / extension (optional minimal)** — If needed for conservative extension later, include data for regime comparison `R ≤ R'` or a morphism class; otherwise leave hooks for **`SPEC_008_PSH`**.

4. **No summit conclusions** — Do not define “self-transcending” here.

## Acceptance criteria

- [x] `ExplanatoryRegime` / adequacy integrate with `Phase` (**`SPEC_007_PIN`**) across Core / Models.
- [x] External-facing module comments per [`CODING_PROTOCOLS.md`](../../../../CODING_PROTOCOLS.md).
- [x] Module placement per **`SPEC_003_RCT`** (`NoveltyTheory/Core/`).

**Closure:** [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Dependencies

- **`SPEC_003_RCT`**, **`SPEC_007_PIN`** (may be developed in parallel with stub `Phase` if necessary, then unified).

## Out of scope

- Philosophical interpretation; sociology of science.
