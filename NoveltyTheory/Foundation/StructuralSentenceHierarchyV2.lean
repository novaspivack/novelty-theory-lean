import NoveltyTheory.Core.SentenceExpressibility
import NoveltyTheory.Core.SentenceHierarchyV2
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Ridge.RetroStructuralGap

/-!
# Anti-collapse facts for **`IsStructuralSentenceV2`** (`SPEC_049_GC2`).
-/

namespace NoveltyTheory

namespace Foundation

namespace StructuralSentenceHierarchyV2

open NoveltyTheory.Core NoveltyTheory.Core.SentenceHierarchyV2
open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Ridge.RetroStructuralGap

/-- Backward-compatible naming: **legacy generator-structural** sentences lie in **`IsStructuralSentenceV2`**. -/
theorem isStructuralV2_implies_structural (φ : Sentence ℕ)
    (hLegacy : IsStructuralGeneratorSentence φ) :
    IsStructuralSentenceV2 φ :=
  isStructuralGenerator_implies_structuralV2 hLegacy

theorem exists_structuralV2_sentence_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, IsStructuralSentenceV2 φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  ⟨histSeqUpto n, Or.inr (isRetroStructuralV2_histSeqUpto n),
    (histSeqUpto_proves_succ_not_at n).1, (histSeqUpto_proves_succ_not_at n).2⟩

theorem structuralV2_hist_not_geOutput_only : ∃ n : ℕ, IsStructuralSentenceV2 (histSeqUpto n) ∧
    ∀ k, histSeqUpto n ≠ Sentence.geOutput k :=
  ⟨0, Or.inr (isRetroStructuralV2_histSeqUpto 0), fun _ h => by cases h⟩

theorem structuralV2_hist_not_traceEq_only : ∃ n : ℕ, IsStructuralSentenceV2 (histSeqUpto n) ∧
    ∀ i v, histSeqUpto n ≠ Sentence.traceEq i v :=
  ⟨1, Or.inr (isRetroStructuralV2_histSeqUpto 1), fun _ _ h => by cases h⟩

theorem structuralV2_not_mentionBound_only (n : ℕ) :
    mentionBound (histSeqUpto n) = mentionBound (Sentence.geOutput n) ∧
      histSeqUpto n ≠ Sentence.geOutput n ∧ IsStructuralSentenceV2 (histSeqUpto n) :=
  And.intro (retro_truth_not_mentionBound_only n).1
    (And.intro (retro_truth_not_mentionBound_only n).2.1
      (Or.inr (retro_truth_not_mentionBound_only n).2.2))

theorem structuralV2_crown_family :
    ∃ Φ : ℕ → Sentence ℕ, ∀ n, IsStructuralSentenceV2 (Φ n) ∧
      ProvesAt (n + 1) (Φ n) ∧ ¬ ProvesAt n (Φ n) :=
  ⟨histSeqUpto, fun n =>
    ⟨Or.inr (isRetroStructuralV2_histSeqUpto n), (histSeqUpto_proves_succ_not_at n).1,
      (histSeqUpto_proves_succ_not_at n).2⟩⟩

end StructuralSentenceHierarchyV2

end Foundation

end NoveltyTheory
