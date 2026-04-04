import Mathlib.Data.Nat.Basic
import Mathlib.Data.List.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.SentenceExpressibility
import NoveltyTheory.Core.SentenceRegime
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.SentenceProvability

/-!
# Expressibility vs provability (`SPEC_014_ES2`)

Monotonicity of **`ExpressibleAtHeight`** and **`proves_implies_expressible`** on the **`ProvesAt`** fragment.
-/

namespace NoveltyTheory

namespace Foundation

namespace SentenceFacts

open NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.InvariantTower
open NoveltyTheory.Models.SignatureTower

theorem list_fold_trace_pair_bound_aux {m acc0 : ℕ} {l : List (ℕ × ℕ)}
    (hacc : acc0 ≤ m) (h : ∀ p ∈ l, max p.1 p.2 ≤ m) :
    (l.foldl (fun acc p => max acc (max p.1 p.2)) acc0) ≤ m := by
  induction l generalizing acc0 with
  | nil =>
      simpa using hacc
  | cons a as ih =>
      simp only [List.foldl_cons]
      refine ih (Nat.max_le.mpr ⟨hacc, h a (List.Mem.head _)⟩) (fun p hp => h p (List.Mem.tail _ hp))

theorem list_fold_trace_pair_bound {m : ℕ} {l : List (ℕ × ℕ)}
    (h : ∀ p ∈ l, max p.1 p.2 ≤ m) :
    (l.foldl (fun acc p => max acc (max p.1 p.2)) 0) ≤ m :=
  list_fold_trace_pair_bound_aux (Nat.zero_le m) h

theorem expressible_mono {h₁ h₂ : ℕ} (hle : h₁ ≤ h₂) (φ : Sentence ℕ) :
    ExpressibleAtHeight h₁ φ → ExpressibleAtHeight h₂ φ := fun h =>
  Nat.le_trans h hle

theorem mentionBound_le_of_proves {m : ℕ} (φ : Sentence ℕ) (h : ProvesAt m φ) : mentionBound φ ≤ m := by
  match φ with
  | Sentence.geOutput k =>
      simp [ProvesAt, mentionBound] at h ⊢
      rcases h with ⟨p, hp⟩
      match p with
      | Pf.ge k' hk =>
          have hk'k : k' = k := CounterFact.geOutput_inj hp
          rw [hk'k] at hk
          exact Nat.le_of_lt hk
      | Pf.trace _ _ => nomatch hp
      | Pf.phase _ _ => nomatch hp
  | Sentence.traceEq i v =>
      have h' : provesAtDepth m (CounterFact.traceEq i v) := by simpa [ProvesAt] using h
      simpa [mentionBound] using Nat.le_of_lt (provesAtDepth_maxIndex_le m i v h')
  | Sentence.histSeq l =>
      have hle : ∀ p ∈ l, max p.1 p.2 ≤ m := fun p hp =>
        Nat.le_of_lt (provesAtDepth_maxIndex_le m p.1 p.2 (h p hp))
      simpa [mentionBound, mentionBound_histSeq] using list_fold_trace_pair_bound hle
  | Sentence.phaseMem _ x =>
      rcases h with ⟨_, hpf⟩
      simp only [mentionBound]
      exact Nat.le_of_lt (provesAtDepth_le_factIndexBound hpf)
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      simp only [mentionBound]
      rw [Nat.max_le]
      exact ⟨mentionBound_le_of_proves φ hφ, mentionBound_le_of_proves ψ hψ⟩
  | Sentence.or φ ψ =>
      rcases h with (⟨hφ, hψb⟩ | ⟨hφb, hψ⟩)
      · simp only [mentionBound]; rw [Nat.max_le]
        exact ⟨mentionBound_le_of_proves φ hφ, hψb⟩
      · simp only [mentionBound]; rw [Nat.max_le]
        exact ⟨hφb, mentionBound_le_of_proves ψ hψ⟩
  | Sentence.not _ => nomatch h

theorem proves_implies_expressible {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ExpressibleAtHeight m φ :=
  mentionBound_le_of_proves φ h

theorem proves_implies_expressible_regime {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ExpressibleAt (regimeUpto m) φ :=
  (expressibleAt_regimeUpto_iff φ).2 (mentionBound_le_of_proves φ h)

end SentenceFacts

end Foundation

end NoveltyTheory
