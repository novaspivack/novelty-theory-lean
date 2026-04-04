import NoveltyTheory.Core.Tower
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.BoundedRegimeDiagonal

/-!
# Model B — reducer / regime enumeration diagonal (`SPEC_012_MDL`, `SPEC_009_DST`)

An **enumerated** regime ladder `c n` that agrees with Model A’s `regimeUpto` inherits the same
infinite paradigm steps and the same **stage-wise diagonal**: candidate `n` fails on
`phaseSingleton (n + 1)`. This isolates the “defeat enumerator index `n` at stage `n + 1`” pattern
for other witness maps without changing the signature-tier geometry.
-/

namespace NoveltyTheory

namespace Models

namespace ReducerDiagonal

open Core SignatureTower BoundedRegimeDiagonal

/-- Enumeration matches the canonical signature regimes at each height. -/
def EnumAgreesUpto (c : ℕ → ExplanatoryRegime ℕ) : Prop :=
  ∀ n, c n = regimeUpto n

/-- Tower with enumerated regimes; phases stay the singleton ladder. -/
def diagonalTower (c : ℕ → ExplanatoryRegime ℕ) : PhaseRegimeTower ℕ where
  phase := phaseSingleton
  regime := c

theorem enum_diagonal_step {c : ℕ → ExplanatoryRegime ℕ} (hc : EnumAgreesUpto c) (n : ℕ) :
    ¬ (c n).explains (phaseSingleton (n + 1)) := by
  rw [hc n]
  exact @not_explains_regime_singleton_succ n

theorem diagonalTower_generatedThroughout (c : ℕ → ExplanatoryRegime ℕ) :
    (diagonalTower c).generatedThroughout natCounter := by
  intro n
  simpa [diagonalTower, PhaseRegimeTower.generatedThroughout] using natCounter_generated n

theorem diagonalTower_paradigmShiftSteps_of_agrees {c : ℕ → ExplanatoryRegime ℕ}
    (hc : EnumAgreesUpto c) : (diagonalTower c).paradigmShiftSteps := by
  intro n
  dsimp [PhaseRegimeTower.paradigmShiftSteps, diagonalTower]
  simpa [hc n, hc (n + 1)] using paradigmShift_succ n

theorem canonicalEnum_agrees : EnumAgreesUpto regimeUpto :=
  fun _ => rfl

/-- Agreement with `regimeUpto` implies the **abstract** singleton bound hypothesis. -/
theorem singletonWithin_of_enum_agrees {c : ℕ → ExplanatoryRegime ℕ} (hc : EnumAgreesUpto c) :
    RegimeFamilySingletonWithin c := fun n => by
  rw [hc n]
  exact regimeUpto_adequate_singletonWithin n

/-- Packaging: agreed enumeration + diagonal + shifts + generation (**`SPEC_012_MDL` Model B**). -/
theorem modelB_enumerated_diagonal_package (c : ℕ → ExplanatoryRegime ℕ) (hc : EnumAgreesUpto c) :
    (diagonalTower c).generatedThroughout natCounter ∧
      (diagonalTower c).paradigmShiftSteps ∧
        ∀ n, ¬ (c n).explains (phaseSingleton (n + 1)) :=
  And.intro (diagonalTower_generatedThroughout c)
    (And.intro (diagonalTower_paradigmShiftSteps_of_agrees hc) fun n => enum_diagonal_step hc n)

end ReducerDiagonal

end Models

end NoveltyTheory
