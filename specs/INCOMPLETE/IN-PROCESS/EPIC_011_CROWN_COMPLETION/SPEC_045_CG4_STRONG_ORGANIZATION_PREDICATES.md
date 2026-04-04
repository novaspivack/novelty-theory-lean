# SPEC_045_CG4 — Strong organization predicates

**Cite as:** **`SPEC_045_CG4`**.

## Purpose

Upgrade organization from **v1 separation** (`SeparatesStages`, parity / identity examples) to a **bundled, non-trivial** organization notion that can appear in the **final crown package** as a **strictly stronger** obstruction than “singleton ladder / finite signature” templates alone.

**Explicit non-goal:** quantify over **raw arbitrary** organizations without **soundness / nontriviality** bundled in the **type** of the organization object.

## Hard boundaries

- **No** revival of **blocked literal universals**.
- A **mere re-export** of [`SummitPackages`](../../../../NoveltyTheory/Summits/SummitPackages.lean) / [`SignatureTower.finite_signature_cannot_organize_full_ladder`](../../../../NoveltyTheory/Models/SignatureTower.lean) **without** new **bundled** logical content **fails** this spec.

## Starting platform

- [`Core/Organization.lean`](../../../../NoveltyTheory/Core/Organization.lean)
- [`Summits/OrganizationSummit.lean`](../../../../NoveltyTheory/Summits/OrganizationSummit.lean)
- [`Summits/OrganizationFrontierSummit.lean`](../../../../NoveltyTheory/Summits/OrganizationFrontierSummit.lean)
- [`Models/BoundedRegimeDiagonal`](../../../../NoveltyTheory/Models/BoundedRegimeDiagonal.lean) (compatibility hooks)

## Required new modules

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Core/OrganizationV2.lean` | Bundled organization record + separation / adequacy predicates |
| `NoveltyTheory/Ridge/OrganizationHeightObstruction.lean` | Height / self-certification obstruction lemmas |
| `NoveltyTheory/Summits/OrganizationCrownSummit.lean` | Summit packaging tied to crown |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `finite_adequate_organization_has_bounded_stage_separation` | Formal **boundedness** phenomenon for a **bundled finite adequate** org class |
| `no_finite_adequate_organization_totalizes_future` | **No** such org **totalizes** a documented **future** relation / proof-theoretic companion |
| `organization_height_obstruction` | Obstruction lemma usable in crown dependency map |
| `organization_cannot_self_certify_total_future` | **Self-certification** / terminality-style block |
| `organization_crown_supports_strict_ascent` | Bridge lemma: org obstruction **supports** (not replaces) **structural strict ascent** package |

## Required content

1. **`OrganizationV2`** bundles: **nontriviality**, **stage-separation power**, **compatibility** hooks to **`ProvesAt`** / **regime** language (exact interface is normative in Lean).
2. Prove theorems are **strictly stronger** than current **OrganizationSummit-only** templates (cite **old** lemmas as **special cases** or show **implication** from weaker to **strict** fails).
3. Link to **diagonal** / **singleton-within** facts where honest (**`family_diagonal_of_singletonWithin`**, **etc.**).

## Acceptance test

**Fails** if reviewer can fairly say: “this is only the old finite-signature / singleton ladder paragraph with a new module name.”

## Dependencies

- **`SPEC_042_CG1`–`SPEC_044_CG3`** progression informs which **organization** bridges are needed for the **final** package.

## Status

**Not started**.
