import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Output-enumeration provability (`SPEC_043_CG2`)

**`ProvesAt`** on **`outputEnumMem l x`** packages **`x ∈ l`**, a **uniform depth bound** on list
entries, and Model **C** **`phaseSingletonMem x`** at **`m`**. Soundness is **`List.Mem`** on the
enumeration—strictly richer than **`False`**.

Previous **`SPEC_038`** vacuity lemmas are **obsolete** once this clause is live; the calculus is
extended here rather than treated as permanently unprovable.
-/

namespace NoveltyTheory

namespace Foundation

namespace OutputEnumProvability

open NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Foundation.ProvabilityFacts

theorem provesAt_outputEnumMem_sound {m : ℕ} {l : List ℕ} {x : ℕ}
    (h : ProvesAt m (Sentence.outputEnumMem l x)) :
    HoldsAt natCounter (Sentence.outputEnumMem l x) :=
  proves_sentence_sound h

theorem provesAt_outputEnumMem_mono {m n : ℕ} (hmn : m ≤ n) {l : List ℕ} {x : ℕ}
    (h : ProvesAt m (Sentence.outputEnumMem l x)) :
    ProvesAt n (Sentence.outputEnumMem l x) :=
  proves_mono_sentence hmn h

end OutputEnumProvability

end Foundation

end NoveltyTheory
