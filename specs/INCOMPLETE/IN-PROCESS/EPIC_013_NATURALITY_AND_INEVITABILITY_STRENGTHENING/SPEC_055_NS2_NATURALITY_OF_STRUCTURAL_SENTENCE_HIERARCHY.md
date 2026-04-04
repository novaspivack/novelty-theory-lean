# SPEC_055_NS2 — Naturality of the structural sentence hierarchy

**Cite as:** **`SPEC_055_NS2`**.

**Epic:** [`EPIC_013_MASTER_ORCHESTRATION.md`](EPIC_013_MASTER_ORCHESTRATION.md).

**Depends on:** **`SPEC_054_NS1`** landed or parallelizable gaps explicitly noted in this spec’s **Notes** block.

**Status:** Pending.

---

## Goal

Show that **`StructuralSentenceHierarchyV2`** and **retro-structural** layers are **instances** of a **general weak principle class** for structural sentence families—closure, stability, and anti-collapse—so the crown witness family is not “syntax tailor-made to force a gap.”

---

## Required new modules (Lean)

| Path | Role |
|------|------|
| `NoveltyTheory/Core/StructuralSentenceNaturality.lean` | Principle bundle for structural sentence families |
| `NoveltyTheory/Foundation/StructuralSentenceNaturalityFacts.lean` | Proofs that `StructuralSentenceHierarchyV2` / retro layers satisfy the bundle |

---

## Principle bundle (refine in Lean)

- Closure under selected **structural constructors** (aligned with existing `IsStructuralSentenceV2` fragments).
- Stability under **trace-preserving embeddings** (carrier / phase morphisms consistent with `PhaseGeneralizationFacts`).
- Compatibility with **generator-truth** predicates.
- **Anti-collapse** vs purely depth-based classification where the library already separates these ideas.

---

## Required theorem targets (names indicative)

- `structuralV2_satisfies_weak_sentence_naturality`
- `retroStructuralV2_satisfies_weak_sentence_naturality`
- `naturality_does_not_collapse_to_mentionBound` (honest: formalize what “mentionBound collapse” means)
- `naturality_preserves_strict_ascent_family` (links to strict \(\vdash\) / \(\not\vdash\) packaging without weakening prior summit)

---

## Acceptance criteria

- Crown witness family is packaged as an **instance** of general principles **and** those principles have **non-vacuous** mathematical content (not a restatement of existing files under a new name).
- No weakening of **`structuralV2_crown_family`** or retro gap certificates.

## Failure modes to avoid

- Encoding the entire `histSeqUpto` / output-enum witness as a definition inside “naturality.”

---

## Completion checklist

- [ ] `lake build` green
- [ ] `docs/THEOREM_INVENTORY.md` updated
- [ ] `NoveltyTheory/All.lean` imports

---

_Next: **`SPEC_056_NS3`**._
