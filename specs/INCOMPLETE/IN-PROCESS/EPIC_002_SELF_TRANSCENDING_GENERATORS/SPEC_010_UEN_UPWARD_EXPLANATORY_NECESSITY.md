# SPEC_010_UEN — Upward explanatory necessity

**Cite as:** **`SPEC_010_UEN`**.

## Status

**Draft** — strongest summit tier per [**`SPEC_002_OCN`**](../THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md); expect dependence on ridge + models (**`SPEC_012_MDL`** Model C).

## Problem

Summit IV: **later generated regimes become necessary** to **state or prove** structural truths about the **generator’s own trajectory**—not merely wrappers around outputs. Formally, for each stage `n` there exists `Φ_n` about `G` such that **`R_{n+1} ⊢ Φ_n`** but **`R_n ⊬ Φ_n`**, and no **fixed** admissible regime proves all `Φ_n`.

## Requirements

1. **`StructuralTruth G Φ`** — Predicate carving out sentences (or type of propositions) “about the trajectory of `G`” without smuggling the conclusion into the definition.

2. **Provability / derivability relation** — `R ⊢ Φ` (or `Syntax`-level in a formalized language keyed by regime `R`). Choose a representation strong enough for honest comparisons and optional Gödelian subtleties if used—**document any foundational assumptions**.

3. **Strict separation** — For each `n`, exhibit `Φ_n` with separation `R_{n+1} ⊢ Φ_n` and `¬ (R_n ⊢ Φ_n)` (or `R_n ⊬ Φ_n` as appropriate to the proof system).

4. **No single admissible final prover** — Clause mirroring **`SPEC_002_OCN`**: no fixed `E ∈ 𝓔_adm` proves all `Φ_n` uniformly (exact statement coordinated with **`SPEC_006_ADR`** and **`SPEC_011_SPK`**).

5. **Model path** — Reference **`SPEC_012_MDL`** Model C for how fresh invariant vocabulary unlocks trace facts.

## Acceptance criteria

- [ ] `UpwardExplanatoryNecessity` (or summit-named theorem) is stated with explicit hypotheses.
- [ ] Dependencies on formalized provability are listed; no silent classical axioms beyond project standard.
- [ ] Cross-links to **`SPEC_011_SPK`** Summit IV and **`THEOREM_INVENTORY.md`** when created.

## Dependencies

- **`SPEC_005_EXR`** through **`SPEC_009_DST`** (minimum), plus **`SPEC_012_MDL`** for intended construction.

## Out of scope

- Philosophy of “necessity” beyond the formalized derivability sense.
