import NoveltyTheory.Core.Phase

/-!
# Explanatory regimes (`SPEC_005_EXR`)

A regime carries a description type and an **adequacy** judgment `Adequate d P`.
Regime-level **explains** means some description is adequate for the phase.
-/

namespace NoveltyTheory

namespace Core

universe u

structure ExplanatoryRegime (X : Type u) where
  /-- Descriptions / sentences / codes hosted by this regime. -/
  Desc : Type u
  /-- Adequacy: description `d` captures the phase’s certified structure strongly enough. -/
  Adequate : Desc → Phase X → Prop

namespace ExplanatoryRegime

variable {X : Type u}

/-- Some description in the regime explains the phase. -/
def explains (R : ExplanatoryRegime X) (P : Phase X) : Prop :=
  ∃ d : R.Desc, R.Adequate d P

end ExplanatoryRegime

end Core

end NoveltyTheory
