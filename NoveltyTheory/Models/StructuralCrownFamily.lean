import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.StructuralCrownSentence
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Structural crown family (`SPEC_042_CG1`)

Strict **`ProvesAt`** ascent and **`HoldsAt natCounter`** for **`structuralCrownWitness`**.
-/

namespace NoveltyTheory

namespace Models

namespace StructuralCrownFamily

open NoveltyTheory.Core
open NoveltyTheory.Core.GenerativeSystem
open NoveltyTheory.Foundation.StructuralCrownSentence
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.InvariantTower
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

theorem structuralCrownWitness_proves_succ_not_at (n : ℕ) :
    ProvesAt (n + 1) (structuralCrownWitness n) ∧ ¬ ProvesAt n (structuralCrownWitness n) := by
  refine ⟨?_, ?_⟩
  · simp only [structuralCrownWitness, ProvesAt]
    exact ⟨(upward_derivability_gap n).1, (upward_trace_derivability_gap n).1⟩
  · intro h
    simp only [structuralCrownWitness, ProvesAt] at h
    exact (upward_derivability_gap n).2 h.1

theorem holdsAt_natCounter_structuralCrownWitness (n : ℕ) :
    HoldsAt natCounter (structuralCrownWitness n) := by
  simp only [structuralCrownWitness, HoldsAt]
  refine And.intro ?_ ?_
  · refine ⟨n + 1, ?_⟩
    rw [natCounter_trace]
    exact Nat.lt_succ_self n
  · rw [natCounter_trace]

theorem exists_structural_sentence_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, IsStructuralGeneratorSentence φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  ⟨structuralCrownWitness n, isStructural_structuralCrownWitness n,
    structuralCrownWitness_proves_succ_not_at n⟩

end StructuralCrownFamily

end Models

end NoveltyTheory
