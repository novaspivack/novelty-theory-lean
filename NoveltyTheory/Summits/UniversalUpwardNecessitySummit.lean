import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StratifiedFinality
import NoveltyTheory.Ridge.UniversalUpwardNecessity

/-!
# Universal upward necessity summit (`SPEC_063_CMI4`)

Packages strict-gap navigation and the **numeric universal obstruction** for `FutureDefeat`.
-/

namespace NoveltyTheory

namespace Summits

namespace UniversalUpwardNecessitySummit

open NoveltyTheory.Core NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.StratifiedFinality

theorem exhibited_strict_retro_gap (n : ℕ) :
    ProvesAt (n + 1) (histSeqUpto n) ∧ ¬ ProvesAt n (histSeqUpto n) := by
  exact Ridge.UniversalUpwardNecessity.exhibited_strict_retro_gap n

/-- Numeric-layer obstruction: `FutureDefeat` is not universal over all generators (see `SPEC_063`). -/
theorem upward_necessity_universal_obstruction :
    ¬ ∀ (S : Type) (G : GenerativeSystem S ℕ), FutureDefeat G := by
  exact Ridge.UniversalUpwardNecessity.upward_necessity_universal_obstruction

end UniversalUpwardNecessitySummit

end Summits

end NoveltyTheory
