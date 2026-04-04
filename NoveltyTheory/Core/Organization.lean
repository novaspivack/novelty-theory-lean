import Mathlib.Data.Nat.Basic

/-!
# Abstract organization layer (`SPEC_020_AO1`–`SPEC_022_AO3`)

Lightweight records capturing multiscale labeling, future coherence witnesses, and nested refinement.
Concrete model-theoretic content stays in **`Models`**; this file only supplies portable predicates.
-/

namespace NoveltyTheory

namespace Core

universe u

structure AdequateOrganization (ι X : Type u) where
  stage : X → ι

/-- At least two carriers carry **different** stage labels—rules out collapsed constant `stage` maps (`SPEC_041_OR1`). -/
def AdequateOrganization.SeparatesStages {ι X : Type u} (org : AdequateOrganization ι X) : Prop :=
  ∃ x y : X, org.stage x ≠ org.stage y

theorem AdequateOrganization.not_separatesStages_of_const {ι X : Type u} (i₀ : ι) (org : AdequateOrganization ι X)
    (h : ∀ x, org.stage x = i₀) : ¬ org.SeparatesStages := by
  rintro ⟨x, y, hxy⟩
  exact hxy (by rw [h x, h y])

structure TotalFutureOrganization (ι X : Type u) extends AdequateOrganization ι X where
  advances : ι → ι → Prop

structure InternalHierarchy (α : Type u) where
  refines : α → α → Prop
  refines_transitive : ∀ x y z, refines x y → refines y z → refines x z

instance natInternalHierarchy : InternalHierarchy ℕ where
  refines := fun a b => a ≤ b
  refines_transitive := fun _ _ _ => Nat.le_trans

/-- Nontrivial labeling: parity of the index as a `Bool` “stage token” (`SPEC_020_AO1`). -/
def adequateNatParity : AdequateOrganization Bool ℕ where
  stage := fun n => n % 2 = 0

theorem adequateNatParity_separates : adequateNatParity.SeparatesStages :=
  ⟨0, 1, by simp [adequateNatParity, Nat.mod_succ]⟩

/-- `ℕ` carries both stage (`id`) and a strict future relation (`Nat.lt`) (`SPEC_021_AO2`). -/
def totalFutureOnNat : TotalFutureOrganization ℕ ℕ where
  stage := id
  advances := fun i j => i < j

theorem totalFutureOnNat_separates : totalFutureOnNat.toAdequateOrganization.SeparatesStages :=
  ⟨0, 1, Nat.zero_ne_one⟩

end Core

end NoveltyTheory
