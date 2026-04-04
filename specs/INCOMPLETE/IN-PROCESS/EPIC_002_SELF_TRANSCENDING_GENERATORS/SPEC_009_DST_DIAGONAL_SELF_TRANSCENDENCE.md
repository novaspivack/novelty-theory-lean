# SPEC_009_DST — Diagonal self-transcendence

**Cite as:** **`SPEC_009_DST`**.

## Status

**Implemented (model-scoped)** — `NoveltyTheory/Ridge/DiagonalNat.lean`, `Models/ReducerDiagonal`, related ridge lemmas; narrative target [**`SPEC_002_OCN`**](../THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md); closure [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Problem

To obtain results that are **not** “generic open-endedness,” the library should support a **constructive separation** from any **fixed** admissible explanatory interface when the class `𝓔_adm` is **encodable / effectively enumerable**: stage `n` defeats the `n`-th candidate while preserving prior history structure.

## Requirements

1. **Hypothesis interface** — Predicate or typeclass `AdmissibleEnumerable 𝓔` (name flexible) capturing what **`SPEC_002_OCN`** calls enumerability of fixed explanatory reducers / interfaces.

2. **`DiagonalDefeat` scaffolding** — For each stage `n`, construction data producing a phase (or history extension) whose certified invariant **refutes** uniformity of the `n`-th admissible interface under the rules of **`SPEC_006_ADR`**.

3. **`TowerConstruction` lemmas** — Infinite conservative tower under the enumeration hypothesis; lemmas live in `NoveltyTheory/Ridge/` per **`SPEC_003_RCT`**.

4. **`NoUniformReducer` / generator packaging** — A single **finitely specified** `G` realizing the whole tower (connection to **`SPEC_004_GSY`** finite-presentation hooks and **`SPEC_012_MDL`** Model B).

5. **Honesty clause** — Theorem statements must list all structural hypotheses (enumerability, admissibility constraints, non-triviality). No hidden axioms.

## Acceptance criteria

- [x] Diagonal / alignment lemmas compile and are used in summit and model packages (`DiagonalNat`, `InterfaceAlignment`, `BoundedRegimeDiagonal`, **etc.**).
- [x] Wired into **`SPEC_011_SPK`** (e.g. `no_uniform_row_at_next_stage`, bounded-family diagonal).
- [x] Consistent with **`SPEC_008_PSH`** and **`SPEC_006_ADR`** interfaces.

**Closure:** [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Dependencies

- **`SPEC_006_ADR`**, **`SPEC_008_PSH`**, **`SPEC_004_GSY`**, **`SPEC_007_PIN`**.

## Out of scope

- Upward explanatory necessity (**`SPEC_010_UEN`**) unless reuse emerges naturally.
