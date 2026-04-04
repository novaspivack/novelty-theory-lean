# SPEC_016_ES4 — Non-collapse witnesses

**Cite as:** **`SPEC_016_ES4`**.

## Purpose

Prove strata are **not** definitional trivialities: explicit **`∃ φ`** such that expressibility or provability **fails** at height **`h`** and **holds** at **`h + 1`** (or analogous strict gap), with **`HoldsAt`** / soundness reading intact on `natCounter`.

## Required shapes (at least one family each)

- **`exists_sentence_expressible_succ_not_at`**
- **`exists_sentence_provable_succ_not_at`** (for the formalized provability fragment)

## Anti-smuggling

Expressibility must be tied to **literal / structural bounds** on `φ`, not an oracle predicate that encodes the conclusion.

## Lean module

- `NoveltyTheory/Models/StratifiedSentenceModel.lean`
