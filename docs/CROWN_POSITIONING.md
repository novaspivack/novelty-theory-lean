# Crown positioning (novelty-theory-lean)

**Purpose:** State what **crown** theorems in this library **do** and **do not** claim—without pointing readers at internal spec paths in external prose. For development, normative execution lives under **`EPIC_011_CROWN_COMPLETION`** (`specs/INCOMPLETE/IN-PROCESS/EPIC_011_CROWN_COMPLETION/`).

## What is proved (honest scope)

- **Crown v1 (`EPIC_009`):** On **`natCounter`**, the family **`Sentence.geOutput n`** is **`IsStructuralGeneratorSentence`**, has a strict **`ProvesAt (n+1)`** vs **`¬ ProvesAt n`** gap, and is **not** the trace-only ridge class **`IsGeneratorStructural`**. Packaging: **`CrownIteratedAscentSummit`**, **`SummitPackages`**.
- **Structural crown witness (`SPEC_042_CG1`, landed):** **`structuralCrownWitness n` := `Sentence.and (geOutput n) (traceEq n n)`** is still structurally certified, satisfies the same strict ascent pattern, is **not** definitionally **`geOutput`**, is **not** a pure **`IsGeneratorStructural`** atom, and shares **`mentionBound`** with **`geOutput n`**—so the ascent is not “pick **`geOutput`** by stratum alone.” See **`Summits.StructuralCrownSummit`**.
- **Organization frontier v1 (`EPIC_010`):** Separation templates on **`natCounter`** (parity, total-future predicate, constant-stage obstruction). See **`OrganizationFrontierSummit`**.

## What is not claimed (boundaries)

- **No literal universal** over **all** raw **`AdmissibleInterface`** values for a uniform diagonal (“everything is irregular”). Refuted by the trivial interface (`trivialInterface_rows_claim_everything` and related lemmas). Honest packaging uses **`SignatureAdmissibleInterface`** / bundled rows.
- **No literal infinite paradigm chain** for **every** **`RegimeFamilySingletonWithin`** family. Refuted by the empty regime tower. Use **scoped** regime classes or **existential** tower witnesses.
- **Crown theorems are proof-theoretic relative to the defined **`ProvesAt`** calculus** (Model **C** depth). They are **not** independence claims in arbitrary external logics unless you import those separately.

## Target “final crown” (`SPEC_047_CG6`, not complete until epic closure)

The **final** package is intended to combine: structural iterated ascent (non-collapsible to **`geOutput`**-only / **`mentionBound`**-only readings where the formal anti-collapse lemmas apply), **finite-output / enum** proof role (**`SPEC_043`**), polymorphic or finset-grade layer (**`SPEC_044`**), **stronger bundled organization** (**`SPEC_045`**), **retro structural v2** (**`SPEC_046`**), and an integration summit with explicit dependency boundaries.

## Where to read dependencies

See [`CROWN_DEPENDENCY_MAP.md`](CROWN_DEPENDENCY_MAP.md) and the theorem catalog [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md).

---

_Update this file when **`EPIC_011`** acceptance changes or when final crown theorems land._
