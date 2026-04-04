import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.InvariantTower

/-!
# Sentence-level derivability (`SPEC_014_ES2`, `SPEC_010_UEN`)

**`ProvesAt m φ`** extends Model C **`provesAtDepth`** on `CounterFact.geOutput` atoms; conjunction
requires both sides; disjunction has **genuine** `∨` introduction, with the **unused** disjunct
still **mentioned** only below the depth bound (**`mentionBound ψ ≤ m`** / **`mentionBound φ ≤ m`**) so
**`proves_implies_expressible`** continues to hold.

**`histSeq l`:** until atomic **`traceEq`** belongs to the **`CounterFact`** calculus, the only
**`ProvesAt`**-derivable bundles are **empty** (`∀ p ∈ l, False` agrees with **`l = []`**).
-/

namespace NoveltyTheory

namespace Models

namespace SentenceProvability

open NoveltyTheory.Core InvariantTower

def ProvesAt (m : ℕ) : Sentence ℕ → Prop
  | Sentence.geOutput k => provesAtDepth m (CounterFact.geOutput k)
  | Sentence.histSeq l => ∀ p ∈ l, False
  | Sentence.and φ ψ => ProvesAt m φ ∧ ProvesAt m ψ
  | Sentence.or φ ψ =>
      (ProvesAt m φ ∧ mentionBound ψ ≤ m) ∨ (mentionBound φ ≤ m ∧ ProvesAt m ψ)
  | Sentence.phaseMem _ _ => False
  | Sentence.traceEq _ _ => False
  | Sentence.not _ => False

theorem ProvesAt_geOutput_iff {m k : ℕ} :
    ProvesAt m (Sentence.geOutput k) ↔ provesAtDepth m (CounterFact.geOutput k) := by
  simp [ProvesAt]

theorem proves_mono_sentence {m n : ℕ} (hmn : m ≤ n) {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ProvesAt n φ := by
  match φ with
  | Sentence.geOutput k =>
      have h' : provesAtDepth m (CounterFact.geOutput k) := by simpa [ProvesAt] using h
      simpa [ProvesAt] using proves_mono hmn h'
  | Sentence.histSeq l =>
      exact fun p hp => h p hp
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact ⟨proves_mono_sentence hmn hφ, proves_mono_sentence hmn hψ⟩
  | Sentence.or φ ψ =>
      rcases h with (⟨hφ, hψb⟩ | ⟨hφb, hψ⟩)
      · exact Or.inl ⟨proves_mono_sentence hmn hφ, Nat.le_trans hψb hmn⟩
      · exact Or.inr ⟨Nat.le_trans hφb hmn, proves_mono_sentence hmn hψ⟩
  | Sentence.phaseMem _ _ =>
      exact False.elim h
  | Sentence.traceEq _ _ =>
      exact False.elim h
  | Sentence.not _ =>
      exact False.elim h

end SentenceProvability

end Models

end NoveltyTheory
