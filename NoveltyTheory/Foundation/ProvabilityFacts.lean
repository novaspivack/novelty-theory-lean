import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Counterfact embedding and sentence soundness (`SPEC_015_ES3`)

Conservative map **`CounterFact → Sentence ℕ`** and coherence with **`factHolds`** / **`HoldsAt natCounter`**.
-/

namespace NoveltyTheory

namespace Foundation

namespace ProvabilityFacts

open Set NoveltyTheory.Core NoveltyTheory.Models.InvariantTower NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

def sentenceOfCounterFact : CounterFact → Sentence ℕ
  | CounterFact.geOutput k => Sentence.geOutput k
  | CounterFact.traceEq i v => Sentence.traceEq i v
  | CounterFact.phaseSingletonMem k => Sentence.phaseMem (singleton k) k

@[simp] theorem sentenceOfCounterFact_ge (k : ℕ) :
    sentenceOfCounterFact (CounterFact.geOutput k) = Sentence.geOutput k :=
  rfl

@[simp] theorem sentenceOfCounterFact_trace (i v : ℕ) :
    sentenceOfCounterFact (CounterFact.traceEq i v) = Sentence.traceEq i v :=
  rfl

@[simp] theorem sentenceOfCounterFact_phase (k : ℕ) :
    sentenceOfCounterFact (CounterFact.phaseSingletonMem k) = Sentence.phaseMem (singleton k) k :=
  rfl

theorem sentenceOfCounterFact_holds_iff (f : CounterFact) :
    HoldsAt natCounter (sentenceOfCounterFact f) ↔ factHolds f := by
  cases f with
  | geOutput k =>
      simp [sentenceOfCounterFact, HoldsAt, factHolds, natCounter_trace]
  | traceEq i v =>
      simp [sentenceOfCounterFact, HoldsAt, factHolds, natCounter_trace]
  | phaseSingletonMem k =>
      simp [sentenceOfCounterFact, HoldsAt, factHolds, mem_singleton_iff]

theorem proves_sentence_sound {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    HoldsAt natCounter φ := by
  match φ with
  | Sentence.geOutput k =>
      simpa [HoldsAt, factHolds, natCounter_trace] using
        proves_sound (by simpa [ProvesAt] using h)
  | Sentence.traceEq i v =>
      simpa [HoldsAt, factHolds, natCounter_trace] using
        proves_sound (by simpa [ProvesAt] using h)
  | Sentence.histSeq l =>
      intro p hp
      exact proves_sound (h p hp)
  | Sentence.phaseMem outs x =>
      rcases h with ⟨hset, hp⟩
      rw [hset]
      exact proves_sound hp
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact ⟨proves_sentence_sound hφ, proves_sentence_sound hψ⟩
  | Sentence.or φ ψ =>
      rcases h with (⟨hφ, _⟩ | ⟨_, hψ⟩)
      · exact Or.inl (proves_sentence_sound hφ)
      · exact Or.inr (proves_sentence_sound hψ)
  | Sentence.not _ => nomatch h

end ProvabilityFacts

end Foundation

end NoveltyTheory
