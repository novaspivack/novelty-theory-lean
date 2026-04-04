import Mathlib.Data.Nat.Basic
import Mathlib.Data.List.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.NatPhaseTag
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

theorem list_fold_mention_bound_aux {m acc0 : ℕ} {l : List (Sentence ℕ)}
    (hacc : acc0 ≤ m) (h : ∀ φ ∈ l, mentionBound φ ≤ m) :
    (l.foldl (fun acc φ => max acc (mentionBound φ)) acc0) ≤ m := by
  induction l generalizing acc0 with
  | nil =>
      simpa using hacc
  | cons φ xs ih =>
      simp only [List.foldl_cons]
      refine ih (Nat.max_le.mpr ⟨hacc, h φ (List.Mem.head _)⟩) (fun ψ hψ => h ψ (List.Mem.tail _ hψ))

theorem list_fold_mention_bound {m : ℕ} {l : List (Sentence ℕ)}
    (h : ∀ φ ∈ l, mentionBound φ ≤ m) :
    (l.foldl (fun acc φ => max acc (mentionBound φ)) 0) ≤ m :=
  list_fold_mention_bound_aux (Nat.zero_le m) h

theorem list_fold_max_le_of_forall_mem_le_aux {l : List ℕ} {m acc : ℕ}
    (hacc : acc ≤ m) (h : ∀ y ∈ l, y ≤ m) :
    l.foldl (fun a y => max a y) acc ≤ m := by
  induction l generalizing acc with
  | nil =>
      simpa using hacc
  | cons a as ih =>
      simp only [List.mem_cons, forall_eq_or_imp] at h
      rcases h with ⟨ha, has⟩
      simp only [List.foldl_cons]
      exact ih (Nat.max_le.mpr ⟨hacc, ha⟩) has

theorem list_fold_max_le_of_forall_mem_le {l : List ℕ} {m : ℕ}
    (h : ∀ y ∈ l, y ≤ m) : l.foldl (fun acc y => max acc y) 0 ≤ m :=
  list_fold_max_le_of_forall_mem_le_aux (Nat.zero_le m) h

theorem expressible_mono {h₁ h₂ : ℕ} (hle : h₁ ≤ h₂) (φ : Sentence ℕ) :
    ExpressibleAtHeight h₁ φ → ExpressibleAtHeight h₂ φ := fun h =>
  Nat.le_trans h hle

theorem mentionBound_le_of_proves {m : ℕ} (φ : Sentence ℕ) (h : ProvesAt m φ) : mentionBound φ ≤ m := by
  revert h
  cases φ with
  | geOutput k =>
      intro h
      simp [ProvesAt, mentionBound] at h ⊢
      rcases h with ⟨p, hp⟩
      match p with
      | Pf.ge k' hk =>
          have hk'k : k' = k := CounterFact.geOutput_inj hp
          rw [hk'k] at hk
          exact Nat.le_of_lt hk
      | Pf.trace _ _ => nomatch hp
      | Pf.phase _ _ => nomatch hp
  | traceEq i v =>
      intro h
      have h' : provesAtDepth m (CounterFact.traceEq i v) := by simpa [ProvesAt] using h
      simpa [mentionBound] using Nat.le_of_lt (provesAtDepth_maxIndex_le m i v h')
  | histSeq l =>
      intro h
      simp [ProvesAt] at h
      have hle : ∀ p ∈ l, max p.1 p.2 ≤ m := fun p hp =>
        Nat.le_of_lt (provesAtDepth_maxIndex_le m p.1 p.2 (h p.1 p.2 hp))
      simpa [mentionBound, mentionBound_histSeq] using list_fold_trace_pair_bound hle
  | phaseMem _ x =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨_, hpf⟩
      simp only [mentionBound]
      exact Nat.le_of_lt (provesAtDepth_le_factIndexBound hpf)
  | natPhaseTagMem tag x =>
      cases tag with
      | sing k =>
          intro h
          simp [ProvesAt] at h
          rcases h with ⟨hxk, hpf⟩
          rw [hxk, mentionBound, NatPhaseTag.bound]
          simpa using Nat.le_of_lt (provesAtDepth_le_factIndexBound hpf)
      | initial K =>
          intro h
          simp [ProvesAt] at h
          rcases h with ⟨hxK, hKm, _⟩
          simp only [mentionBound, NatPhaseTag.bound]
          rw [Nat.max_eq_left hxK]
          exact hKm
  | outputEnumMem l x =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨hxmem, hle, _⟩
      simp only [mentionBound]
      rw [Nat.max_le]
      exact ⟨list_fold_max_le_of_forall_mem_le hle, hle x hxmem⟩
  | finConj l =>
      intro h
      simp [ProvesAt] at h
      have hle : ∀ ψ ∈ l, mentionBound ψ ≤ m := fun ψ hψ =>
        mentionBound_le_of_proves ψ (h ψ hψ)
      simpa [mentionBound, mentionBound_finConj] using list_fold_mention_bound hle
  | and φ ψ =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨hφ, hψ⟩
      simp only [mentionBound]
      rw [Nat.max_le]
      exact ⟨mentionBound_le_of_proves φ hφ, mentionBound_le_of_proves ψ hψ⟩
  | or φ ψ =>
      intro h
      simp [ProvesAt] at h
      rcases h with (⟨hφ, hψb⟩ | ⟨hφb, hψ⟩)
      · simp only [mentionBound]; rw [Nat.max_le]
        exact ⟨mentionBound_le_of_proves φ hφ, hψb⟩
      · simp only [mentionBound]; rw [Nat.max_le]
        exact ⟨hφb, mentionBound_le_of_proves ψ hψ⟩
  | not _ =>
      intro h
      simp [ProvesAt] at h

theorem proves_implies_expressible {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ExpressibleAtHeight m φ :=
  mentionBound_le_of_proves φ h

theorem proves_implies_expressible_regime {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ExpressibleAt (regimeUpto m) φ :=
  (expressibleAt_regimeUpto_iff φ).2 (mentionBound_le_of_proves φ h)

end SentenceFacts

end Foundation

end NoveltyTheory
