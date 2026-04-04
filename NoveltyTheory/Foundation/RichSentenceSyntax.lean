import Mathlib.Data.List.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Models.SentenceProvability

/-!
# Richer finite enumeration syntax (`SPEC_038_XS1`)

**`outputEnumMem`** names membership in an **explicit** list—no quantification over arbitrary
`Set ℕ`. Semantics is **`List.Mem`**; **`ProvesAt`** rules (**`SPEC_043_CG2`**) tie **`List.Mem`**
to Model **C** **`phaseSingletonMem`** at the same depth with a **uniform** list bound.

Bridge lemmas tie singleton enumerations to existing **`phaseMem`** semantics on **`natCounter`**.
-/

namespace NoveltyTheory

namespace Foundation

namespace RichSentenceSyntax

open Set NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability
variable {S : Type}

theorem holdsAt_outputEnumMem_iff {G : GenerativeSystem S ℕ} (l : List ℕ) (x : ℕ) :
    HoldsAt G (Sentence.outputEnumMem l x) ↔ x ∈ l := by
  simp [HoldsAt]

theorem holdsAt_outputEnumMem_singleton_iff {G : GenerativeSystem S ℕ} (x : ℕ) :
    HoldsAt G (Sentence.outputEnumMem [x] x) ↔ HoldsAt G (Sentence.phaseMem (singleton x) x) := by
  simp [HoldsAt, mem_singleton_iff]

end RichSentenceSyntax

end Foundation

end NoveltyTheory
