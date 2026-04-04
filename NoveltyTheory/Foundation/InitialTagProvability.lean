import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Initial-segment nat-phase tags — derivability (`SPEC_039_DT1`)

Referencing **`SentenceProvability`** for the **`initial`** branch of **`natPhaseTagMem`** packaged here for
cross-epic linking. See module docstrings on **`ProvesAt`** for the precise side conditions; soundness is
**`proves_sentence_sound`**.
-/

namespace NoveltyTheory

namespace Foundation

namespace InitialTagProvability

open NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Foundation.ProvabilityFacts

theorem initial_endpoint (K : ℕ) :
    ProvesAt (K + 1) (Sentence.natPhaseTagMem (NatPhaseTag.initial K) K) :=
  NoveltyTheory.Models.SentenceProvability.provesAt_initial_endpoint K

theorem proves_initial_sound (m K x : ℕ) (h : ProvesAt m (Sentence.natPhaseTagMem (NatPhaseTag.initial K) x)) :
    HoldsAt natCounter (Sentence.natPhaseTagMem (NatPhaseTag.initial K) x) :=
  proves_sentence_sound h

end InitialTagProvability

end Foundation

end NoveltyTheory
