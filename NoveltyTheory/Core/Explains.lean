import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.ReducerEnumeration
import NoveltyTheory.Core.Tower

/-!
# `Explains` packaging (`SPEC_006_ADR`, `SPEC_011_SPK`)

Predicates for a **fixed** admissible interface explaining a tower stage relative to a generator.
These are intentionally shallow: they combine `generatedBy` with `rowExplains` or regime-level
`explains` so summit statements can cite stable names without smuggling diagonal conclusions.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {S X ι υ : Type u}

namespace AdmissibleInterface

variable (E : AdmissibleInterface ι υ X) (G : GenerativeSystem S X) (T : PhaseRegimeTower X) (n : ℕ)

/-- **`SPEC_011_SPK` shape:** interface `E` explains stage `n` iff the phase is realized by `G` and some row of `E` witnesses it. -/
def explainsTowerStage : Prop :=
  (T.phase n).generatedBy G ∧ ∃ i : ι, E.rowExplains i (T.phase n)

/-- Same relation with an explicit row index `i` (matches “`(P_n, R_n)` + row `i`”). -/
def explainsTowerStageAt (i : ι) : Prop :=
  (T.phase n).generatedBy G ∧ ∃ v : υ, E.explains i v (T.phase n)

end AdmissibleInterface

variable (G : GenerativeSystem S X) (T : PhaseRegimeTower X) (n : ℕ)

/-- Regime-at-stage explains its paired phase, with generation as a side condition (`SPEC_006_ADR`). -/
def regimeExplainsTowerStage : Prop :=
  (T.phase n).generatedBy G ∧ (T.regime n).explains (T.phase n)

end Core

end NoveltyTheory
