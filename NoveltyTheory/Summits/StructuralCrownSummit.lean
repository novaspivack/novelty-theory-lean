import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.GeneratorTruth
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Foundation.AscentRegime
import NoveltyTheory.Foundation.StructuralCrownSentence
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StructuralCrownFamily
import NoveltyTheory.Models.StratifiedSentenceModel

/-!
# Structural crown summit (`SPEC_042_CG1`)

**`structuralCrownWitness`** yields strict iterated ascent under **`ProvesInRegime`**, refines the bare
existential gap, and is **not** **`geOutput`** / pure trace-ridge / mention-stratum-alone.
-/

namespace NoveltyTheory

namespace Summits

namespace StructuralCrownSummit

open NoveltyTheory.Core
open NoveltyTheory.Core.GeneratorTruth
open NoveltyTheory.Core.GenerativeSystem
open NoveltyTheory.Foundation.AscentRegime
open NoveltyTheory.Foundation.StructuralCrownSentence
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.StructuralCrownFamily
open NoveltyTheory.Models.StratifiedSentenceModel

theorem structural_sentence_strict_ascent_at (n : ℕ) :
    IsStructuralGeneratorSentence (structuralCrownWitness n) ∧
      ProvesInRegime (n + 1) (structuralCrownWitness n) ∧
        ¬ ProvesInRegime n (structuralCrownWitness n) := by
  rcases structuralCrownWitness_proves_succ_not_at n with ⟨hp, hn⟩
  exact ⟨isStructural_structuralCrownWitness n, by simpa [ProvesInRegime] using hp,
    by simpa [ProvesInRegime] using hn⟩

theorem structural_sentence_crown_family :
    ∃ (_ : GenerativeSystem ℕ ℕ) (Φ : ℕ → Sentence ℕ),
      (∀ n, IsStructuralGeneratorSentence (Φ n)) ∧
        ∀ n, ProvesInRegime (n + 1) (Φ n) ∧ ¬ ProvesInRegime n (Φ n) :=
  ⟨natCounter, structuralCrownWitness, fun n => isStructural_structuralCrownWitness n, fun n =>
    And.intro (by simpa [ProvesInRegime] using (structuralCrownWitness_proves_succ_not_at n).1)
      (by simpa [ProvesInRegime] using (structuralCrownWitness_proves_succ_not_at n).2)⟩

theorem structural_crown_refines_bare_provable_gap (n : ℕ) :
    (∃ φ : Sentence ℕ,
        IsStructuralGeneratorSentence φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ) ∧
      (∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ) :=
  And.intro
    ⟨structuralCrownWitness n,
      And.intro (isStructural_structuralCrownWitness n) (structuralCrownWitness_proves_succ_not_at n)⟩
    (exists_sentence_provable_succ_not_at n)

theorem structural_crown_not_traceEq_ridge_only (n : ℕ) :
    IsStructuralGeneratorSentence (structuralCrownWitness n) ∧
      ¬ IsGeneratorStructural (structuralCrownWitness n) :=
  NoveltyTheory.Foundation.StructuralCrownSentence.structural_crown_not_traceEq_ridge_only n

theorem structural_crown_not_mentionBound_only (n : ℕ) :
    mentionBound (structuralCrownWitness n) = mentionBound (Sentence.geOutput n) ∧
      structuralCrownWitness n ≠ Sentence.geOutput n ∧
        IsStructuralGeneratorSentence (structuralCrownWitness n) ∧
          IsStructuralGeneratorSentence (Sentence.geOutput n) :=
  NoveltyTheory.Foundation.StructuralCrownSentence.structural_crown_not_mentionBound_only n

theorem exists_structural_sentence_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, IsStructuralGeneratorSentence φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  NoveltyTheory.Models.StructuralCrownFamily.exists_structural_sentence_provable_succ_not_at n

end StructuralCrownSummit

end Summits

end NoveltyTheory
