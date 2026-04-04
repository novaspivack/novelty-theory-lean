# SPEC_062_CMI3 — Sharp dichotomy for final closure

**ID:** **`SPEC_062_CMI3`**  
**Epic:** **`EPIC_014_CANONICALITY_MINIMALITY_AND_INEVITABILITY`**

## Goal

Separate systems that admit **final explanatory closure** from those that cannot—preferably **iff** a **collapse condition**, or a proved **partial** characterization.

## Preferred shape

\[
\mathrm{FinalClosure}(G) \iff \mathrm{CollapseCondition}(G)
\]

**Acceptable:** one-way implications packaging a **boundary** (collapse \(\Rightarrow\) closure; non-collapse \(\Rightarrow\) non-finality).

## Required artifacts

| Path | Role |
|------|------|
| [`NoveltyTheory/Core/ClosureDichotomy.lean`](../../../../NoveltyTheory/Core/ClosureDichotomy.lean) | Predicates; reusable definitions |
| [`NoveltyTheory/Ridge/ClosureCollapseBoundary.lean`](../../../../NoveltyTheory/Ridge/ClosureCollapseBoundary.lean) | Proved boundary lemmas |
| [`NoveltyTheory/Summits/ClosureDichotomySummit.lean`](../../../../NoveltyTheory/Summits/ClosureDichotomySummit.lean) | Packaged summit re-exports |

## Theorem targets

- `final_closure_iff_collapse_condition` (if earned)
- `collapse_condition_implies_no_strict_ascent_failure` or equivalent
- `noncollapse_forces_nonfinality`
- `closure_dichotomy_for_natural_class`

## First landed lemma (numeric trace; epic scope for `SPEC_062`)

`FutureDefeat G ∨ (∃ B, ∀ t, G.trace t ≤ B)` — **unbounded output recurrence** vs **uniformly bounded observable trace** (`Ridge/ClosureCollapseBoundary.lean`). This is a **sharp boundary** at the **numeric trace** layer, not the full crown package.

## Acceptance

- Explains **why** finality fails when it fails (not only that a witness exists).
- Collapse predicates are **not** narrowly tautological.

## Status

**Closed for epic scope (numeric trace boundary)** — `Ridge.ClosureCollapseBoundary` proves `not_futureDefeat_iff_existsBoundedNumericTrace` and `futureDefeat_or_existsBoundedNumericTrace` (summit: `Summits.ClosureDichotomySummit`). **Regime-level** packaged finality \(\leftrightarrow\) collapse (**not** claimed); further lift is outside **`EPIC_014`** unless a new spec is opened.
