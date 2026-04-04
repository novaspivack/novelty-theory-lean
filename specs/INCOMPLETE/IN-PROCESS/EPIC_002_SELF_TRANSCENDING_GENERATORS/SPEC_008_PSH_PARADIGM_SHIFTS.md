# SPEC_008_PSH — Paradigm shifts (structural definition)

**Cite as:** **`SPEC_008_PSH`**.

## Status

**Implemented** — [`NoveltyTheory/Core/ParadigmShift.lean`](../../../../NoveltyTheory/Core/ParadigmShift.lean); closure [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Problem

“Paradigm shift” must be **mathematics**, not metaphor: a **structurally irreducible conservative phase transition** with a **witness phase** inadequately explained in the prior regime but adequately explained in the next, and **no admissible reduction** of the later regime to the former on the strengthened history.

## Requirements

1. **Conservative extension over history** — Predicate `ConservativeOver H R R'` (names may vary) capturing that `R'` preserves prior adequacy on history `H` while extending expressive strength.

2. **Strict extension / ordering** — `R < R'` or equivalent irreflexive relation used in the formal definition.

3. **`ParadigmShift R R' H` (or with witness phase)** — Definition equivalent in spirit to **`SPEC_002_OCN`**:
   - conservativity over `H`,
   - existence of **witness phase** `P'` **generated** in scope,
   - **`¬ Adequate R P`** and **`Adequate R' P`**,
   - **`¬ Reducible R' R`** on `H ∪ {P}` (precise formalization uses **`SPEC_006_ADR`**).

4. **Tower compatibility** — API for `ParadigmShift` indexed by `n : ℕ` with history `P_{≤ n}` feeding stage `n+1`.

5. **Lemma targets (ridge)** — List expected bridge lemmas (proved in `NoveltyTheory/Ridge/`): shift witness, irreducible shift from fresh invariant, etc., cross-linked to **`SPEC_003_RCT`**.

## Acceptance criteria

- [x] `ParadigmShift` is used in towers and model / ridge lemmas (**`SPEC_009_DST`** / **`SPEC_012_MDL`**).
- [x] Definitions stay standard (types + `ℕ`-indexed towers); no extra foundational axioms beyond Mathlib + project standard.
- [x] Hygiene tracked in [`MANIFEST.md`](../../../../MANIFEST.md).

**Closure:** [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Dependencies

- **`SPEC_005_EXR`**, **`SPEC_006_ADR`**, **`SPEC_007_PIN`**.

## Out of scope

- Existence of infinite towers ( **`SPEC_009_DST`**, **`SPEC_011_SPK`** ).
