import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.NatPhaseTag
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

open GenerativeSystem Set NoveltyTheory.Models.SignatureTower

namespace GeneratorTruth

/-- Predicate marking the trace-equality atoms used in ridge packaging. -/
def IsGeneratorStructural (φ : Sentence ℕ) : Prop :=
  ∃ n : ℕ, φ = Sentence.traceEq n n

theorem isGeneratorStructural_traceEq (n : ℕ) : IsGeneratorStructural (Sentence.traceEq n n) :=
  ⟨n, rfl⟩

theorem holdsAt_natCounter_traceEq_self (n : ℕ) :
    HoldsAt natCounter (Sentence.traceEq n n) := by
  simp [HoldsAt, natCounter_trace]

theorem holdsAt_natCounter_phaseMem_singleton (n : ℕ) :
    HoldsAt natCounter (Sentence.phaseMem (singleton n) n) := by
  simp [HoldsAt, mem_singleton_iff]

theorem holdsAt_natCounter_natPhaseTagMem_sing (k : ℕ) :
    HoldsAt natCounter (Sentence.natPhaseTagMem (NatPhaseTag.sing k) k) := by
  simp [HoldsAt, NatPhaseTag.mem_sing_iff]

end GeneratorTruth

end Core

end NoveltyTheory
