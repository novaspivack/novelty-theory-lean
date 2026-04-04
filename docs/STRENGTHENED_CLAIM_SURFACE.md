# Strengthened claim surface (`EPIC_013`)

**Status:** Active documentation for the naturality / broader-transfer / inevitability layer on top of `GeneralizedFinalCrownPackage`. Quantifiers in prose below must track the formal statements exactly (see [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md)).

**Orchestration:** [`../specs/INCOMPLETE/IN-PROCESS/EPIC_013_NATURALITY_AND_INEVITABILITY_STRENGTHENING/EPIC_013_MASTER_ORCHESTRATION.md`](https://github.com/novaspivack/novelty-theory/blob/main/specs/INCOMPLETE/IN-PROCESS/EPIC_013_NATURALITY_AND_INEVITABILITY_STRENGTHENING/EPIC_013_MASTER_ORCHESTRATION.md).

**Dependency map:** [`STRENGTHENED_DEPENDENCY_MAP.md`](STRENGTHENED_DEPENDENCY_MAP.md).

---

## Trust boundary

Claims are **not** “for every deterministic system.” They are scoped to **predicates made explicit in Lean**: weak naturality / weak diagonal and multiscale principles, signature-admissible interfaces, **`NaturalAdmissibleInstance`** (aligned generator + section), natural bounded organization, and **`NaturalNumericSystem`** packaging for anti-closure. Raw universal diagonals over **all** `AdmissibleInterface` values remain **refuted** by trivial-interface lemmas documented in the inventory.

---

## Claim ↔ Lean anchors

| Claim (informal) | Lean declaration(s) | Spec |
|------------------|----------------------|------|
| Weak naturality principles are coherent with phase adequacy and certificates | `NaturalityFacts.naturality_adequacy_transport`, `naturality_phase_certificates_preserved` | `SPEC_054_NS1` |
| Weak diagonal / multiscale naturality from structured hypotheses | `NaturalityAxioms.weakDiagonalNaturality_of_isWeak`, `weakMultiscaleNaturality_iff_exists_separated`, `weakNaturality_of_organizationAbstract` | `SPEC_054_NS1` |
| Signature-admissible interfaces yield weak naturality and exclude triviality | `AdmissibilityNaturality.weakNaturality_of_signatureAdmissibleInterface`, `weakNaturality_excludes_trivial_interface`, `not_rowSound_trivialAdmissibleInterface` | `SPEC_054_NS1` |
| Structural **v2** (and retro **v2**) satisfy weak sentence naturality; naturality does not collapse to mention-bound | `StructuralSentenceNaturalityFacts.structuralV2_satisfies_weak_sentence_naturality`, `retroStructuralV2_satisfies_weak_sentence_naturality`, `naturality_does_not_collapse_to_mentionBound`, `naturality_preserves_strict_ascent_family` | `SPEC_055_NS2` |
| Output-enum / carrier strict gap **transfers** to every **`NaturalAdmissibleInstance`** (not only `Bool × ℕ`) | `BroadTransfer.naturalClass_preserves_structural_ascent`, `futureDefeatAt`, `broad_transfer_of_generalized_crown` | `SPEC_056_NS3` |
| Multiple nontrivial instances; encoding artifact ruled out in the natural class | `BroadTransfer.multiple_nontrivially_distinct_instances`, `crown_not_encoding_artifact_in_natural_class` | `SPEC_056_NS3` |
| Under natural organization hypotheses, bounded height cannot certify totality of the future | `UnboundedOrganization.weakNaturalOrganization_bounded_obstruction`, `finite_height_not_final_under_natural_conditions`, `unbounded_organization_required_for_full_future`, `natural_no_final_organization_theorem` | `SPEC_057_NS4` |
| Disjunctive / packaged **anti-closure** on natural numeric systems; interface obstruction | `NaturalAntiClosure.weak_natural_conditions_imply_nonfinality_or_ascent`, `natural_anti_closure_theorem`, `weak_natural_interface_obstruction`, `setup_dependence_alignments_bundled` | `SPEC_058_NS5` |

---

## Packaging notes

- **`BroadTransferStatement`** and **`CrownEncodingStatement`** are `Prop`-valued definitions built from **predicates** (`let p ω => …`) so `∀`-bodies do not splice theorem heads as binders; mathematically they state the same content as the cited theorems (`broad_transfer_of_generalized_crown`, `crown_not_encoding_artifact_in_natural_class`).
- **`futureDefeatBroadPoint`** matches **`futureDefeatAt`** at the same stage and instance (`futureDefeatBroadPoint_eq`).

---

_Last aligned with `lake build`, [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md) verification (**2026-04-04**), and [`paper/Final Draft/novelty_theory_generalized_crown.tex`](../paper/Final%20Draft/novelty_theory_generalized_crown.tex) `\leanref` cross-check (`scripts/verify_paper_leanrefs.py`)._
