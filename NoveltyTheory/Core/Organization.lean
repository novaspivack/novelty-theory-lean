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

/-- `ℕ` carries both stage (`id`) and a strict future relation (`Nat.lt`) (`SPEC_021_AO2`). -/
def totalFutureOnNat : TotalFutureOrganization ℕ ℕ where
  stage := id
  advances := fun i j => i < j

end Core

end NoveltyTheory
