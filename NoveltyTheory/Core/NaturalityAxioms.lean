import NoveltyTheory.Core.Organization
import NoveltyTheory.Core.OrganizationAbstract
import NoveltyTheory.Core.Phase
import NoveltyTheory.Core.ReducerEnumeration

/-!
# Weak naturality for admissibility and multiscale organization (`SPEC_054_NS1`)

This file packages **minimal** structural predicates: they are chosen so that concrete Ridge
bundles become instances **without** defining “natural” to mean “a crown package exists.”
-/

namespace NoveltyTheory

namespace Core

universe u

/--
**Weak diagonal naturality** (`SPEC_054_NS1`): some witness schedule defeats every row of the
interface. This is strictly weaker than row-wise soundness for any fixed model; it only records the
*obstruction pattern* abstractly.
-/
def WeakDiagonalNaturality {ι υ X : Type u} (E : AdmissibleInterface ι υ X) : Prop :=
  ∃ w : ι → Phase X, ∀ i : ι, ¬ E.rowExplains i (w i)

/--
Constructive witness data for weak diagonal naturality (used for type-class-style bundling).
-/
structure IsWeakDiagonalNatural (ι υ X : Type u) (E : AdmissibleInterface ι υ X) where
  diagWitness : ι → Phase X
  diagDefeatsRow : ∀ i : ι, ¬ E.rowExplains i (diagWitness i)

theorem weakDiagonalNaturality_of_isWeak {ι υ X : Type u} (E : AdmissibleInterface ι υ X)
    (h : IsWeakDiagonalNatural ι υ X E) : WeakDiagonalNaturality E :=
  ⟨h.diagWitness, h.diagDefeatsRow⟩

/--
**Weak multiscale naturality** (`SPEC_054_NS1`): two carriers carry genuinely different stage
labels—the same predicate as certified separation in `AdequateOrganization`.
-/
def WeakMultiscaleNaturality {ι X : Type u} (org : AdequateOrganization ι X) : Prop :=
  org.SeparatesStages

theorem weakMultiscaleNaturality_iff_exists_separated {ι X : Type u}
    (org : AdequateOrganization ι X) :
    WeakMultiscaleNaturality org ↔ ∃ x y : X, org.stage x ≠ org.stage y :=
  Iff.rfl

/-- Bounded separated organizations witness weak multiscale naturality (`SPEC_054_NS1`). -/
theorem weakNaturality_of_organizationAbstract {X : Type}
    (A : OrganizationAbstract.AdmissibleBoundedOrganization X) :
    WeakMultiscaleNaturality A.org.org :=
  A.separates

end Core

end NoveltyTheory
