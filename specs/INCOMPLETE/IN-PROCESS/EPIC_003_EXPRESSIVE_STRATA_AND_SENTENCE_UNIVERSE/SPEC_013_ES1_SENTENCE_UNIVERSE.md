# SPEC_013_ES1 — Sentence universe (syntax)

**Cite as:** **`SPEC_013_ES1`**.

## Purpose

Define an inductive **`Sentence X`** bridging phase-level facts, trace-level facts, embedded counterfactuals, bounded historical reference, and compositional connectives.

## Requirements

1. Atomic **phase membership** as **`Set X`** membership (same information as **`Phase.outputSet`** in models, universe-correct in Lean).
2. Atomic **trace equality** `trace n = x` (after fix of generator).
3. **Bounded trace bundles** via **`histSeq`** (finite list of stage/output pairs).
4. **Finitely named nat phase tags** via **`natPhaseTagMem`** and **`NatPhaseTag`**.
5. **Finite conjunction** / explicit bounded “∀” via **`finConj`** over a list of subformulas.
6. Embed **`CounterFact.geOutput k`** as a sentence atom (`SPEC_015_ES3` links semantics).
7. Binary **`and` / `or`** and unary **`not`** in the stratified classical fragment.
8. **Bounded window** obligation for ridge lemmas is satisfied in tranche 1 by **`histSeq`** + **`finConj`**; further stage-indexed sugar remains optional.

## Acceptance

- `Sentence` is **nontrivial** (at least two distinguishable constructors).
- No semantic predicates smuggled into syntax constructors.

## Lean module

- `NoveltyTheory/Core/Sentence.lean`
