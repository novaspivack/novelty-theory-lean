import NoveltyTheory.Core.ParadigmShift

/-!
# Towers (`SPEC_003_RCT`, `SPEC_009_DST` scaffolding)

Bookkeeping for indexed phases + regimes used in ridge/summit statements.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {X : Type u}

/-- An infinite phase/regime ladder over the same output type. -/
structure PhaseRegimeTower (X : Type u) where
  phase : ℕ → Phase X
  regime : ℕ → ExplanatoryRegime X

/-- Every listed phase is on the same generator trace. -/
def PhaseRegimeTower.generatedThroughout {S : Type u} (T : PhaseRegimeTower X)
    (G : GenerativeSystem S X) : Prop :=
  ∀ n, (T.phase n).generatedBy G

/-- Stage-wise paradigm shift with the standard finite prefix history. -/
def PhaseRegimeTower.paradigmShiftSteps (T : PhaseRegimeTower X) : Prop :=
  ∀ n : ℕ,
    ParadigmShift (T.regime n) (T.regime (n + 1))
      ((List.range (n + 1)).map fun i => T.phase i) (T.phase (n + 1))

/-- Ridge/spec phrasing: the standard finite-prefix paradigm chain (`SPEC_008_PSH`). -/
abbrev PhaseRegimeTower.IsParadigmChain (T : PhaseRegimeTower X) : Prop :=
  T.paradigmShiftSteps

@[simp] theorem PhaseRegimeTower.paradigmShiftSteps_eq_isChain (T : PhaseRegimeTower X) :
    T.paradigmShiftSteps ↔ T.IsParadigmChain :=
  Iff.rfl

end Core

end NoveltyTheory
