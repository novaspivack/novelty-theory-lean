# SPEC_042_CG1 — Structural sentence crown

**Cite as:** **`SPEC_042_CG1`**.

## Purpose

Close the main gap between **crown v1** (`geOutput`-centred **`CrownIteratedAscentSummit`**) and a **true structural crown**: a strict **`ProvesAt`** ascent family **\((\Phi_n)\)** certified by a **structural-about-generator** predicate, such that the family is **not**:

- the trace-only ridge fragment alone,
- reducible to **`mentionBound`** bookkeeping alone,
- disguise-equivalent to **`Sentence.geOutput n`** for all **\(n\)**.

## Hard boundaries

- Do **not** pursue **literal universal** diagonal over all raw **`AdmissibleInterface`**.
- Do **not** pursue **literal universal** infinite paradigm chain for all **`RegimeFamilySingletonWithin`** families.
- If the strongest honest witness in this spec still collapses on adversarial analysis, **record obstruction** in-repo and **redesign** before claiming **`SPEC_042`** complete.

## Starting platform (treat as done; do not re-prove)

- [`Foundation/StructuralGeneratorSentence.lean`](../../../../NoveltyTheory/Foundation/StructuralGeneratorSentence.lean)
- [`Foundation/AscentRegime.lean`](../../../../NoveltyTheory/Foundation/AscentRegime.lean)
- [`Summits/CrownIteratedAscentSummit.lean`](../../../../NoveltyTheory/Summits/CrownIteratedAscentSummit.lean)
- [`Summits/SummitPackages.lean`](../../../../NoveltyTheory/Summits/SummitPackages.lean) (Summits I–IV packaging)
- [`Summits/UnfoldingNecessitySummit.lean`](../../../../NoveltyTheory/Summits/UnfoldingNecessitySummit.lean)

## Required new modules

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Foundation/StructuralCrownSentence.lean` | Predicates / lemmas certifying **crown-grade** structural sentences (may **extend** `IsStructuralGeneratorSentence` honestly) |
| `NoveltyTheory/Models/StructuralCrownFamily.lean` | Witness family **\(\Phi_n\)**, **`ProvesAt`** strict gap, **`HoldsAt natCounter`** linkage |
| `NoveltyTheory/Summits/StructuralCrownSummit.lean` | Named summit exports |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `exists_structural_sentence_provable_succ_not_at` | **∃** structural-certified **φ** with **`ProvesAt (n+1) φ ∧ ¬ ProvesAt n φ`** |
| `structural_sentence_strict_ascent_at` | Pointwise packaged strict ascent for the chosen **\(\Phi_n\)** |
| `structural_sentence_crown_family` | **∃G ∃Φ ∀n** packaging (strongest honest generality; same discipline as crown v1) |
| `structural_crown_refines_bare_provable_gap` | Refines naked existential gap (sentence-level) with **structural** certification |
| `structural_crown_not_traceEq_ridge_only` | **Anti-collapse:** not subsumed by **`IsGeneratorStructural`** / trace-diagonal-only story |
| `structural_crown_not_mentionBound_only` | **Anti-collapse:** **≠** “only `mentionBound` stratification” (formalize as named lemma(s) per chosen witness) |

## Required mathematical content

1. Define **\(\Phi_n\)** (or parametric family) with **`IsStructuralGeneratorSentence`** or a **documented strengthening** **`StructuralCrownSentence`-style** predicate that **does not** smuggle the theorem.
2. Prove **`ProvesAt (n+1) (Φ n)`** and **`¬ ProvesAt n (Φ n)`** (or **`ProvesInRegime`** spelling).
3. Prove **`HoldsAt natCounter (Φ n)`** (or fixed canonical **\(G\)** spelled in the theorem).
4. Prove **witness family is not** extensionally **`geOutput`** (or prove definitional disequality / **∀n, Φ n ≠ geOutput n** / **non-existence** of uniform bijection—choose the **strongest honest** formulation).

## Acceptance test

**Fails** if the only witness is **`Sentence.geOutput n`** up to provable reordering/reindexing **or** if adversarial collapse lemmas are missing:

- **not** trace-only,
- **not** “**mentionBound** only” (must cite named **`structural_crown_not_mentionBound_only`** or stronger).

## Dependencies

- **`SPEC_035_GS1`** through crown v1; **`SPEC_033_K7A`** sentence stack.

## Status

**Complete** — [`Foundation/StructuralCrownSentence.lean`](../../../../NoveltyTheory/Foundation/StructuralCrownSentence.lean), [`Models/StructuralCrownFamily.lean`](../../../../NoveltyTheory/Models/StructuralCrownFamily.lean), [`Summits/StructuralCrownSummit.lean`](../../../../NoveltyTheory/Summits/StructuralCrownSummit.lean); anti-collapse lemmas and inventory rows under `StructuralCrownSummit` / `THEOREM_INVENTORY.md`; `EPIC_011` closed with **`SPEC_043`–`SPEC_047`** in the same program.
