# SPEC_011_SPK — Summit packages (headline theorems)

**Cite as:** **`SPEC_011_SPK`**.

## Status

**Draft** — packages **Summit I–IV** from [**`SPEC_002_OCN`**](../THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md) into stable Lean names and dependency order.

## Problem

Headline theorems must be **findable**, **unambiguous**, and **ordered** so that the library reads as a ladder: causal/explanatory separation → infinite paradigm tower → no final internal theory → upward explanatory necessity.

## Requirements

### Summit I — Causal / explanatory separation

Existence of `G` and tower `(P_n, R_n)` with every phase **generated** by `G`, yet for every **fixed** `E ∈ 𝓔_adm` there exists `n` such that **`¬ Explains E G P_n R_n`** (exact names from **`SPEC_006_ADR`**).

**Lean target name (recommended):** `causal_generation_not_uniform_explanation` (or `summit1_causalExplanatorySeparation`).

### Summit II — Infinite paradigm tower

Existence with **`∀ n, ParadigmShift R_n R_{n+1} (history P_{≤ n})`** (arity as in **`SPEC_008_PSH`**).

**Lean target name:** `infinite_paradigm_tower` / `selfTranscending_tower_exists` stage bundle.

### Summit III — No final internal theory

For the constructed `G`, for every **admissible** regime `R` internal to the class, **`∃ n, ¬ Adequate R P_n`**.

**Lean target name:** `noFinalInternalTheory_of_selfTranscending` (or `summit3_noFinalAdmissibleRegime`).

### Summit IV — Upward explanatory necessity

As in **`SPEC_010_UEN`**: `Φ_n` with provability lift `R_{n+1} ⊢ Φ_n`, `R_n ⊬ Φ_n`, and no fixed admissible interface captures all `Φ_n`.

**Lean target name:** `upwardExplanatoryNecessity_of_selfTranscending`.

## Global requirements

1. **Implication graph** — Document which summit lemmas imply which others under project axioms.

2. **`THEOREM_INVENTORY.md`** — Each summit row: informal statement, Lean name, module path, primary axioms, key dependencies.

3. **`NoveltyTheory/Summits/`** — One file per summit package or a grouped file with ordered sections; follow **`SPEC_003_RCT`**.

## Acceptance criteria

- [ ] Every summit has a **single canonical** Lean declaration (no duplicate competing statements).
- [ ] `SPEC_010_UEN` and this file agree on Summit IV wording.
- [ ] CI builds; inventory updated in same PR when proofs land.

## Dependencies

- **`SPEC_006_ADR`** through **`SPEC_010_UEN`**.

## Out of scope

- Paper title / marketing prose (see narrative **`SPEC_002_OCN`** for suggestions only).
