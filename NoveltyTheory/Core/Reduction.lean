import Mathlib.Data.List.Basic
import NoveltyTheory.Core.ExplanatoryRegime

/-!
# Admissible reductions (`SPEC_006_ADR`)

Backward **explanatory reduction**: later regime `R'` is reducible to earlier `R` on a
finite history if some map on descriptions preserves adequacy for every phase in the history.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {X : Type u}

/-- Explanatory reducibility of `R'` to `R` along phases `H` (`Reducible` in `SPEC_008_PSH`). -/
def Reducible (R' R : ExplanatoryRegime X) (H : Phase.History X) : Prop :=
  ∃ f : R'.Desc → R.Desc,
    ∀ P ∈ H, ∀ (d : R'.Desc), R'.Adequate d P → R.Adequate (f d) P

/-- Non-reducibility on the same data. -/
abbrev NotReducible (R' R : ExplanatoryRegime X) (H : Phase.History X) : Prop :=
  ¬ Reducible R' R H

end Core

end NoveltyTheory
