# SPEC_010_UEN — Upward explanatory necessity

**Cite as:** **`SPEC_010_UEN`**.

## Status

**Implemented (Model C)** — [`NoveltyTheory/Models/InvariantTower.lean`](../../../../NoveltyTheory/Models/InvariantTower.lean) (`provesAtDepth`, soundness, gaps); summit packaging [`SummitPackages.upwardExplanatoryNecessity_counterfact`](../../../../NoveltyTheory/Summits/SummitPackages.lean); closure [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Problem

Summit IV: **later generated regimes become necessary** to **state or prove** structural truths about the **generator’s own trajectory**—not merely wrappers around outputs. Formally, for each stage `n` there exists `Φ_n` about `G` such that **`R_{n+1} ⊢ Φ_n`** but **`R_n ⊬ Φ_n`**, and no **fixed** admissible regime proves all `Φ_n`.

## Requirements

1. **`StructuralTruth G Φ`** — Predicate carving out sentences (or type of propositions) “about the trajectory of `G`” without smuggling the conclusion into the definition.

2. **Provability / derivability relation** — `R ⊢ Φ` (or `Syntax`-level in a formalized language keyed by regime `R`). Choose a representation strong enough for honest comparisons and optional Gödelian subtleties if used—**document any foundational assumptions**.

3. **Strict separation** — For each `n`, exhibit `Φ_n` with separation `R_{n+1} ⊢ Φ_n` and `¬ (R_n ⊢ Φ_n)` (or `R_n ⊬ Φ_n` as appropriate to the proof system).

4. **No single admissible final prover** — Clause mirroring **`SPEC_002_OCN`**: no fixed `E ∈ 𝓔_adm` proves all `Φ_n` uniformly (exact statement coordinated with **`SPEC_006_ADR`** and **`SPEC_011_SPK`**).

5. **Model path** — Reference **`SPEC_012_MDL`** Model C for how fresh invariant vocabulary unlocks trace facts.

## Acceptance criteria

- [x] Canonical Summit IV packaging: `upwardExplanatoryNecessity_counterfact` (explicit `provesAtDepth` separation).
- [x] Proof obligations: inductive `Pf` / [`MANIFEST.md`](../../../../MANIFEST.md) hygiene (Mathlib standard).
- [x] **`SPEC_011_SPK`** + [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) list Summit IV names.

**Closure:** [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md).

## Dependencies

- **`SPEC_005_EXR`** through **`SPEC_009_DST`** (minimum), plus **`SPEC_012_MDL`** for intended construction.

## Out of scope

- Philosophy of “necessity” beyond the formalized derivability sense.
