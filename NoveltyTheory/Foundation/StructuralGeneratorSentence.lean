import Mathlib.Data.List.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceExpressibility
import NoveltyTheory.Core.GeneratorTruth

/-!
# Structural generator sentences (`SPEC_035_GS1`)

Fragment of **`Sentence ℕ`** tied to **output**, **diagonal trace equality**, **singleton phase
membership**, **singleton nat-phase tags**, diagonal **`histSeq`** witnesses, binary **`and`**, and
**nonempty** **`finConj`** over the same fragment.

**Excluded (orthogonal to this class):** `or`, `not`, **`natPhaseTagMem` with `NatPhaseTag.initial`**
(current `ProvesAt` treats that tag as **unprovable**), and **empty** `finConj` (would collapse to a
bare syntactic **`True`**-sink).

`IsGeneratorStructural` (**`SPEC_017`**) is the strict **trace-diagonal** subfragment; `geOutput`
witnesses live here and **not** there—this is the **anti-collapse** axis versus “trace facts only.”
-/

namespace NoveltyTheory

namespace Foundation

namespace StructuralGeneratorSentence

open List NoveltyTheory.Core NoveltyTheory.Core.GeneratorTruth

/-- Core fragment for generator/trace-facing summit packaging (`SPEC_035_GS1`). -/
inductive IsStructuralGeneratorSentence : Sentence ℕ → Prop where
  | geOutput (k : ℕ) : IsStructuralGeneratorSentence (Sentence.geOutput k)
  | traceEq_diag (n : ℕ) : IsStructuralGeneratorSentence (Sentence.traceEq n n)
  | phaseMem_singleton (x : ℕ) :
      IsStructuralGeneratorSentence (Sentence.phaseMem (singleton x) x)
  | natPhaseTagMem_sing (k : ℕ) :
      IsStructuralGeneratorSentence (Sentence.natPhaseTagMem (NatPhaseTag.sing k) k)
  /-- Any **syntactic** list occurrence with **`x ∈ l`** (`SPEC_043_CG2`). -/
  | outputEnumMem_of_mem {l : List ℕ} {x : ℕ} (_hx : x ∈ l) :
      IsStructuralGeneratorSentence (Sentence.outputEnumMem l x)
  | and {φ ψ : Sentence ℕ} :
      IsStructuralGeneratorSentence φ →
        IsStructuralGeneratorSentence ψ →
          IsStructuralGeneratorSentence (Sentence.and φ ψ)
  | finConj {l : List (Sentence ℕ)} (hl : l ≠ [])
      (h : ∀ φ ∈ l, IsStructuralGeneratorSentence φ) :
      IsStructuralGeneratorSentence (Sentence.finConj l)

theorem outputEnumMem_singleton (x : ℕ) :
    IsStructuralGeneratorSentence (Sentence.outputEnumMem [x] x) :=
  .outputEnumMem_of_mem (by simp)

theorem isGeneratorStructural_implies {φ : Sentence ℕ} (h : IsGeneratorStructural φ) :
    IsStructuralGeneratorSentence φ := by
  rcases h with ⟨n, rfl⟩
  exact .traceEq_diag n

theorem geOutput_not_isGeneratorStructural (n : ℕ) :
    ¬ IsGeneratorStructural (Sentence.geOutput n) := by
  rintro ⟨m, hm⟩
  cases hm

theorem natPhaseTagMem_initial_not_structural (K x : ℕ) :
    ¬ IsStructuralGeneratorSentence (Sentence.natPhaseTagMem (NatPhaseTag.initial K) x) := by
  intro h
  cases h

/-- Empty `finConj` is **not** in the fragment (no trivial-true sink). -/
theorem not_structural_finConj_nil : ¬ IsStructuralGeneratorSentence (Sentence.finConj []) := by
  intro h
  cases h with
  | finConj hl _ =>
    exact hl rfl

/-- Same `mentionBound` does **not** classify structural status: both sit at **0** when `K = x = 0`. -/
theorem mention_bound_neither_implies_structural_nor_nonstructural :
    ∃ φ ψ : Sentence ℕ,
      mentionBound φ = mentionBound ψ ∧
        IsStructuralGeneratorSentence φ ∧
          ¬ IsStructuralGeneratorSentence ψ :=
  ⟨Sentence.geOutput 0, Sentence.natPhaseTagMem (NatPhaseTag.initial 0) 0,
   And.intro (by simp [mentionBound, NatPhaseTag.bound])
     (And.intro (.geOutput 0) (natPhaseTagMem_initial_not_structural 0 0))⟩

end StructuralGeneratorSentence

export StructuralGeneratorSentence (IsStructuralGeneratorSentence)

end Foundation

end NoveltyTheory
