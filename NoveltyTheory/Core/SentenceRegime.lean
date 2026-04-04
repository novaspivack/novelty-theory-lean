import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.ExplanatoryRegime
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceExpressibility
import NoveltyTheory.Models.SignatureTower

/-!
# Regime-indexed sentence expressibility (`SPEC_012` / `004_IMPROVEMENTS`)

**`ExpressibleAt R φ`**: every numeral tagging a sentential atom is within the regime’s
singleton-explanation span. This is **structural** (via `mentionBound` + `phaseSingleton`); it does
not reintroduce the conclusion as a hidden definition.
-/

namespace NoveltyTheory

namespace Core

open NoveltyTheory.Models.SignatureTower

/-- Every clock/value tag `k` appearing in `φ` lies in the singleton ladder explained by `R`. -/
def ExpressibleAt (R : ExplanatoryRegime ℕ) (φ : Sentence ℕ) : Prop :=
  ∀ k ≤ mentionBound φ, R.explains (phaseSingleton k)

theorem expressibleAt_regimeUpto_iff {n : ℕ} (φ : Sentence ℕ) :
    ExpressibleAt (regimeUpto n) φ ↔ mentionBound φ ≤ n := by
  constructor
  · intro h
    exact (regimeUpto_explains_singleton (n := n) (k := mentionBound φ)).1
      (h (mentionBound φ) (Nat.le_refl _))
  · intro hn k hk
    exact (regimeUpto_explains_singleton (n := n) (k := k)).2 (Nat.le_trans hk hn)

theorem expressibleAtHeight_iff_expressible_regime {h : ℕ} (φ : Sentence ℕ) :
    ExpressibleAtHeight h φ ↔ ExpressibleAt (regimeUpto h) φ := by
  simp [ExpressibleAtHeight, expressibleAt_regimeUpto_iff]

end Core

end NoveltyTheory
