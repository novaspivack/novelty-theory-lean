# SPEC_048_GC1 — Generalized carrier and phased sentence embed

**Cite as:** **`SPEC_048_GC1`**.

## Purpose

Rework **phase / output typing** so crown-grade witnesses lift through an **aligned section** **`CarrierSection X`** into **`Sentence X`**, with **faithful** semantics versus the canonical **`natCounter`** layer when **`AlignsCarrier`** holds.

## Hard boundaries

- **No** blocked literal universals; **no `sorry`**; **no** new axioms.
- **Do not** identify distinct carrier observations: alignment is **hypothesis-driven**, not definitional collapse.

## Required modules (minimum)

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Core/GeneralizedCarrier.lean` | **`CarrierSection`**, **`AlignsCarrier`**, product / **Bool** tag sections |
| `NoveltyTheory/Core/PhaseSyntaxGeneral.lean` | **`sentenceCarrierEmbed`** |
| `NoveltyTheory/Foundation/PhaseGeneralizationFacts.lean` | **`carrierHolds`**, mutual **embed** facts, soundness, **ProvesAtCarrier**, enum pullback |
| `NoveltyTheory/Models/CarrierGeneralCrown.lean` | Re-export boundary for crown consumers |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `carrier_embed_fwd` / `carrier_embed_rev` | Mutual **`HoldsAt`** / **`carrierHolds`** correspondence under alignment |
| `phase_general_embed_faithful` | Iff packaging for general **`G`, `C`** |
| `provesAt_general_phase_sound` | **`ProvesAt`** implies **`carrierHolds`** on embed |
| `general_phase_crown_family` | **`ProvesAtCarrier`** strict-gap **`∃G, ∃Φ`** packaging at **`Bool × ℕ`** |

## Acceptance

**Complete** when: faithful embed + soundness + enum-crown **`ProvesAtCarrier`** gap + **`All.lean`** import + inventory rows.

## Dependencies

- **`SPEC_043_CG2`** / **`SPEC_044_CG3`** / **`EPIC_011`** enum–poly baseline.

## Status

**Complete** — modules landed; see [`PhaseGeneralizationFacts.lean`](../../../../NoveltyTheory/Foundation/PhaseGeneralizationFacts.lean).
