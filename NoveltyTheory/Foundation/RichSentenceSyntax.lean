import Mathlib.Data.List.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Models.SentenceProvability

/-!
# Richer finite enumeration syntax (`SPEC_038_XS1`)

**`outputEnumMem`** names membership in an **explicit** list—no quantification over arbitrary
`Set ℕ`. Semantics is **`List.Mem`**; the first **`ProvesAt`** tranche keeps this fragment
**unprovable** so counterfact alignment can land in a later pass without rushing rules.

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

theorem not_provesAt_outputEnumMem {m : ℕ} (l : List ℕ) (x : ℕ) :
    ¬ ProvesAt m (Sentence.outputEnumMem l x) := by
  intro h
  simp [ProvesAt] at h

end RichSentenceSyntax

end Foundation

end NoveltyTheory
