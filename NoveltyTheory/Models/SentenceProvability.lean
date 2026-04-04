import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.InvariantTower

/-!
# Sentence-level derivability (`SPEC_014_ES2`, `SPEC_010_UEN`)

**`ProvesAt m φ`** extends Model C **`provesAtDepth`** on `CounterFact.geOutput` atoms; conjunction
requires both sides; disjunction requires **both** sides so **`mentionBound (φ or ψ) ≤ m`** follows
from subproofs (a pure `∨` introduction would not control the unused disjunct’s numerals).
-/

namespace NoveltyTheory

namespace Models

namespace SentenceProvability

open NoveltyTheory.Core InvariantTower

def ProvesAt (m : ℕ) : Sentence ℕ → Prop
  | Sentence.geOutput k => provesAtDepth m (CounterFact.geOutput k)
  | Sentence.and φ ψ => ProvesAt m φ ∧ ProvesAt m ψ
  | Sentence.or φ ψ => ProvesAt m φ ∧ ProvesAt m ψ
  | Sentence.phaseMem _ _ => False
  | Sentence.traceEq _ _ => False

theorem ProvesAt_geOutput_iff {m k : ℕ} :
    ProvesAt m (Sentence.geOutput k) ↔ provesAtDepth m (CounterFact.geOutput k) := by
  simp [ProvesAt]

theorem proves_mono_sentence {m n : ℕ} (hmn : m ≤ n) {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ProvesAt n φ := by
  match φ with
  | Sentence.geOutput k =>
      simpa [ProvesAt] using proves_mono hmn h
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact ⟨proves_mono_sentence hmn hφ, proves_mono_sentence hmn hψ⟩
  | Sentence.or φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact ⟨proves_mono_sentence hmn hφ, proves_mono_sentence hmn hψ⟩
  | Sentence.phaseMem _ _ => cases h
  | Sentence.traceEq _ _ => cases h

end SentenceProvability

end Models

end NoveltyTheory
