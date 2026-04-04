import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.GeneratorTruth
import NoveltyTheory.Foundation.AscentRegime
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Foundation.UpwardNecessity
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StratifiedSentenceModel

/-!
# Crown iterated ascent (`SPEC_037_CR1`)

**`natCounter`** with **`Sentence.geOutput`** yields a **uniform** strict ascent across regimes
**`ProvesInRegime n`** (= **`ProvesAt n`**): each **`geOutput n`** is **`IsStructuralGeneratorSentence`**
and needs depth **`n + 1`** to prove. This **refines** the naked existential
`exists_sentence_provable_succ_not_at` by pinning the witness family and the structural class, and it
**extends** the trace-only ridge fragment **`IsGeneratorStructural`** (output atoms are not trace
diagonals).
-/

namespace NoveltyTheory

namespace Summits

namespace CrownIteratedAscentSummit

open NoveltyTheory.Core
open NoveltyTheory.Core.GenerativeSystem
open NoveltyTheory.Core.GeneratorTruth
open NoveltyTheory.Foundation.AscentRegime
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Foundation.UpwardNecessity
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.StratifiedSentenceModel

theorem crown_strict_ascent_at (n : ℕ) :
    IsStructuralGeneratorSentence (Sentence.geOutput n) ∧
      ProvesInRegime (n + 1) (Sentence.geOutput n) ∧
        ¬ ProvesInRegime n (Sentence.geOutput n) := by
  refine ⟨IsStructuralGeneratorSentence.geOutput n, ?_, ?_⟩
  · simpa [ProvesInRegime] using (upward_necessity_geOutput n).1
  · simpa [ProvesInRegime] using (upward_necessity_geOutput n).2

theorem crown_strict_ascent_sentence_family :
    ∃ (_ : GenerativeSystem ℕ ℕ) (Φ : ℕ → Sentence ℕ),
      (∀ n, IsStructuralGeneratorSentence (Φ n)) ∧
        ∀ n, ProvesInRegime (n + 1) (Φ n) ∧ ¬ ProvesInRegime n (Φ n) :=
  ⟨natCounter, fun k => Sentence.geOutput k, fun k => IsStructuralGeneratorSentence.geOutput k,
    fun k =>
      And.intro (by simpa [ProvesInRegime] using (upward_necessity_geOutput k).1)
        (by simpa [ProvesInRegime] using (upward_necessity_geOutput k).2)⟩

theorem crown_ascent_refines_existential_provable_gap (n : ℕ) :
    (∃ φ : Sentence ℕ, IsStructuralGeneratorSentence φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ) ∧
      (∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ) :=
  And.intro
    ⟨Sentence.geOutput n,
      And.intro (IsStructuralGeneratorSentence.geOutput n) (upward_necessity_geOutput n)⟩
    (exists_sentence_provable_succ_not_at n)

theorem geOutput_crown_not_traceEq_ridge_only (n : ℕ) :
    IsStructuralGeneratorSentence (Sentence.geOutput n) ∧
      ¬ IsGeneratorStructural (Sentence.geOutput n) :=
  ⟨IsStructuralGeneratorSentence.geOutput n, geOutput_not_isGeneratorStructural n⟩

end CrownIteratedAscentSummit

end Summits

end NoveltyTheory
