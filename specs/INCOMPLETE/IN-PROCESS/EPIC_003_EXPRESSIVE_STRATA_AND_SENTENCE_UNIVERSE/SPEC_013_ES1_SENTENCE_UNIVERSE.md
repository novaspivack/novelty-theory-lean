# SPEC_013_ES1 — Sentence universe (syntax)

**Cite as:** **`SPEC_013_ES1`**.

## Purpose

Define an inductive **`Sentence X`** bridging phase-level facts, trace-level facts, embedded counterfactuals, bounded historical reference, and compositional connectives.

## Requirements

1. Atomic **phase membership** as **`Set X`** membership (same information as **`Phase.outputSet`** in models, universe-correct in Lean).
2. Atomic **trace equality** `trace n = x` (after fix of generator).
3. Embed **`CounterFact.geOutput k`** as a sentence atom (`SPEC_015_ES3` links semantics).
4. Binary **`and` / `or`** (and optional `not` if classical fragment needed later).
5. **Bounded window** or stage-indexed constructors as needed for ridge lemmas (v1: optional; may be added in a follow-up spec revision).

## Acceptance

- `Sentence` is **nontrivial** (at least two distinguishable constructors).
- No semantic predicates smuggled into syntax constructors.

## Lean module

- `NoveltyTheory/Core/Sentence.lean`
