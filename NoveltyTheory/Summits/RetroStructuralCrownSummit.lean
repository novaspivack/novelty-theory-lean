import NoveltyTheory.Core.Sentence
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StructuralCrownFamily
import NoveltyTheory.Ridge.RetroStructuralGap

/-!
# Retro structural crown summit (`SPEC_046_CG5`)

Packages **retro V2 earlier-segment** witnesses with the **structural generator** crown chain: the same
**`ProvesAt` height** hosts both **bundled earlier-history** sentences and **output-layer structural**
ascent witnesses.
-/

namespace NoveltyTheory

namespace Summits

namespace RetroStructuralCrownSummit

open NoveltyTheory.Core
open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.StructuralCrownFamily
open NoveltyTheory.Ridge.RetroStructuralGap

theorem retro_truth_feeds_crown_family (n : ℕ) :
    (∃ φ : Sentence ℕ, IsRetroStructuralV2 φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ) ∧
      (∃ ψ : Sentence ℕ, IsStructuralGeneratorSentence ψ ∧ ProvesAt (n + 1) ψ ∧ ¬ ProvesAt n ψ) :=
  And.intro (exists_structural_retro_truth_gap n) (exists_structural_sentence_provable_succ_not_at n)

end RetroStructuralCrownSummit

end Summits

end NoveltyTheory
