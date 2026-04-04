# SPEC_043_CG2 — Output-enum provability and finite witness

**Cite as:** **`SPEC_043_CG2`**.

## Purpose

Ensure the crown **cannot** rest only on the thin constructor fragment that dominated v1. **`outputEnumMem`** must gain a **serious proof-theoretic role**: either **positive `ProvesAt` rules** with full **soundness** / **monotonicity**, or a **proved impossibility** theorem explaining why the current calculus cannot support it—followed by an **honest extension** of **`ProvesAt`** and **re-proved soundness**.

**Forbidden end state:** semantically meaningful **`outputEnumMem`** with **`ProvesAt := False`** forever and no obstruction theorem.

## Hard boundaries

- Same **blocked universals** as **`EPIC_011`** orchestration.
- **No `sorry`.** **No new axioms.**

## Starting platform

- [`Core/Sentence.lean`](../../../../NoveltyTheory/Core/Sentence.lean) (**`outputEnumMem`**)
- [`Foundation/RichSentenceSyntax.lean`](../../../../NoveltyTheory/Foundation/RichSentenceSyntax.lean)
- [`Models/SentenceProvability.lean`](../../../../NoveltyTheory/Models/SentenceProvability.lean)

## Required new modules

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Foundation/OutputEnumProvability.lean` | Rules / soundness / monotonicity / obstruction documentation |
| `NoveltyTheory/Models/OutputEnumCrownFamily.lean` | Strict-ascent witness family using **enum** or finite-output machinery |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `provesAt_outputEnumMem_sound` | **`ProvesAt m (outputEnumMem …)` ⇒ `HoldsAt natCounter …`** under chosen rules |
| `provesAt_outputEnumMem_mono` | Monotonicity in **m** for the **outputEnumMem** fragment (as applicable) |
| `exists_outputEnumMem_provable_gap` | **∃** enum witness with strict **`ProvesAt`** step |
| `outputEnumMem_crown_family` | **∃G ∃Φ** with **Φ** using **`outputEnumMem`** (or finite-output derivative) **non-vacuously** |
| `outputEnumMem_not_phaseSingleton_abbrev` | **Anti-collapse:** not mere abbreviation of **`phaseMem (singleton x)`** story |
| `outputEnumMem_not_geOutput_abbrev` | **Anti-collapse:** not **`geOutput`** in disguise |

## Required content

1. **Replace** or **extend** the current **`ProvesAt`** clause for **`outputEnumMem`** (`False` is **not** acceptable as **final** state without **impossibility + extension** sequence).
2. Update [`Foundation/SentenceFacts.lean`](../../../../NoveltyTheory/Foundation/SentenceFacts.lean) **`mentionBound_le_of_proves`**, [`Foundation/ProvabilityFacts.lean`](../../../../NoveltyTheory/Foundation/ProvabilityFacts.lean) **`proves_sentence_sound`**, and **all** **`ProvesAt`** pattern matches affected.
3. Construct a **nontrivial** crown witness family where **`outputEnumMem`** (or a **finset-grade** successor defined here or in **`SPEC_044`**) does **real logical work** in the strict-ascent chain.

## Acceptance test

A **hostile** reader sees **non-trivial** proof rules **or** a **formal no-go** + **successor calculus**—not perpetual **`False`** with semantics-only existence.

## Dependencies

- **`SPEC_042_CG1`** should not **require** this spec for a minimal structural family, but **`EPIC_011` final crown** **requires** this spec’s acceptance for **finite-output / enum** credibility.

## Status

**Not started** — execute after **`SPEC_042_CG1`** unless a documented dependency forces partial overlap (reconcile in orchestration).
