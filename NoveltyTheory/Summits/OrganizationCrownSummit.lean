import NoveltyTheory.Core.OrganizationV2
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StructuralCrownFamily
import NoveltyTheory.Ridge.OrganizationHeightObstruction

/-!
# Organization crown summit (`SPEC_045_CG4`)

Bundles **bounded-height organization obstructions** with **structural strict ascent**: the same
world admits **ProvesAt** gaps certified by **`IsStructuralGeneratorSentence`**, while **no** separated
finite-height stage map can internally **totalize** all strict **`ℕ`** futures.
-/

namespace NoveltyTheory

namespace Summits

namespace OrganizationCrownSummit

open NoveltyTheory.Core NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.StructuralCrownFamily
open NoveltyTheory.Ridge.OrganizationHeightObstruction

set_option linter.unusedVariables false in
theorem organization_crown_supports_strict_ascent (n : ℕ) :
    (∀ {Y : Type} (org : OrganizationV2 Y) (B : ℕ),
        org.IsFiniteHeight B → ¬ TotalizesStandardFuture org) ∧
      (∃ φ : Sentence ℕ, IsStructuralGeneratorSentence φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ) :=
  And.intro
    (fun {Y} org B hfin => no_finite_adequate_organization_totalizes_future B org hfin)
    (exists_structural_sentence_provable_succ_not_at n)

end OrganizationCrownSummit

end Summits

end NoveltyTheory
