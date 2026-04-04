import NoveltyTheory.Core.ExplanatoryRegime
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.BoundedRegimeDiagonal
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StratifiedSentenceModel

/-!
# Organization summit (`SPEC_023_AO4`)

Re-packages **no uniform finite** obstruction templates: singleton ladder diagonal and proof-height
gap at **`ProvesAt`**.
-/

namespace NoveltyTheory

namespace Summits

namespace OrganizationSummit

open NoveltyTheory.Core NoveltyTheory.Models.BoundedRegimeDiagonal NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.StratifiedSentenceModel

theorem no_finite_singleton_bound_explains_next (c : ℕ → ExplanatoryRegime ℕ)
    (h : RegimeFamilySingletonWithin c) (n : ℕ) :
    ¬ (c n).explains (phaseSingleton (n + 1)) :=
  family_diagonal_of_singletonWithin c h n

theorem universal_sentence_proof_height_gap (k : ℕ) :
    ∃ φ : Sentence ℕ, ¬ ProvesAt k φ :=
  universal_no_sentence_proof_at_own_bound k

end OrganizationSummit

end Summits

end NoveltyTheory
