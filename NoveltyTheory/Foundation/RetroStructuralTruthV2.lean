import Mathlib.Data.List.Basic
import Mathlib.Data.List.Range
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceExpressibility

/-!
# Retro structural truth V2 — earlier-segment history (`SPEC_046_CG5`)

**`IsRetroStructuralV2`** classifies **diagonal history bundles** (**`histSeq`**, every listed pair is a
**trace equality** witness **`(i,i)`**) together with an explicit **earlier-than** cutoff: every
listed time index is **strictly below** some finite **`bound`**.

This is **not** a mere **`traceEq` depth reindexing**: the sentence simultaneously pins **many**
earlier time coordinates via **`histSeq`**, not a single **`traceEq (h+1) (h+1)`** shift.
-/

namespace NoveltyTheory

namespace Foundation

namespace RetroStructuralTruthV2

open List NoveltyTheory.Core

/-- Every listed observation time lies strictly below **`bound`**. -/
def HistListsEarlierSegment (bound : ℕ) (l : List (ℕ × ℕ)) : Prop :=
  ∀ p ∈ l, p.1 < bound

/--
Retro V2 fragment: **nontrivial** diagonal **`histSeq`** whose times are confined to an explicit
earlier segment **`[0, bound)`**.
-/
def IsRetroStructuralV2 (φ : Sentence ℕ) : Prop :=
  match φ with
  | Sentence.histSeq l =>
      l ≠ [] ∧ (∀ p ∈ l, p.1 = p.2) ∧ (∃ bound : ℕ, HistListsEarlierSegment bound l)
  | Sentence.and φ ψ => IsRetroStructuralV2 φ ∧ IsRetroStructuralV2 ψ
  | Sentence.finConj L => ∀ ψ ∈ L, IsRetroStructuralV2 ψ
  | _ => False

/-- Canonical **initial-segment diagonal history**: **`trace i = i`** for **`i < n + 1`**. -/
def histSeqUpto (n : ℕ) : Sentence ℕ :=
  Sentence.histSeq (List.map (fun i : ℕ => (i, i)) (List.range (n + 1)))

theorem isRetroStructuralV2_histSeqUpto (n : ℕ) : IsRetroStructuralV2 (histSeqUpto n) := by
  simp only [IsRetroStructuralV2, histSeqUpto]
  refine And.intro ?_ (And.intro ?_ ?_)
  · refine List.ne_nil_of_mem (a := (0, 0)) ?_
    refine mem_map_of_mem (f := fun i : ℕ => (i, i)) ?_
    simpa [mem_range] using Nat.succ_pos n
  · intro p hp
    rcases mem_map.mp hp with ⟨i, hi, rfl⟩
    rfl
  · refine ⟨n + 1, ?_⟩
    intro p hp
    rcases mem_map.mp hp with ⟨i, hi, rfl⟩
    simpa using mem_range.mp hi

theorem histSeqUpto_lists_earlier_than (n : ℕ) :
    HistListsEarlierSegment (n + 1) (List.map (fun i : ℕ => (i, i)) (List.range (n + 1))) :=
  fun p hp => by
    rcases mem_map.mp hp with ⟨i, hi, rfl⟩
    simpa using mem_range.mp hi

theorem mentionBound_histSeqUpto (n : ℕ) : mentionBound (histSeqUpto n) = n := by
  simp only [histSeqUpto, mentionBound_histSeq]
  induction n with
  | zero =>
      simp [List.range_succ, List.map, List.foldl]
  | succ n ih =>
      rw [List.range_succ, List.map_append, List.foldl_append]
      simp only [List.map_cons, List.map_nil, List.foldl]
      rw [ih]
      rw [Nat.max_self (a := n + 1)]
      exact Nat.max_eq_right (Nat.le_succ n)

end RetroStructuralTruthV2

end Foundation

end NoveltyTheory
