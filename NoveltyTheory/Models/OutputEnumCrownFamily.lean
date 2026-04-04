import Mathlib.Data.List.Range
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.AscentRegime
import NoveltyTheory.Foundation.OutputEnumProvability
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Output-enumeration crown family (`SPEC_043_CG2`)

Witness **`outputEnumCrownWitness n`** uses **`List.range (n + 2)`**: membership **`n ∈ l`** holds, but
the list contains **`n + 1`**, so the **uniform** **`y ≤ m`** side condition fails at **`m = n`** while
Model **C** proves **`phaseSingletonMem n`** at **`n + 1`**. The sentence is **`IsStructuralGeneratorSentence`**
yet **not** **`phaseMem`** or **`geOutput`** (constructor disjointness).
-/

namespace NoveltyTheory

namespace Models

namespace OutputEnumCrownFamily

open List NoveltyTheory.Core
open NoveltyTheory.Core.GenerativeSystem
open NoveltyTheory.Foundation.AscentRegime
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.InvariantTower
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

/-- Finite-list strict-ascent witness anchored at **`n`** with **[`0`, …, `n+1`]** named outputs. -/
def outputEnumCrownWitness (n : ℕ) : Sentence ℕ :=
  Sentence.outputEnumMem (List.range (n + 2)) n

theorem mem_range_self_lt_add_two (n : ℕ) : n ∈ List.range (n + 2) :=
  mem_range.2 (Nat.lt_trans (Nat.lt_succ_self n) (Nat.lt_succ_self (n + 1)))

theorem forall_mem_range_le_succ_self (n : ℕ) :
    ∀ y ∈ List.range (n + 2), y ≤ n + 1 := by
  intro y hy
  simpa [mem_range] using Nat.le_of_lt_succ (mem_range.mp hy)

theorem isStructural_outputEnumCrownWitness (n : ℕ) :
    IsStructuralGeneratorSentence (outputEnumCrownWitness n) :=
  .outputEnumMem_of_mem (mem_range_self_lt_add_two n)

theorem outputEnumCrownWitness_proves_succ_not_at (n : ℕ) :
    ProvesAt (n + 1) (outputEnumCrownWitness n) ∧ ¬ ProvesAt n (outputEnumCrownWitness n) := by
  refine ⟨?_, ?_⟩
  · simp only [outputEnumCrownWitness, ProvesAt]
    refine And.intro (mem_range_self_lt_add_two n) ?_
    refine And.intro ?_ ?_
    · exact forall_mem_range_le_succ_self n
    · simpa using (upward_phase_derivability_gap n).1
  · intro h
    simp only [outputEnumCrownWitness, ProvesAt] at h
    rcases h with ⟨_, hle, _⟩
    have hn1 : n + 1 ∈ List.range (n + 2) := by
      simp [mem_range]
    have := hle (n + 1) hn1
    exact Nat.not_succ_le_self n this

theorem holdsAt_natCounter_outputEnumCrownWitness (n : ℕ) :
    HoldsAt natCounter (outputEnumCrownWitness n) := by
  simp [outputEnumCrownWitness, HoldsAt]

theorem exists_outputEnumMem_provable_gap (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  ⟨outputEnumCrownWitness n, outputEnumCrownWitness_proves_succ_not_at n⟩

theorem outputEnumMem_crown_family :
    ∃ (_ : GenerativeSystem ℕ ℕ) (Φ : ℕ → Sentence ℕ),
      (∀ n, IsStructuralGeneratorSentence (Φ n)) ∧
        ∀ n, ProvesInRegime (n + 1) (Φ n) ∧ ¬ ProvesInRegime n (Φ n) :=
  ⟨natCounter, outputEnumCrownWitness, fun n => isStructural_outputEnumCrownWitness n, fun n =>
    And.intro (by simpa [ProvesInRegime] using (outputEnumCrownWitness_proves_succ_not_at n).1)
      (by simpa [ProvesInRegime] using (outputEnumCrownWitness_proves_succ_not_at n).2)⟩

theorem outputEnumMem_not_phaseSingleton_abbrev (n : ℕ) :
    outputEnumCrownWitness n ≠ Sentence.phaseMem (singleton n) n :=
  fun h => by cases h

theorem outputEnumMem_not_geOutput_abbrev (n : ℕ) :
    outputEnumCrownWitness n ≠ Sentence.geOutput n :=
  fun h => by cases h

end OutputEnumCrownFamily

end Models

end NoveltyTheory
