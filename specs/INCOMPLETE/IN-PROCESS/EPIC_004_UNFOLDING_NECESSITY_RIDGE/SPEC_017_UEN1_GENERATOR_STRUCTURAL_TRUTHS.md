# SPEC_017_UEN1 — Generator structural truths

**Cite as:** **`SPEC_017_UEN1`**.

## Purpose

Identify **generator-structural** sentences (trace-aligned atoms) and prove they **`HoldsAt`** `natCounter` when the trace identity holds.

## Acceptance

- At least **`traceEq n n`** (on `ℕ`) is packaged as **structural** with a **`HoldsAt`** lemma.

## Lean module

- `NoveltyTheory/Core/GeneratorTruth.lean`
