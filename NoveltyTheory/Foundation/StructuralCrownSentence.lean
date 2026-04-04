import NoveltyTheory.Core.GeneratorTruth
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceExpressibility
import NoveltyTheory.Foundation.StructuralGeneratorSentence

/-!
# Structural crown sentences (`SPEC_042_CG1`)

**`structuralCrownWitness n`** is **`Sentence.and (geOutput n) (traceEq n n)`**: still
**`IsStructuralGeneratorSentence`**, strict **`ProvesAt`** ascent at **`n + 1` vs `n`**, but
**not** **`Sentence.geOutput n`** and **not** in the trace-diagonal ridge class
**`IsGeneratorStructural`**. Same **`mentionBound`** stratum as **`geOutput n`** — so the crown step is
not a mere stratum shift versus that atom alone.
-/

namespace NoveltyTheory

namespace Foundation

namespace StructuralCrownSentence

open NoveltyTheory.Core NoveltyTheory.Core.GeneratorTruth
open NoveltyTheory.Foundation.StructuralGeneratorSentence

/-- Conjunctive witness: output-at-**`n`** together with diagonal trace equality at **`n`**. -/
def structuralCrownWitness (n : ℕ) : Sentence ℕ :=
  Sentence.and (Sentence.geOutput n) (Sentence.traceEq n n)

theorem isStructural_structuralCrownWitness (n : ℕ) :
    IsStructuralGeneratorSentence (structuralCrownWitness n) :=
  IsStructuralGeneratorSentence.and (.geOutput n) (.traceEq_diag n)

theorem structuralCrownWitness_ne_geOutput (n : ℕ) :
    structuralCrownWitness n ≠ Sentence.geOutput n :=
  fun h => by cases h

theorem structuralCrownWitness_not_isGeneratorStructural (n : ℕ) :
    ¬ IsGeneratorStructural (structuralCrownWitness n) := by
  intro h
  rcases h with ⟨m, hm⟩
  cases hm

@[simp] theorem mentionBound_structuralCrownWitness (n : ℕ) :
    mentionBound (structuralCrownWitness n) = n := by
  simp [structuralCrownWitness, mentionBound]

/-- Same **`mentionBound`** as **`geOutput n`**, but a distinct sentence — not “pick **`geOutput`**
by stratum alone.” -/
theorem structural_crown_not_mentionBound_only (n : ℕ) :
    mentionBound (structuralCrownWitness n) = mentionBound (Sentence.geOutput n) ∧
      structuralCrownWitness n ≠ Sentence.geOutput n ∧
        IsStructuralGeneratorSentence (structuralCrownWitness n) ∧
          IsStructuralGeneratorSentence (Sentence.geOutput n) := by
  refine ⟨?_, structuralCrownWitness_ne_geOutput n, isStructural_structuralCrownWitness n, ?_⟩
  · simp [mentionBound]
  · exact .geOutput n

theorem structural_crown_not_traceEq_ridge_only (n : ℕ) :
    IsStructuralGeneratorSentence (structuralCrownWitness n) ∧
      ¬ IsGeneratorStructural (structuralCrownWitness n) :=
  ⟨isStructural_structuralCrownWitness n, structuralCrownWitness_not_isGeneratorStructural n⟩

end StructuralCrownSentence

export StructuralCrownSentence (structuralCrownWitness)

end Foundation

end NoveltyTheory
