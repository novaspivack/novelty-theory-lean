# EPIC_011 — Crown completion (structural ascent, anti-collapse)

**Goal:** Finish the path from **crown v1** (`EPIC_009`) to a **final crown** that resists adversarial collapse to mention-bound / proof-height / `geOutput`-only / nat-encoding artifacts—without reopening **already refuted literal universals**.

**Cite epic as:** **`EPIC_011_CROWN_COMPLETION`**.

**Motivation:** [`docs/007_LIBRARY_POSITIONING_ASSESSMENT.md`](../../../../docs/007_LIBRARY_POSITIONING_ASSESSMENT.md); [`docs/CROWN_POSITIONING.md`](../../../../docs/CROWN_POSITIONING.md).

**Depends on:** **`EPIC_003`**–**`EPIC_010`** complete; baseline summit and crown v1 theorems listed under each **`SPEC_042`**–**`SPEC_047`**.

**Status:** **In progress** — **`SPEC_042_CG1`** Lean + docs landed; **`SPEC_043_CG2`**–**`SPEC_047_CG6`** remain.

---

## Mission (target shape)

A theorem package equivalent in content to: there exist **\(G\)** and **\((\Phi_n)\)** such that for all **\(n\)**,

- **\(\Phi_n\)** is a **structural truth about** **\(G\)** (certified predicate, not smuggled),
- **\(R_{n+1} \vdash \Phi_n\)** (via **`ProvesAt` / `ProvesInRegime`** linkage),
- **\(R_n \not\vdash \Phi_n\)**,  

plus packaging: **no fixed final explanatory/proof-theoretic stratum**, **future defeat of terminality**, **stronger organization obstruction**—**exactly** as bounded in Lean (no literal blocked universals).

**Quality bar:** the witness family must be **structurally stronger**, not rhetorically stronger.

---

## Hard boundaries (non-negotiable)

### Do **not** treat as positive goals

1. A **literal universal** diagonal over **all** raw **`AdmissibleInterface`** (`trivialInterface` / soundness obstruction).
2. A **literal infinite** paradigm chain for **every** **`RegimeFamilySingletonWithin`** family (`emptyRegime` obstruction).

