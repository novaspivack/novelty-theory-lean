import NoveltyTheory.Core.ReducerEnumeration
import NoveltyTheory.Models.SignatureTower

/-!
# Diagonal scheduling on `ℕ` (`SPEC_009_DST`)

Row-wise **soundness** (each interface row is semantically bounded by `regimeUpto i`) lets stage `i + 1`
defeat row `i`. This is the concrete schedule behind “stage `n` defeats candidate `n`” for the
signature tower (Model A); Model B can reuse the same pattern with a different witness map.
-/

namespace NoveltyTheory

namespace Ridge

open Core Models SignatureTower

/--
Each row of `E` is **sound** for the signature regimes: whenever `E` claims an explanation at row
`i`, the corresponding `regimeUpto i` also explains the phase. Hypothesis-only (not built into
`AdmissibleInterface`).
-/
def RowSoundForSignature {υ : Type} (E : Core.AdmissibleInterface ℕ υ ℕ) : Prop :=
  ∀ (i : ℕ) (P : Phase ℕ) (v : υ), E.explains i v P → (regimeUpto i).explains P

/-- Stage `i + 1` is not explained by row `i` under row-wise signature soundness. -/
theorem not_explains_stage_singleton_succ_of_rowSound {υ : Type} (E : Core.AdmissibleInterface ℕ υ ℕ)
    (h : RowSoundForSignature E) (i : ℕ) (v : υ) :
    ¬ E.explains i v (phaseSingleton (i + 1)) := by
  intro hv
  exact not_explains_regime_singleton_succ (h i (phaseSingleton (i + 1)) v hv)

/-- **Diagonal slot:** for outer index `i`, the witness phase `phaseSingleton (i + 1)` defeats row `i`. -/
theorem diagonal_stage_defeats_row {υ : Type} (E : Core.AdmissibleInterface ℕ υ ℕ)
    (h : RowSoundForSignature E) (i : ℕ) :
    ¬ E.rowExplains i (phaseSingleton (i + 1)) := by
  rintro ⟨v, hv⟩
  exact not_explains_stage_singleton_succ_of_rowSound E h i v hv

end Ridge

end NoveltyTheory
