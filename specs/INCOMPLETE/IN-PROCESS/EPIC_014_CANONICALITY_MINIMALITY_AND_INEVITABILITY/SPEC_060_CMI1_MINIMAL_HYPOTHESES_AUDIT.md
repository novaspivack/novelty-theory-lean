# SPEC_060_CMI1 — Minimal hypotheses audit

**ID:** **`SPEC_060_CMI1`**  
**Epic:** **`EPIC_014_CANONICALITY_MINIMALITY_AND_INEVITABILITY`**

## Goal

Audit major summit families: classify assumptions as **necessary**, **proof-route artifact**, or **weakenable**. Deliver **positive weakenings** where proved and **countermodels** where an assumption cannot be dropped.

## Required artifacts

| Artifact | Purpose |
|----------|---------|
| [`NoveltyTheory/docs/MINIMALITY_AUDIT.md`](../../../../NoveltyTheory/docs/MINIMALITY_AUDIT.md) | Theorem \(\leftrightarrow\) hypothesis matrix; old vs new statements |
| [`NoveltyTheory/Core/MinimalHypotheses.lean`](../../../../NoveltyTheory/Core/MinimalHypotheses.lean) | Bundles; weakenings; `WeakParadigmStep` vs `ParadigmShift` |
| [`NoveltyTheory/Ridge/MinimalityCountermodels.lean`](../../../../NoveltyTheory/Ridge/MinimalityCountermodels.lean) | Obstructions: trivial/bounded dynamics; bounded trace |

## Theorem targets (names may evolve; meanings fixed)

| Target | Intent |
|--------|--------|
| `summit_nonfinality_under_weakened_assumptions` | Non-finality with explicit weakened side conditions |
| `crown_ascent_under_weakened_ascent` | Ascent under parallel weakening |
| `countermodel_without_history_conservativity` | Failure when conservativity dropped from packaged paradigm step (formal sense TBD in audit) |
| `countermodel_without_nontriviality` | Bounded/constant trace \(\Rightarrow\) no `FutureDefeat`-style unbounded rise |
| `minimal_assumption_barrier_for_crown` | Aggregated minimal profile linking to flagship proofs |

## Acceptance

- Paper-ready **minimal hypothesis profile** per flagship family (audit doc).
- At least **one** genuine weakening recorded with **old vs new** Lean statements.
- At least **two** assumptions shown **necessary** via proved countermodels or sharp implication (not intuition only).

## Failure mode

Prose-only “minimality” without `theorem` / `lemma` or explicit counterexamples.

## Status

**In progress (Phase A v1 shipped)** — [`MINIMALITY_AUDIT.md`](../../../../NoveltyTheory/docs/MINIMALITY_AUDIT.md), `WeakParadigmStep`, `paradigmShift_iff_weak_and_conservative`, numeric countermodels (`FutureDefeat` failure), and `minimal_assumption_barrier_for_crown` (numeric dichotomy) are in-tree. Remaining: additional summit-specific weakenings; concrete **`countermodel_without_history_conservativity`** witness (see [`docs/005_TODO_REGISTRY.md`](../../../../docs/005_TODO_REGISTRY.md) **EPIC014-T1**).
