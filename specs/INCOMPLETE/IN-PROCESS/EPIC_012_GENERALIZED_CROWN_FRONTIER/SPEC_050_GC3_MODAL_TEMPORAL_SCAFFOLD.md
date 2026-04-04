# SPEC_050_GC3 — Modal / temporal scaffold on `ProvesAt`

**Cite as:** **`SPEC_050_GC3`**.

## Purpose

Add **stage-relative** modal shapes (**`StageNext`**, **`BoundedFutureNecessary`**, **`PastSegmentListed`**) with **soundness** versus **`HoldsAt natCounter`**, plus **strict-gap** and **modalized** witness exports that **compose** with crown gaps (**`geOutput`**, **`histSeqUpto`**) without changing the underlying **`ProvesAt`** calculus.

## Hard boundaries

- Soundness claims are **relative to** the current **`HoldsAt` / `natCounter`** model.
- **No `sorry`**; **no** new axioms.

## Required modules (minimum)

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Core/ModalTemporalSyntax.lean` | Modal definitions over **`ProvesAt`** |
| `NoveltyTheory/Foundation/ModalTemporalFacts.lean` | Soundness + gap + modalized links |
| `NoveltyTheory/Models/ModalCrownWitnesses.lean` | Witness re-exports |
| `NoveltyTheory/Summits/ModalTemporalFrontierSummit.lean` | Summit surface |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `modal_sound_next` | **`StageNext` ⇒ `HoldsAt`** |
| `exists_modal_sentence_strict_gap` | ∃ modal-shaped **strict** gap instance |
| `future_defeat_modalized` / `retro_revelation_modalized` | Modal packaging of crown-scale sentences |

## Acceptance

**Complete** when soundness + at least one **existential** strict-gap theorem + modalized **future / retro** hooks are **proved** and **exported**.

## Dependencies

- **`SPEC_040_MD1`**, **`SPEC_046_CG5`**, **`Foundation.StageModality`**.

## Status

**Complete** — see [`ModalTemporalFacts.lean`](../../../../NoveltyTheory/Foundation/ModalTemporalFacts.lean).
