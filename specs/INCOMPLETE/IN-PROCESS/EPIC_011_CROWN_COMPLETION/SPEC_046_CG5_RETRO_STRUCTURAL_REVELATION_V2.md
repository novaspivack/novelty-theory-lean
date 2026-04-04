# SPEC_046_CG5 — Retro structural revelation v2

**Cite as:** **`SPEC_046_CG5`**.

## Purpose

Upgrade **retro** machinery from **same-calculus depth shift** (v1 **`IsRetroStructural`**, cross-depth gaps) to **structurally classified truths about earlier trace history** that:

- **hold** of the generator,
- are **not** provable at the **earlier** relevant stratum,
- **become** provable **later**,
- are **not** dismissible as **mention-bound** artifacts,
- **feed** the **crown** family (explicit composition lemma).

## Hard boundaries

- **No `sorry`.** **No new axioms.**
- If the current **sentence** layer is insufficient, **extend** it (honestly) **before** claiming **`SPEC_046`** complete—deferral **only** with **Lean obstruction** + orchestration update.

## Starting platform

- [`Models/RetroStructuralTruth.lean`](../../../../NoveltyTheory/Models/RetroStructuralTruth.lean)
- [`Models/InvariantTower.lean`](../../../../NoveltyTheory/Models/InvariantTower.lean)
- [`Summits/StrongRetroCausationSummit.lean`](../../../../NoveltyTheory/Summits/StrongRetroCausationSummit.lean)

## Required new modules

| Module path | Role |
|-------------|-------------|
| `NoveltyTheory/Foundation/RetroStructuralTruthV2.lean` | Structural classification for **earlier-history** truths |
| `NoveltyTheory/Ridge/RetroStructuralGap.lean` | Gap lemmas: later proves **earlier-segment** truth |
| `NoveltyTheory/Summits/RetroStructuralCrownSummit.lean` | Packaging + crown feed |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `exists_structural_retro_truth_gap` | **∃** retro-classified **φ** with strict stratification |
| `later_regime_proves_earlier_history_truth` | **Later** **`ProvesAt`** proves truth about **earlier** history fragment |
| `retro_truth_sound_about_earlier_segment` | **Soundness** / **`HoldsAt`** alignment on canonical **G** |
| `retro_truth_not_mentionBound_only` | **Anti-collapse** vs **`mentionBound`**-only reading |
| `retro_truth_feeds_crown_family` | Explicit lemma tying retro family into **final** crown / **StructuralCrown** chain |

## Required content

1. At least **one** theorem **explicitly** targets **earlier** history (not only “later-stage facts”).
2. **Structural** classification predicate(s) documented; **no smuggling**.
3. Integration lemmas toward **`SPEC_047`** final package.

## Acceptance test

**Fails** if every “retro” result is just **`geOutput`** / **`traceEq`** depth reindexing **without** **earlier-segment** semantic content **in the theorem statement**.

## Dependencies

- **`SPEC_042_CG1`**–**`SPEC_045_CG4`** per integration needs.

## Status

**Complete** — `Foundation.RetroStructuralTruthV2`, `Ridge.RetroStructuralGap`, `Summits.RetroStructuralCrownSummit`; see `docs/THEOREM_INVENTORY.md`.
