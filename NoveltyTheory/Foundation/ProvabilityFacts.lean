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

open NoveltyTheory.Core NoveltyTheory.Models.InvariantTower NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

def sentenceOfCounterFact : CounterFact → Sentence ℕ
  | CounterFact.geOutput k => Sentence.geOutput k

@[simp] theorem sentenceOfCounterFact_ge (k : ℕ) :
    sentenceOfCounterFact (CounterFact.geOutput k) = Sentence.geOutput k :=
  rfl

theorem sentenceOfCounterFact_holds_iff (f : CounterFact) :
    HoldsAt natCounter (sentenceOfCounterFact f) ↔ factHolds f := by
  cases f with
  | geOutput k =>
      simp [sentenceOfCounterFact, HoldsAt, factHolds, natCounter_trace]

theorem proves_sentence_sound {m : ℕ} {φ : Sentence ℕ} (h : ProvesAt m φ) :
    HoldsAt natCounter φ := by
  match φ with
  | Sentence.geOutput k =>
      simpa [HoldsAt, factHolds, natCounter_trace] using
        proves_sound (by simpa [ProvesAt] using h)
  | Sentence.and φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact ⟨proves_sentence_sound hφ, proves_sentence_sound hψ⟩
  | Sentence.or φ ψ =>
      rcases h with ⟨hφ, hψ⟩
      exact Or.inl (proves_sentence_sound hφ)
  | Sentence.phaseMem _ _ => nomatch h
  | Sentence.traceEq _ _ => nomatch h

end ProvabilityFacts

end Foundation

end NoveltyTheory
