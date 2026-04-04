import NoveltyTheory.Core.Sentence
import NoveltyTheory.Foundation.UpwardNecessity
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StratifiedSentenceModel

/-!
# Unfolding necessity summit (`SPEC_018_UEN2`)

Joins **Model C** upward gap with sentence **`ProvesAt`** witnesses.
-/

namespace NoveltyTheory

namespace Summits

namespace UnfoldingNecessitySummit

open NoveltyTheory.Core NoveltyTheory.Foundation.UpwardNecessity
open NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.StratifiedSentenceModel

theorem upward_necessity_sentence (n : ℕ) :
    ProvesAt (n + 1) (Sentence.geOutput n) ∧ ¬ ProvesAt n (Sentence.geOutput n) :=
  upward_necessity_geOutput n

theorem exists_strict_provable_gap (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  exists_sentence_provable_succ_not_at n

end UnfoldingNecessitySummit

end Summits

end NoveltyTheory
