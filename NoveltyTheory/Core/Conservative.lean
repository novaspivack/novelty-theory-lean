import Mathlib.Data.List.Basic
import NoveltyTheory.Core.Reduction

/-!
# Conservative extension over history (`SPEC_008_PSH`)

Later regime **conservatively extends** earlier regime on a history when embedded descriptions
inherit adequacy on every phase seen so far.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {X : Type u}

/-- `R'` conservatively extends `R` on history `H` via `embed : R.Desc → R'.Desc`. -/
def ConservativeExtension (R R' : ExplanatoryRegime X) (H : Phase.History X)
    (embed : R.Desc → R'.Desc) : Prop :=
  ∀ P ∈ H, ∀ (d : R.Desc), R.Adequate d P → R'.Adequate (embed d) P

/-- Existential witness to conservativity (often with a canonical embedding). -/
def ConservativeOver (H : Phase.History X) (R R' : ExplanatoryRegime X) : Prop :=
  ∃ embed : R.Desc → R'.Desc, ConservativeExtension R R' H embed

end Core

end NoveltyTheory
