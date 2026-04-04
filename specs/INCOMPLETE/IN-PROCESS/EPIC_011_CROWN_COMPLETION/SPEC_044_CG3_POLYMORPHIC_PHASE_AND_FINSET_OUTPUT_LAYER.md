# SPEC_044_CG3 — Polymorphic phase and finset output layer

**Cite as:** **`SPEC_044_CG3`**.

## Purpose

Reduce the risk that the crown is an artifact of **nat-specific** / **`Set ℕ`** encoding habits. Introduce a **conservative extension**: either a **polymorphic phase-at-sentence** layer or a **finset-grade** output-set naming discipline (or both), with **faithful embedding** from the current **`Sentence ℕ`** fragment and **ported strict-ascent** witness.

**Goal:** abstraction **only** where it earns **anti-collapse** against “one encoding trick.”

## Hard boundaries

- **No definition smuggling:** polymorphic layer must **embed** old sentences (or interpret them) without assuming crown conclusions.
- **Blocked universals** remain blocked.
- If a construction is **nat-locked**, state **exactly** which definition or theorem forces **`ℕ`** and why (honest blocker lemma).

## Required new modules

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Core/PhaseSyntaxPoly.lean` | Polymorphic/finset-oriented sentence or phase syntax scaffold |
| `NoveltyTheory/Foundation/PhaseSyntaxPolyFacts.lean` | Embeddings, conservative extension lemmas |
| `NoveltyTheory/Models/PolymorphicPhaseCrown.lean` | Crown witness on extended layer |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `phaseSyntaxPoly_embed_nat_faithful` | Conservative / faithful embed **`Sentence ℕ` → poly layer** (or inverse interpret) |
| `holdsAt_poly_phase_sound` | Semantics for canonical model (spelled per design) |
| `provesAt_poly_phase_sound` | Proof system soundness for poly fragment |
| `exists_poly_phase_provable_gap` | Strict gap on poly layer |
| `poly_phase_crown_family` | **∃G ∃Φ ∀n** strict ascent **on poly layer**, ported witness |

## Required content

1. **Design choice** documented in module docstrings: polymorphic **`Phase`**-indexed sentences **vs** finset **`Finset`** carriers **vs** hybrid; **why** it generalizes nat-only tricks.
2. At least **one** strict-ascent witness **family** **stated and proved** on the new layer **with** a port lemma tying it to **`natCounter`** (or explicit base-model functor).
3. If port **fails**, **obstruction** file/update in this spec folder narrative + Lean lemma **`nat_lock_reason`** (name as appropriate).

## Acceptance test

**Passes** only with a **ported** witness and **faithful embed** **or** a **formal no-go** explaining **`nat`-lock** with **next-step** redesign recorded.

## Dependencies

- **`SPEC_043_CG2`** recommended before full poly crown (enum layer often feeds generalization).

## Status

**Not started**.
