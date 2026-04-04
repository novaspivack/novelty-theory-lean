# SPEC_049_GC2 — Structural sentence hierarchy v2

**Cite as:** **`SPEC_049_GC2`**.

## Purpose

Define **`IsStructuralSentenceV2`** as an **honest union** of the generator-structural fragment and **retro structural v2** (**`histSeqUpto`** class), prove **anti-collapse** lemmas, and export a **`structuralV2_crown_family`** strict **`ProvesAt`** ascent compatible with **`EPIC_011`** packaging.

## Hard boundaries

- **No** definition smuggling: the predicate is a **disjoint-style** union of **existing** classifiers.
- **No `sorry`**; **no** new axioms.

## Required modules (minimum)

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Core/SentenceHierarchyV2.lean` | **`IsStructuralSentenceV2`** + morphism lemmas |
| `NoveltyTheory/Foundation/StructuralSentenceHierarchyV2.lean` | Anti-collapse + **`structuralV2_crown_family`** |
| `NoveltyTheory/Models/StructuralHierarchyCrown.lean` | Re-export boundary |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `structuralV2_crown_family` | **`∃ Φ, ∀ n`**, **`IsStructuralSentenceV2`**, strict gap |
| `structuralV2_not_mentionBound_only` | Anti-collapse vs mention stratum (named) |

## Acceptance

**Complete** when crown family + at least one **non-`geOutput`-only** / **non-trace-only** collapse blockers match **`EPIC_011`** standards.

## Dependencies

- **`SPEC_046_CG5`**, **`SPEC_042_CG1`**, generator-structural stack.

## Status

**Complete** — see [`StructuralSentenceHierarchyV2.lean`](../../../../NoveltyTheory/Foundation/StructuralSentenceHierarchyV2.lean).
