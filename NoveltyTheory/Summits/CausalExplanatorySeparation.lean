import NoveltyTheory.Core.Tower
import NoveltyTheory.Models.SignatureTower

/-!
# Summit I — causal vs fixed explanatory interface (`SPEC_011_SPK`)

**Proved here (model-level):** there is a **single** generator and an infinite `PhaseRegimeTower`
such that every phase lies on the generator trace and **stage-wise paradigm shifts** hold.

The quantification “for every fixed admissible interface `E` there is a failing height” is the
abstract **Summit I** target; it is slated for the diagonal layer (**`SPEC_009_DST`**) once
`AdmissibleInterface` is tied to regime reducers without collapsing definitional strength.
-/

namespace NoveltyTheory

namespace Summits

open Core

/-- **Model manifestation** of the causal + shifting tower package on `SignatureTower`. -/
theorem model_causal_paradigm_tower :
    ∃ (T : PhaseRegimeTower ℕ) (G : GenerativeSystem ℕ ℕ),
      T.generatedThroughout G ∧ T.paradigmShiftSteps :=
  ⟨Models.SignatureTower.canonicalTower, Models.SignatureTower.natCounter,
    And.intro Models.SignatureTower.canonicalTower_generated
      Models.SignatureTower.canonicalTower_paradigmSteps⟩

end Summits

end NoveltyTheory