These remain **documentation / paper boundary** material only ([`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md), [`docs/CROWN_POSITIONING.md`](../../../../docs/CROWN_POSITIONING.md)).

### Do **not** claim crown completion until dismissal is blocked

The final package must **not** be reasonably dismissible as **only**:

- `mentionBound`,
- current proof depth alone,
- the old **`geOutput`** family with nicer prose,
- trace-only encoding,
- singleton-ladder **organization** re-export without strictly stronger bundled predicates.

---

## Definition of done (epic-level)

1. Theorem family: **strict ascent** with **structural** certification about the generator.
2. Witness family **≠** trace-only ridge artifact; **≠** mere restatement of current `mentionBound` behavior alone.
3. **At least one** crown witness family **not** extensionally the **`geOutput`** family.
4. **Sentence/provability** layer **and** **organization** layer both appear in the **final** package.
5. [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) + [`docs/CROWN_DEPENDENCY_MAP.md`](../../../../docs/CROWN_DEPENDENCY_MAP.md) state **exactly** what the crown proves and what it does **not**.
6. **No new axioms**, **no `sorry`**, **`lake build` green**.

---

## Theory specs (execute in order)

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_042_CG1`**](SPEC_042_CG1_STRUCTURAL_SENTENCE_CROWN.md) | Structural sentence crown: non-`geOutput` witness family, anti-collapse vs trace-only / mention-bound |
| 2 | [**`SPEC_043_CG2`**](SPEC_043_CG2_OUTPUTENUM_PROVABILITY_AND_FINITE_WITNESS.md) | `outputEnumMem` / finite-output **proof** role; soundness/mono; crown witness using enum layer |
| 3 | [**`SPEC_044_CG3`**](SPEC_044_CG3_POLYMORPHIC_PHASE_AND_FINSET_OUTPUT_LAYER.md) | Polymorphic / finset-grade layer; faithful embed; port at least one strict-ascent witness |
| 4 | [**`SPEC_045_CG4`**](SPEC_045_CG4_STRONG_ORGANIZATION_PREDICATES.md) | **Organization V2** + height obstruction; strictly stronger than v1 singleton template |
| 5 | [**`SPEC_046_CG5`**](SPEC_046_CG5_RETRO_STRUCTURAL_REVELATION_V2.md) | Retro structural **v2**: earlier-history truths feeding crown |
| 6 | [**`SPEC_047_CG6`**](SPEC_047_CG6_FINAL_CROWN_PACKAGE.md) | **FinalCrownPackage** summit + crown docs; adversarial-readiness gate |

---

## Operational rules (agents)

1. **Order:** specs **042 → 047**. **Do not** start **`SPEC_047`** before **042–046** meet acceptance or record **formal obstruction** with redesign path.
2. **Inventory:** every new **`theorem` / `lemma`** → row in [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) **same commit**.
3. **Imports:** new modules → [`NoveltyTheory/All.lean`](../../../../NoveltyTheory/All.lean); **`lake build`** required.
4. **Failure:** formalize **obstruction**; **no handwaving**.
5. **Prefer** strengthening **existing** predicates/classes over summit-only wrappers (unless packaging is a named re-export with **no** logical weakening).
6. **No new axioms. No `sorry`.** Do **not** weaken existing theorems to green the build.
7. **Blocked universals:** never as positive goals; keep boundary explicit in docs.
8. **Base models:** use **`natCounter`**, **`canonicalTower`**, **`dupRegime`**, **`natCounterProd`** before inventing carriers; new base model **only** if an explicit anti-collapse or organization theorem **requires** it.
9. **Summit theorems:** **exact Lean name**, one-sentence informal content, direct dependencies, interpretation boundary (module docstring minimum).
10. **Adversarial bar:** for each candidate crown theorem, check: **only `geOutput`?** **only `mentionBound`?** **only proof-height?** **only nat-encoding?** If **yes** is plausible, **not** crown-grade—iterate.

---

## Living progress

| Phase | Spec | Status |
|------:|------|--------|
| 1 | `SPEC_042_CG1` | **Phase 1 complete** (structural conjunction witness + summit; inventory + crown docs) |
| 2 | `SPEC_043_CG2` | **Not started** |
| 3 | `SPEC_044_CG3` | **Not started** |
| 4 | `SPEC_045_CG4` | **Not started** |
| 5 | `SPEC_046_CG5` | **Not started** |
| 6 | `SPEC_047_CG6` | **Not started** |

---

## Deliverables checklist

### Lean (mandatory by epic closure)

- Structural crown witness family (non-`geOutput` path per **`SPEC_042`**).
- Finite-output / `outputEnumMem` proof-theoretic role (**`SPEC_043`**).
- Polymorphic or finset-grade port (**`SPEC_044`**).
- Stronger organization obstruction (**`SPEC_045`**).
- Retro structural v2 feeding crown (**`SPEC_046`**).
- **Final** crown package (**`SPEC_047`**).

### Docs (mandatory by epic closure)

- Updated [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md)
- [`docs/CROWN_DEPENDENCY_MAP.md`](../../../../docs/CROWN_DEPENDENCY_MAP.md)
- [`docs/CROWN_POSITIONING.md`](../../../../docs/CROWN_POSITIONING.md)
- Updated [`MANIFEST.md`](../../../../MANIFEST.md)
- Updated [`docs/004_LEAN_LIBRARY_LAYOUT.md`](../../../../docs/004_LEAN_LIBRARY_LAYOUT.md) if module graph changes

### Validation

- `lake build`
- Zero `sorry`; zero new axioms
- [`QUEUE.md`](../../../../QUEUE.md) + this orchestration + [`MASTER_STATUS.md`](../../../MASTER_STATUS.md) reconciled

---

## Cross-links

- [`../../../MASTER_STATUS.md`](../../../MASTER_STATUS.md)
- [`../../../../QUEUE.md`](../../../../QUEUE.md)
