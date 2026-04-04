# SPEC_036_AR1 — Ascent regimes and derivability

**Cite as:** **`SPEC_036_AR1`**.

## Purpose

Introduce (or characterize) a family of **proof regimes** \(R_n\) and a formal **proves** relation \(\vdash\) suitable for **strict iterated ascent**: for each \(n\), \(R_{n+1} \vdash \Phi_n\) while \(R_n \not\vdash \Phi_n\), with \(\Phi_n\) satisfying **`SPEC_035_GS1`**.

The regimes must **connect honestly** to the existing **`ProvesAt`** / Model **C** layer (or justify a generalization with soundness lemmas back to `HoldsAt` / trace semantics).

## Acceptance

1. **Formal regimes:** Lean definitions of `Regime` / `ProvesInRegime` (or re-export of `ProvesAt` indexed by \(n\) with explicit **interpretation** as \(R_n\)) plus **monotonicity** or **extension** lemmas needed for ascent statements.

2. **Soundness bridge:** Theorems tying provability in regime \(n\) to **semantic** facts already established for `natCounter` (or the chosen canonical generator instance), compatible with [`ProvabilityFacts.proves_sentence_sound`](../../../../NoveltyTheory/Foundation/ProvabilityFacts.lean) patterns.

3. **Non-proving side:** Infrastructure for uniform **unprovability** claims at stage \(n\) (e.g. consistency with existing strict-gap lemmas, or new diagonal/obstruction lemmas scoped to the crown family).

4. **Documentation:** Short module docstrings stating how \(R_n\) relates to **strata height**, **organization height**, or other indices—no ambiguity for downstream `SPEC_037_CR1`.

## Lean modules (expected)

- `NoveltyTheory/Foundation` and/or `NoveltyTheory/Models` extensions; minimal surface in `Summits` until `SPEC_037_CR1`.

## Dependencies

- **`SPEC_035_GS1`** complete enough to quantify over \(\Phi_n\) in the structural class.
