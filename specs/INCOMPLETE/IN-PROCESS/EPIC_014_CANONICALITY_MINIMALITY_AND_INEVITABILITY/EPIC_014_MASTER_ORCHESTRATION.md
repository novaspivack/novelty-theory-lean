# EPIC_014 — Canonicality, minimality, and inevitability

**Cite epic as:** **`EPIC_014_CANONICALITY_MINIMALITY_AND_INEVITABILITY`**.

**Goal:** Move beyond **existence + transfer + naturality-aware strengthening** toward showing that crown-style phenomena are **close to unavoidable** under **weak canonical** conditions: **minimal hypotheses**, **canonical architecture**, and **sharp closure / non-closure boundaries**—with **honest** limits where universal claims fail.

**Depends on:** **`EPIC_011`–`EPIC_013` complete** (crown completion, generalized crown, naturality / broad transfer / anti-closure); base theorems remain the floor.

**Status:** **In progress** — **`SPEC_060_CMI1`** opened (minimality audit + countermodel layer); **`SPEC_061`–`SPEC_064`** queued.

---

## Strategic gap

| Current strength | Remaining criticism |
|------------------|---------------------|
| Strong witnesses + class transfer + explicit predicates | Hypotheses might still look like one especially effective architecture |

**Target:** Earn **near-necessity**, **normal-form / representation**, or **dichotomy** theorems—never asserted before proved.

---

## North-star shapes (paper-level; quantifiers must match Lean)

- **Target A (canonical inevitability):** weak canonical conditions \(\Rightarrow\) no final closure \(\land\) unbounded ascent.
- **Target B (disjunctive inevitability):** \(\Rightarrow\) no final closure \(\lor\) unbounded ascent.
- **Target C (dichotomy):** final closure \(\leftrightarrow\) sharp collapse condition.

Prefer **C** when full **A** is unreachable.

---

## Phase plan

| Phase | Focus | Specs |
|-------|--------|------|
| **A** | Minimality analysis: necessary vs ornamental hypotheses; weakenings + countermodels | **`SPEC_060_CMI1`** |
| **B** | Canonicality of explanatory architecture (representation / embedding) | **`SPEC_061_CMI2`** |
| **C** | Sharp closure / non-closure dichotomy | **`SPEC_062_CMI3`** |
| **D** | Universal upward necessity attempt or formal obstruction | **`SPEC_063_CMI4`** |
| **E** | Paper + inventory upgrade (only when earned) | **`SPEC_064_CMI5`** |

---

## Theory specs (execute in order)

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_060_CMI1`**](SPEC_060_CMI1_MINIMAL_HYPOTHESES_AUDIT.md) | Audit; weakenings; countermodels; `MINIMALITY_AUDIT.md` |
| 2 | [**`SPEC_061_CMI2`**](SPEC_061_CMI2_CANONICALITY_OF_EXPLANATORY_ARCHITECTURE.md) | Weak architecture; representation toward generator/regime/truth |
| 3 | [**`SPEC_062_CMI3`**](SPEC_062_CMI3_SHARP_DICHOTOMY_FOR_FINAL_CLOSURE.md) | Collapse ↔ closure boundary (honest predicates) |
| 4 | [**`SPEC_063_CMI4`**](SPEC_063_CMI4_UNIVERSAL_UPWARD_NECESSITY_ATTEMPT.md) | Strongest upward-necessity claim or obstruction package |
| 5 | [**`SPEC_064_CMI5`**](SPEC_064_CMI5_PAPER_UPGRADE_TO_STRONGEST_CLAIM_SURFACE.md) | LaTeX + docs only after theorems land |

---

## Operational rules (non-negotiable)

1. No witness proliferation unless it serves minimality or canonicality.
2. Weaken a hypothesis \(\Rightarrow\) record **old vs new** statement in spec + Lean comment block.
3. Necessity \(\Rightarrow\) prefer **countermodel** or **proved implication failure** over prose.
4. Prefer **characterization / dichotomy** over another “there exists” summit unless the latter strictly sharpens the boundary.
5. Universal claim fails \(\Rightarrow\) ship **obstruction** as formal content.
6. **No paper headline upgrade** until **`SPEC_064`** acceptance is met with cited `theorem`s.
7. Trust-boundary discipline: reduce setup-dependence **honestly**, not by overstating quantifiers.

---

## Definition of done (epic-level)

1. **`SPEC_060`–`SPEC_063`:** acceptance criteria met or explicitly **closed with obstruction** documents in Lean + [`NoveltyTheory/docs/MINIMALITY_AUDIT.md`](../../../../NoveltyTheory/docs/MINIMALITY_AUDIT.md) / [`docs/CANONICALITY_POSITIONING.md`](../../../../docs/CANONICALITY_POSITIONING.md) / [`docs/CLOSURE_DICHOTOMY_MAP.md`](../../../../docs/CLOSURE_DICHOTOMY_MAP.md).
2. **`SPEC_064`:** paper + [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) updated; every strengthened prose line cites a declaration.
3. [`NoveltyTheory/All.lean`](../../../../NoveltyTheory/All.lean) imports new modules.
4. Roll-ups: [`docs/000_INDEX.md`](../../../../docs/000_INDEX.md), [`specs/MASTER_STATUS.md`](../../../MASTER_STATUS.md), [`QUEUE.md`](../../../../QUEUE.md).

---

_Last updated: EPIC_014 scaffold + Phase A open (2026-04-04)._
