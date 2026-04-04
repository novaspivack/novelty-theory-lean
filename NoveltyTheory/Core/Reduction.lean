import Mathlib.Data.List.Basic
import Mathlib.Logic.IsEmpty.Basic
import NoveltyTheory.Core.ExplanatoryRegime

/-!
# Admissible reductions (`SPEC_006_ADR`)

Backward **explanatory reduction**: later regime `R'` is reducible to earlier `R` on a
finite history if some map on descriptions preserves adequacy for every phase in the history.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {X : Type u} {R R' : ExplanatoryRegime X} {H : Phase.History X}

/-- Explanatory reducibility of `R'` to `R` along phases `H` (`Reducible` in `SPEC_008_PSH`). -/
def Reducible (R' R : ExplanatoryRegime X) (H : Phase.History X) : Prop :=
  ∃ f : R'.Desc → R.Desc,
    ∀ P ∈ H, ∀ (d : R'.Desc), R'.Adequate d P → R.Adequate (f d) P

/-- Non-reducibility on the same data. -/
abbrev NotReducible (R' R : ExplanatoryRegime X) (H : Phase.History X) : Prop :=
  ¬ Reducible R' R H

/--
If the **later** regime has no descriptions, backward reducibility holds **vacuously** on any
history (the transporting map `R'.Desc → R.Desc` is the empty elimination).
-/
theorem reducible_of_isEmpty [IsEmpty R'.Desc] : Reducible R' R H :=
  ⟨isEmptyElim, fun _ _ d _ => isEmptyElim d⟩

end Core

end NoveltyTheory
