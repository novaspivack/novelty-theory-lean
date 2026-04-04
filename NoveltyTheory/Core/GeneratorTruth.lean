import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Models.SignatureTower

/-!
# Generator structural truths (`SPEC_017_UEN1`)

Trace-equality atoms are **structural** for the standard counter model; they **`HoldsAt`** under
the identity trace law.
-/

namespace NoveltyTheory

namespace Core

open GenerativeSystem NoveltyTheory.Models.SignatureTower

namespace GeneratorTruth

/-- Predicate marking the trace-equality atoms used in ridge packaging. -/
def IsGeneratorStructural (φ : Sentence ℕ) : Prop :=
  ∃ n : ℕ, φ = Sentence.traceEq n n

theorem isGeneratorStructural_traceEq (n : ℕ) : IsGeneratorStructural (Sentence.traceEq n n) :=
  ⟨n, rfl⟩

theorem holdsAt_natCounter_traceEq_self (n : ℕ) :
    HoldsAt natCounter (Sentence.traceEq n n) := by
  simp [HoldsAt, natCounter_trace]

end GeneratorTruth

end Core

end NoveltyTheory
