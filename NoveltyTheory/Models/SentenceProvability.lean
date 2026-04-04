import Mathlib.Data.Nat.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.InvariantTower

/-!
# Sentence-level derivability (`SPEC_014_ES2`, `SPEC_010_UEN`)

**`ProvesAt m φ`** extends Model C **`provesAtDepth`** on the **`CounterFact`** calculus (**`geOutput`**,
**`traceEq`**, **singleton `phaseSingletonMem`**) under the same depth inversion; **`histSeq`** is a
finite **CounterFact trace** bundle; **disjunction** uses genuine **`∨`** with **`mentionBound`**
guards on the unused disjunct.
-/

namespace NoveltyTheory

namespace Models

namespace SentenceProvability

open Set NoveltyTheory.Core InvariantTower

def ProvesAt (m : ℕ) : Sentence ℕ → Prop
  | Sentence.geOutput k => provesAtDepth m (CounterFact.geOutput k)
  | Sentence.traceEq i v => provesAtDepth m (CounterFact.traceEq i v)
  | Sentence.histSeq l => ∀ p ∈ l, provesAtDepth m (CounterFact.traceEq p.1 p.2)
  | Sentence.phaseMem outs x => outs = singleton x ∧ provesAtDepth m (CounterFact.phaseSingletonMem x)
  | Sentence.and φ ψ => ProvesAt m φ ∧ ProvesAt m ψ
  | Sentence.or φ ψ =>
      (ProvesAt m φ ∧ mentionBound ψ ≤ m) ∨ (mentionBound φ ≤ m ∧ ProvesAt m ψ)
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
  | Sentence.traceEq i v =>
      have h' : provesAtDepth m (CounterFact.traceEq i v) := by simpa [ProvesAt] using h
      simpa [ProvesAt] using proves_mono hmn h'
  | Sentence.histSeq l =>
      intro p hp
      exact proves_mono hmn (h p hp)
  | Sentence.phaseMem outs x =>
      rcases h with ⟨hout, hpf⟩
      exact And.intro hout (proves_mono hmn hpf)
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact ⟨proves_mono_sentence hmn hφ, proves_mono_sentence hmn hψ⟩
  | Sentence.or φ ψ =>
      rcases h with (⟨hφ, hψb⟩ | ⟨hφb, hψ⟩)
      · exact Or.inl ⟨proves_mono_sentence hmn hφ, Nat.le_trans hψb hmn⟩
      · exact Or.inr ⟨Nat.le_trans hφb hmn, proves_mono_sentence hmn hψ⟩
  | Sentence.not _ =>
      exact False.elim h

end SentenceProvability

end Models

end NoveltyTheory
