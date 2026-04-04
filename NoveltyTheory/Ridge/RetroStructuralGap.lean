import Mathlib.Data.List.Basic
import Mathlib.Data.List.Range
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Retro structural gap (`SPEC_046_CG5`)

**`histSeqUpto n`** bundles **diagonal trace facts** for the **initial segment** **`0 … n`**. It is
**sound** on **`natCounter`**, carries **earlier-segment** semantic content via **`histSeq`**, and exhibits
the same **strict `ProvesAt` ascent** pattern as diagonal **`traceEq`**—without being reducible to a
single **`traceEq (h+1) (h+1)`** shift.
-/

namespace NoveltyTheory

namespace Ridge

namespace RetroStructuralGap

open List NoveltyTheory.Core NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Models.InvariantTower NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

theorem histSeqUpto_mem_diag {n : ℕ} :
    (n, n) ∈ List.map (fun i : ℕ => (i, i)) (List.range (n + 1)) := by
  apply mem_map_of_mem
  rw [mem_range]
  exact Nat.lt_succ_self n

theorem histSeqUpto_proves_succ (n : ℕ) : ProvesAt (n + 1) (histSeqUpto n) := by
  simp only [histSeqUpto, ProvesAt]
  intro p hp
  rcases mem_map.mp hp with ⟨j, hj, rfl⟩
  have hj' : j < n + 1 := mem_range.mp hj
  exact ⟨Pf.trace j hj', rfl⟩

theorem histSeqUpto_not_proves_at (n : ℕ) : ¬ ProvesAt n (histSeqUpto n) := by
  intro h
  simp only [histSeqUpto, ProvesAt] at h
  have hn := h (n, n) histSeqUpto_mem_diag
  simpa [ProvesAt] using not_proves_trace_diag n hn

theorem histSeqUpto_proves_succ_not_at (n : ℕ) :
    ProvesAt (n + 1) (histSeqUpto n) ∧ ¬ ProvesAt n (histSeqUpto n) :=
  ⟨histSeqUpto_proves_succ n, histSeqUpto_not_proves_at n⟩

theorem exists_structural_retro_truth_gap (n : ℕ) :
    ∃ φ : Sentence ℕ,
      IsRetroStructuralV2 φ ∧ ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  ⟨histSeqUpto n, isRetroStructuralV2_histSeqUpto n, histSeqUpto_proves_succ_not_at n⟩

theorem later_regime_proves_earlier_history_truth (n : ℕ) :
    ProvesAt (n + 1) (histSeqUpto n) ∧ ¬ ProvesAt n (histSeqUpto n) :=
  histSeqUpto_proves_succ_not_at n

theorem retro_truth_sound_about_earlier_segment (n : ℕ) :
    HoldsAt natCounter (histSeqUpto n) ∧
      HistListsEarlierSegment (n + 1) (List.map (fun i : ℕ => (i, i)) (List.range (n + 1))) := by
  refine And.intro ?_ (histSeqUpto_lists_earlier_than n)
  simp only [histSeqUpto, HoldsAt]
  intro p hp
  rcases mem_map.mp hp with ⟨i, hi, rfl⟩
  simp [natCounter_trace]

theorem retro_truth_not_mentionBound_only (n : ℕ) :
    mentionBound (histSeqUpto n) = mentionBound (Sentence.geOutput n) ∧
      histSeqUpto n ≠ Sentence.geOutput n ∧ IsRetroStructuralV2 (histSeqUpto n) := by
  refine And.intro ?_ (And.intro ?_ (isRetroStructuralV2_histSeqUpto n))
  · rw [mentionBound_histSeqUpto]
    simp [mentionBound]
  · intro h
    cases h

end RetroStructuralGap

end Ridge

end NoveltyTheory
