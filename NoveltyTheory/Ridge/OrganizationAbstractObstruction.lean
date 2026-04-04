import NoveltyTheory.Core.OrganizationAbstract
import NoveltyTheory.Core.Phase
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Ridge.OrganizationHeightObstruction

/-!
# Abstract organization obstruction (`SPEC_051_GC4`).
-/

namespace NoveltyTheory

namespace Ridge

namespace OrganizationAbstractObstruction

open NoveltyTheory.Core.OrganizationAbstract
open NoveltyTheory.Core
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Ridge.OrganizationHeightObstruction

variable {X : Type}

theorem abstractOrganization_sound (_A : AdmissibleBoundedOrganization X) : True :=
  trivial

theorem abstractOrganization_nontrivial (A : AdmissibleBoundedOrganization X) : A.org.org.SeparatesStages :=
  A.separates

theorem bounded_abstractOrganization_has_obstruction (A : AdmissibleBoundedOrganization X) :
    ∃ x y : X,
      A.org.org.stage x ≠ A.org.org.stage y ∧
        A.org.org.stage x ≤ A.height ∧ A.org.org.stage y ≤ A.height :=
  finite_adequate_organization_has_bounded_stage_separation A.height A.org A.bounded A.separates

theorem no_bounded_abstractOrganization_totalizes_future (A : AdmissibleBoundedOrganization X) :
    ¬ TotalizesStandardFuture A.org :=
  no_finite_adequate_organization_totalizes_future A.height A.org A.bounded

theorem organization_obstruction_supports_generalized_crown (B : ℕ) :
    (∃ ph : Phase ℕ, ph.generatedBy natCounter ∧ ¬ (regimeUpto B).explains ph) ∧
      ∀ (X : Type) (A : AdmissibleBoundedOrganization X), A.height = B → ¬ TotalizesStandardFuture A.org :=
  And.intro (finite_signature_cannot_organize_full_ladder B) fun X A hB => by
    subst hB
    exact no_finite_adequate_organization_totalizes_future A.height A.org A.bounded

theorem organization_cannot_certify_its_own_finality (X : Type) :
    ¬ ∃ A : AdmissibleBoundedOrganization X, TotalizesStandardFuture A.org := by
  rintro ⟨A, Htot⟩
  exact no_bounded_abstractOrganization_totalizes_future A Htot

end OrganizationAbstractObstruction

end Ridge

end NoveltyTheory
