# SPEC_006_ADR — Admissible reductions

**Cite as:** **`SPEC_006_ADR`**.

## Status

**Draft** — definitions to implement under [`SPEC_003_RCT`](SPEC_003_RCT_REPO_CONTRACT.md).

## Problem

Without **layer 3**—maps from generator-level description to regime-level explanation that **preserve explanatory structure**—“generated but not reducible” collapses. The library must pin what counts as **admissible**: adequacy preservation, invariant preservation, history stability, and **non-collapse** of certified phase distinctions.

## Requirements

1. **`AdmissibleReduction` (or morphism typeclass)** — Data characterizing maps (generator-to-regime or regime-to-regime) that qualify as explanatory reductions for the admissible class `𝓔_adm`. Include at minimum:
   - **Adequacy preservation** across the morphism (types tie to **`SPEC_005_EXR`**).
   - **Phase-invariant preservation** for certified invariants (**`SPEC_007_PIN`**).
   - **History stability / conservativity** along histories (exact statement must align with **`SPEC_008_PSH`**).
   - **Non-collapse**: distinctions certified in the source cannot be silently identified if the target regime is claimed adequate for the same certified structure.

2. **`Reducible` / `¬ Reducible`** — Judgment used in **`SPEC_008_PSH`** for irreducibility of `R_{n+1}` to `R_n` given history and fresh witness phase.

3. **`Explains E G P R`** (or equivalent) — Predicate for **fixed** admissible interface `E` “explaining” the pair `(P, R)` relative to generator `G`, used in summit packaging (**`SPEC_011_SPK`**). Exact arity may bundle parameters; keep stable names for summit theorems.

4. **Encodability / enumerability hook** — Interface sufficient for **`SPEC_009_DST`** to state “`𝓔_adm` admits an effective enumeration” without baking the diagonal into the base definition. Use Mathlib-friendly (`Encodable`, `Countable`, staged indices) patterns.

5. **Anti-triviality documentation** — State explicitly that raw step simulation without invariant constraints is **not** automatically admissible unless the morphism satisfies the preservation clauses.

## Acceptance criteria

- [ ] Admissibility predicates compile and appear in `ParadigmShift` (**`SPEC_008_PSH`**) and diagonal lemmas (**`SPEC_009_DST`**).
- [ ] Summit statements (**`SPEC_011_SPK`**) can quantify over `E : 𝓔_adm` using this file’s types.
- [ ] No circular imports: if needed, split `Reduction.lean` / `ConservativeReduction.lean` per **`SPEC_003_RCT`**.

## Dependencies

- **`SPEC_003_RCT`**, **`SPEC_005_EXR`**, **`SPEC_007_PIN`**.

## Out of scope

- Construction of a concrete `𝓔_adm` until **`SPEC_012_MDL`** / **`SPEC_009_DST`**.
