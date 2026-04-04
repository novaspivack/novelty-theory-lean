# Minimality audit — hypothesis profiles (EPIC_014, SPEC_060_CMI1)

This document tracks **which assumptions are load-bearing** for flagship theorems. Each row should eventually point to a **`theorem` / `lemma`** (weakening, necessity, or countermodel) in `NoveltyTheory/`.

## Legend

| Tag | Meaning |
|-----|---------|
| **N** | Necessary (countermodel or implication failure recorded in Lean) |
| **W** | Weakened variant proved (old \(\Rightarrow\) new recorded) |
| **A** | Proof-route artifact (suspected removable; not yet settled) |
| **R** | Role-specific (needed for the phenomenon, open formal status) |

## Numeric trace layer (`StratifiedFinality`)

| Assumption | Role | Evidence |
|------------|------|----------|
| `X = ℕ` for `FutureDefeat` | **R** | Output comparison via `Nat.lt`; general carriers use separate predicates. |
| `FutureDefeat G` (\(\forall b,\exists t,\ b < \mathrm{trace}(t)\)) | **N** for unbounded-rise style contradictions | `ClosureCollapseBoundary`: negation \(\leftrightarrow\) **uniformly bounded** trace (`ExistsBoundedNumericTrace`). Bounded/constant traces are **countermodels** to `FutureDefeat`. |
| Terminality predicates on **degenerate** families | **W** (saturation of edge cases) | `terminality_eq_zero` shows **satisfiable** bounded predicates independent of dynamics; contrasts strict-rise predicates. |

## Paradigm shift packaged shape (`Core.ParadigmShift`)

| Component | Role | Evidence |
|-----------|------|----------|
| `ConservativeOver H R R'` | **N** for **this** packaged definition | `MinimalHypotheses.paradigmShift_iff_weak_and_conservative`: `ParadigmShift` \(\Leftrightarrow\) `WeakParadigmStep` \(\land\) conservativity. Dropping conservativity leaves a **distinct** weak notion not equivalent to `ParadigmShift`. |
| `prior_inadequate` / `later_adequate` / `not_reducible_back` | **N** for shift **content** | These are **primitive** conjuncts in both weak and strong packages; trivializing them collapses the phenomenon in the intended reading. |

## Output-enumeration / crown witness (`Models.OutputEnumCrownFamily`)

| Assumption | Role | Notes |
|------------|------|--------|
| `outputEnumMem` / list-content vs depth coupling | **R** | Drives strict `ProvesAt` gap; weakening is **EPIC_014** work (`summit_nonfinality_under_weakened_assumptions`). |
| Nontrivial alignment / twin carriers (`Ridge.CrownTransfer`) | **R** | Class transfer uses aligned `Bool × ℕ` twins; minimality of **alignment** predicates is open beyond current lemmas. |

## Naturality-aware ridge (`NaturalAdmissibleInstance`, `BroadTransfer`, etc.)

| Assumption | Role | Notes |
|------------|------|--------|
| `NaturalAdmissibleInstance` constraints | **R** | Documented in [`../../docs/STRENGTHENED_CLAIM_SURFACE.md`](../../docs/STRENGTHENED_CLAIM_SURFACE.md). |
| `NaturalBoundedOrganization` / `NaturalNumericSystem` | **R** | Organization / anti-closure packaging; **minimality** = Phase B/C of EPIC_014. |

## Operational rule

When this file lists **N** or **W**, the same change must add or update a **Lean certificate** and a short **old vs new** comment in the relevant module.

---

_Last updated: EPIC_014 Phase A start._
