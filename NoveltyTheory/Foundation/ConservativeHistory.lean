import Mathlib.Data.List.Range
import Mathlib.Data.List.Infix
import NoveltyTheory.Core.Conservative

/-!
# Conservative history facts (`SPEC_008_PSH`)
-/

namespace NoveltyTheory

namespace Foundation

universe u

variable {X : Type u} {R R' : Core.ExplanatoryRegime X}

theorem conservativeOver_tail_of_conservativeOver {H : Core.Phase.History X}
    (h : Core.ConservativeOver H R R') (P : Core.Phase X)
    (hP : P ∈ H) : ∀ (d : R.Desc), R.Adequate d P → R'.explains P := by
  rcases h with ⟨φ, hφ⟩
  intro d hd
  exact ⟨φ d, hφ P hP d hd⟩

end Foundation

end NoveltyTheory
