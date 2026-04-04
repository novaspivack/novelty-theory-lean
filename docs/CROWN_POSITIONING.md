# Crown positioning (novelty-theory-lean)

**Purpose:** State what **crown** theorems in this library **do** and **do not** claim—without pointing readers at internal spec paths in external prose. For development, normative execution lives under **`EPIC_011_CROWN_COMPLETION`** (`specs/INCOMPLETE/IN-PROCESS/EPIC_011_CROWN_COMPLETION/`).

## What is proved (honest scope)

- **Crown v1 (`EPIC_009`):** On **`natCounter`**, the family **`Sentence.geOutput n`** is **`IsStructuralGeneratorSentence`**, has a strict **`ProvesAt (n+1)`** vs **`¬ ProvesAt n`** gap, and is **not** the trace-only ridge class **`IsGeneratorStructural`**. Packaging: **`CrownIteratedAscentSummit`**, **`SummitPackages`**.
- **Structural crown witness (`SPEC_042_CG1`, landed):** **`structuralCrownWitness n` := `Sentence.and (geOutput n) (traceEq n n)`** is still structurally certified, satisfies the same strict ascent pattern, is **not** definitionally **`geOutput`**, is **not** a pure **`IsGeneratorStructural`** atom, and shares **`mentionBound`** with **`geOutput n`**—so the ascent is not “pick **`geOutput`** by stratum alone.” See **`Summits.StructuralCrownSummit`**.
- **Organization frontier v1 (`EPIC_010`):** Separation templates on **`natCounter`** (parity, total-future predicate, constant-stage obstruction). See **`OrganizationFrontierSummit`**.
- **Finite-output / enum proof role (`SPEC_043_CG2`, landed):** **`outputEnumMem`** participates in **`ProvesAt`** with soundness/monotone packaging; **`outputEnumCrownWitness`** yields strict ascent on **`natCounter`** while staying off the **`geOutput`** / singleton-phase disjointness tracks documented in **`Models.OutputEnumCrownFamily`**.
- **Polymorphic carrier (`SPEC_044_CG3`, landed):** Conservative **`sentencePolyEmbed`** into **`Sentence (Unit × ℕ)`** with full semantic **`HoldsAt` / `HoldsAtProd`** alignment between **`natCounter`** and **`prodNatCounter`**, **`provesAt_poly_phase_sound`**, and a strict **`ProvesAtPoly`** crown pullback. See **`Foundation.PhaseSyntaxPolyFacts`** and **`Models.PolymorphicPhaseCrown`**.
- **Organization V2 + height obstruction (`SPEC_045_CG4`, landed):** **`Core.OrganizationV2`** bundles separated stage labeling with optional finite height; **`Ridge.OrganizationHeightObstruction`** shows no such bounded map **totalizes** all strict **`ℕ`** futures internally, and pairs the phenomenon with **`finite_signature_cannot_organize_full_ladder`**. **`Summits.OrganizationCrownSummit`** links this to structural strict ascent.
- **Retro structural v2 (`SPEC_046_CG5`, landed):** **`Foundation.RetroStructuralTruthV2`** classifies diagonal **initial-segment** **`histSeq`** bundles; **`histSeqUpto`** has earlier-segment **`HoldsAt`** content, strict **`ProvesAt`** ascent, and explicit non-collapse vs **`mentionBound`**-only readings (**`Ridge.RetroStructuralGap`** + **`Summits.RetroStructuralCrownSummit`**).
- **Final integrative package (`SPEC_047_CG6`, landed):** **`Summits.FinalCrownPackage`** bundles structural **`∃G ∃Φ ∀n`**, scoped “no fixed stratum” packaging (**`regimeUpto`** + organization height), **`FutureDefeat`**, generator-truth linkage, and an enum-layer gap re-export—with explicit **interpretation boundaries** in the module docstring.

## What is not claimed (boundaries)

- **No literal universal** over **all** raw **`AdmissibleInterface`** values for a uniform diagonal (“everything is irregular”). Refuted by the trivial interface (`trivialInterface_rows_claim_everything` and related lemmas). Honest packaging uses **`SignatureAdmissibleInterface`** / bundled rows.
- **No literal infinite paradigm chain** for **every** **`RegimeFamilySingletonWithin`** family. Refuted by the empty regime tower. Use **scoped** regime classes or **existential** tower witnesses.
- **Crown theorems are proof-theoretic relative to the defined **`ProvesAt`** calculus** (Model **C** depth). They are **not** independence claims in arbitrary external logics unless you import those separately.

## “Final crown” interpretation note

The **`FinalCrownPackage`** summit is **scoped**: it **does not** resurrect blocked **literal universals** (raw **`AdmissibleInterface`** diagonals, infinite paradigm chains for every **`RegimeFamilySingletonWithin`** family). Those remain **inventory / boundary** anchors as above.

## Where to read dependencies

See [`CROWN_DEPENDENCY_MAP.md`](CROWN_DEPENDENCY_MAP.md) and the theorem catalog [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md).

---

_Update this file when **`EPIC_011`** acceptance changes or when final crown theorems land._
