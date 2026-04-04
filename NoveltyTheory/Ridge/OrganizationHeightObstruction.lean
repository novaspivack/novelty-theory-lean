import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.OrganizationV2
import NoveltyTheory.Models.SignatureTower

/-!
# Organization height obstruction (`SPEC_045_CG4`)

Bundled **finite-height** organizations cannot **realize every** strict **`ℕ < ℕ`** order pair by
stage labels: once **`stage ≤ B`**, indices above **`B`** are unreachable. This strengthens the
singleton-ladder / **`regimeUpto k`** template by tying **abstract organization** bounds to the same
**height** phenomenon, without asserting blocked universal quantifiers over raw interfaces.
-/

namespace NoveltyTheory

namespace Ridge

namespace OrganizationHeightObstruction

open NoveltyTheory.Core NoveltyTheory.Models.SignatureTower

variable {X : Type}

/-- Two stages lie in **`0 … B`**, yet carry different labels. -/
theorem finite_adequate_organization_has_bounded_stage_separation (B : ℕ) (org : OrganizationV2 X)
    (hfin : org.IsFiniteHeight B) (hsep : org.org.SeparatesStages) :
    ∃ x y : X, org.org.stage x ≠ org.org.stage y ∧ org.org.stage x ≤ B ∧ org.org.stage y ≤ B := by
  rcases hsep with ⟨x, y, hxy⟩
  exact ⟨x, y, hxy, hfin x, hfin y⟩

/--
**Totalizes standard future on `ℕ`:** for every strict inequality **`i < j`**, some carriers realize
**`stage x = i`** and **`stage y = j`**. Impossible once **`stage ≤ B`** and **`j > B`**.
-/
def TotalizesStandardFuture (org : OrganizationV2 X) : Prop :=
  ∀ i j : ℕ, i < j → ∃ x y : X, org.org.stage x = i ∧ org.org.stage y = j

theorem no_finite_adequate_organization_totalizes_future (B : ℕ) (org : OrganizationV2 X)
    (hfin : org.IsFiniteHeight B) : ¬ TotalizesStandardFuture org := by
  intro H
  rcases H 0 (B + 1) (Nat.lt_succ_of_le (Nat.zero_le B)) with ⟨x, y, hx, hy⟩
  have hyB := hfin y
  rw [hy] at hyB
  exact Nat.not_succ_le_self B hyB

/-- Claims existence of a finite-height org inside **`X`** that **totalizes** the standard future. -/
def SelfCertifiesTotalFuture (X : Type) : Prop :=
  ∃ (org : OrganizationV2 X) (B : ℕ), org.IsFiniteHeight B ∧ TotalizesStandardFuture org

theorem organization_cannot_self_certify_total_future (X : Type) : ¬ SelfCertifiesTotalFuture X := by
  rintro ⟨org, B, hfin, Htot⟩
  exact no_finite_adequate_organization_totalizes_future B org hfin Htot

/--
**Height packaging:** a **fixed signature layer** misses a **canonical** singleton phase, **and** no
finite-height separated organization can label **all** strict **`ℕ`** future pairs internally.
-/
theorem organization_height_obstruction (B : ℕ) :
    (∃ ph : Phase ℕ, ph.generatedBy natCounter ∧ ¬ (regimeUpto B).explains ph) ∧
      ∀ (Y : Type) (org : OrganizationV2 Y), org.IsFiniteHeight B → ¬ TotalizesStandardFuture org :=
  And.intro (finite_signature_cannot_organize_full_ladder B) fun _ org hfin =>
    no_finite_adequate_organization_totalizes_future B org hfin

end OrganizationHeightObstruction

end Ridge

end NoveltyTheory
