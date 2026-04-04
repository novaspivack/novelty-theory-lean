# SPEC_027_RRS1 — Retro structural truths

**Cite as:** **`SPEC_027_RRS1`**.

## Purpose

Sentences that are **history-sensitive** (bounded windows / **historically** fragments) as **RetroStructural** tagged subset of **`Sentence`**.

## Acceptance

- **`IsRetroStructural`** (or equivalent) predicate + **closure** under declared constructors: primitive retro atoms (**`traceEq`**, **`histSeq`**, **`geOutput`**) and **compositional** closure under **`and`**, **`or`**, and **`finConj`** when all subformulas are retro.

## Lean module

- `NoveltyTheory/Core/RetroStructuralTruth.lean`
