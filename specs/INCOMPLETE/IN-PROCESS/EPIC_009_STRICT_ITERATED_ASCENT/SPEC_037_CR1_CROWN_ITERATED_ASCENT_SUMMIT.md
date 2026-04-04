# SPEC_037_CR1 — Crown iterated ascent summit

**Cite as:** **`SPEC_037_CR1`**.

## Purpose

Deliver the **crown-shaped** existential package aligned with [`docs/007_LIBRARY_POSITIONING_ASSESSMENT.md`](../../../../docs/007_LIBRARY_POSITIONING_ASSESSMENT.md) §6: some fixed generator context and a sequence \((\Phi_n)\) of **structural** sentences (`SPEC_035_GS1`) such that for every \(n\), **the next regime proves \(\Phi_n\)** but **the current regime does not**—in a form that **peer review** cannot reduce to a trivial restatement of `mentionBound` or a single stratified-height artifact without invoking the supplied **anti-collapse** lemmas.

## Acceptance

1. **Main theorem:** At least one **named** theorem closing the \(\exists G\) / \(\exists (\Phi_n)\) / \(\forall n\) pattern (exact typing may use `natCounter`, a section parameter `G`, or explicit `Nonempty` packaging—choose the **strongest** honest generality the proofs support).

2. **Summit module:** New `NoveltyTheory/Summits/...` (or extension of an existing summit) re-exporting the crown theorems for `SummitPackages`-style aggregation if appropriate.

3. **Anti-collapse:** Explicit lemmas or corollaries cited by the summit docstring showing **why** the construction is not subsumed by a **single** mention-bound inequality or a **one-line** reindexing of `exists_sentence_provable_succ_not_at`—must reference `SPEC_035_GS1` predicates.

4. **Inventory:** Add rows to [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) in the same change as new `theorem` / `lemma` declarations.

5. **Hygiene:** Proof quality per [`CODING_PROTOCOLS.md`](../../../../CODING_PROTOCOLS.md); disclose any `axiom`s.

## Lean modules (expected)

- `NoveltyTheory/Summits/CrownIteratedAscentSummit.lean` (suggested name) or equivalent.

## Dependencies

- **`SPEC_035_GS1`**, **`SPEC_036_AR1`**.

## Status

**Implemented** — `NoveltyTheory/Summits/CrownIteratedAscentSummit.lean`; `SummitPackages.summit_crown_strict_ascent_sentence_family`.
