import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.InvariantTower

/-!
# Expressibility vs provability (`SPEC_014_ES2`)

Monotonicity of **`ExpressibleAtHeight`** and **`proves_implies_expressible`** on the **`ProvesAt`** fragment.
-/

namespace NoveltyTheory

namespace Foundation

namespace SentenceFacts

open NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.InvariantTower

theorem expressible_mono {h₁ h₂ : ℕ} (hle : h₁ ≤ h₂) (φ : Sentence ℕ) :
    ExpressibleAtHeight h₁ φ → ExpressibleAtHeight h₂ φ := fun h =>
  Nat.le_trans h hle

theorem mentionBound_le_of_proves {m : ℕ} (φ : Sentence ℕ) (h : ProvesAt m φ) : mentionBound φ ≤ m := by
  match φ with
  | Sentence.geOutput k =>
      simp [ProvesAt, mentionBound] at h ⊢
      rcases h with ⟨p, hp⟩
      rw [Pf.fact] at hp
      have hk : p.val = k := CounterFact.geOutput_inj hp
      subst hk
      exact Nat.le_of_lt p.prop
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      simp only [mentionBound]
      rw [Nat.max_le]
      exact ⟨mentionBound_le_of_proves φ hφ, mentionBound_le_of_proves ψ hψ⟩
  | Sentence.or φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      simp only [mentionBound]
      rw [Nat.max_le]
      exact ⟨mentionBound_le_of_proves φ hφ, mentionBound_le_of_proves ψ hψ⟩
  | Sentence.phaseMem _ _ => nomatch h
  | Sentence.traceEq _ _ => nomatch h

theorem proves_implies_expressible {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ExpressibleAtHeight m φ :=
  mentionBound_le_of_proves φ h

end SentenceFacts

end Foundation

end NoveltyTheory
