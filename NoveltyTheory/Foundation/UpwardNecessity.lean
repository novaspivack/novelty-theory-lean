import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SentenceProvability

/-!
# Upward necessity (`SPEC_018_UEN2`)

Packages the strict **`ProvesAt`** gap one **depth** higher, matching **`upward_derivability_gap`**.
-/

namespace NoveltyTheory

namespace Foundation

namespace UpwardNecessity

open NoveltyTheory.Core NoveltyTheory.Models.InvariantTower NoveltyTheory.Models.SentenceProvability

theorem upward_necessity_geOutput (n : ℕ) :
    ProvesAt (n + 1) (Sentence.geOutput n) ∧ ¬ ProvesAt n (Sentence.geOutput n) := by
  simpa [ProvesAt] using upward_derivability_gap n

end UpwardNecessity

end Foundation

end NoveltyTheory
