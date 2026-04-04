# SPEC_056_NS3 — Broader admissible-class transfer

**Cite as:** **`SPEC_056_NS3`**.

**Epic:** [`EPIC_013_MASTER_ORCHESTRATION.md`](EPIC_013_MASTER_ORCHESTRATION.md).

**Depends on:** **`SPEC_054_NS1`**, **`SPEC_055_NS2`** (or explicit dependency waiver documented).

**Status:** Pending.

---

## Goal

Upgrade transfer from the **current** aligned **carrier / class** packaging to a **broader** class of generators, carriers, and regimes that:

- satisfies **weak naturality** from **`SPEC_054`** (and relevant sentence principles from **`SPEC_055`**),
- includes **faithfulness / alignment** commitments strong enough to **transport** crown phenomena honestly,
- contains **materially distinct** instances—not isomorphic retaggings or permuted `Bool` tags only.

---

## Required new modules (Lean)

| Path | Role |
|------|------|
| `NoveltyTheory/Core/NaturalAdmissibleClass.lean` | Definition of the broader class + morphisms / witnesses |
| `NoveltyTheory/Ridge/BroadTransfer.lean` | Transfer theorems for ascent / non-finality / future defeat / etc., as far as true |
| `NoveltyTheory/Models/NaturalClassExamples.lean` | **At least two** new nontrivial instances |
| `NoveltyTheory/Summits/BroadTransferSummit.lean` | Named summit re-exports for paper-facing citation |

---

## Required theorem targets (names indicative)

- `naturalClass_preserves_structural_ascent`
- `naturalClass_preserves_nonfinality`
- `naturalClass_preserves_future_defeat`
- `broad_transfer_of_generalized_crown` (or a disjunctive/package form if one clause requires extra hypotheses—document honestly)
- `multiple_nontrivially_distinct_instances`
- `crown_not_encoding_artifact_in_natural_class`

---

## Acceptance criteria

- Class is **strictly broader** (provably contains objects not covered by the previous `Bool × ℕ` aligned story, or relaxes hypotheses in a **substantive** way—state which in Lean comments **for external readers** without meta-talk).
- **Two or more** instances that are **not** obvious cosmetic variants (document invariants that differ).
- **Additive**: `GeneralizedFinalCrownPackage` and `CrownTransfer` remain valid for the original witnesses.

## Failure modes to avoid

- “Breadth” by **permute tags** or renaming only.
- Proving transfer by **assuming** the conclusion as a class field.

---

## Completion checklist

- [ ] `lake build` green
- [ ] `docs/THEOREM_INVENTORY.md` updated
- [ ] `NoveltyTheory/All.lean` imports

---

_Next: **`SPEC_057_NS4`**._
