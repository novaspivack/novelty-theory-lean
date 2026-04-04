import Mathlib.Data.List.Basic
import NoveltyTheory.Core.Conservative

/-!
# Paradigm shifts (`SPEC_008_PSH`)

Structural **paradigm shift**: conservativity on past phases, failure of the prior regime on a
fresh generated witness, success of the later regime, and **non-reducibility** back to the prior
regime on the strengthened history.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {X : Type u}

/--
`ParadigmShift R R' H witness` packages the sharp conjunction used in `SPEC_002_OCN` / `SPEC_008_PSH`.
-/
structure ParadigmShift (R R' : ExplanatoryRegime X) (H : Phase.History X) (witness : Phase X) :
    Prop where
  conservative : ConservativeOver H R R'
  prior_inadequate : ¬ R.explains witness
  later_adequate : R'.explains witness
  not_reducible_back : NotReducible R' R (H ++ [witness])

end Core

end NoveltyTheory
