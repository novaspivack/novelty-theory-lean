import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Models.RetroStructuralTruth

/-!
# Strong retro causation summit (`SPEC_029_RRS3`)

Bundles retro-tagged strict expressibility strata.
-/

namespace NoveltyTheory

namespace Summits

namespace StrongRetroCausationSummit

open NoveltyTheory.Models.RetroStructuralTruth NoveltyTheory.Core

theorem retro_strict_expressibility (h : ℕ) :
    ∃ φ : Sentence ℕ,
      IsRetroStructural φ ∧ ExpressibleAtHeight (h + 1) φ ∧ ¬ ExpressibleAtHeight h φ :=
  exists_retro_sentence_expressible_gap h

end StrongRetroCausationSummit

end Summits

end NoveltyTheory
