import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.NatPhaseTag
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
  revert h
  cases φ with
  | geOutput k =>
      intro h
      simpa [HoldsAt, factHolds, natCounter_trace, ProvesAt] using
        proves_sound (by simpa [ProvesAt] using h)
  | traceEq i v =>
      intro h
      simpa [HoldsAt, factHolds, natCounter_trace, ProvesAt] using
        proves_sound (by simpa [ProvesAt] using h)
  | histSeq l =>
      intro h
      simp [ProvesAt] at h
      simpa [HoldsAt, ProvesAt] using fun (p : ℕ × ℕ) hp => proves_sound (h p.1 p.2 hp)
  | phaseMem outs x =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨hset, hp⟩
      rw [HoldsAt, hset]
      exact proves_sound hp
  | natPhaseTagMem tag x =>
      cases tag with
      | sing k =>
          intro h
          simp [ProvesAt] at h
          rcases h with ⟨hxk, hp⟩
          simp [HoldsAt, NatPhaseTag.mem_sing_iff]
          exact hxk
      | initial K =>
          intro h
          simp [ProvesAt] at h
          rcases h with ⟨hxK, _, _⟩
          simp [HoldsAt, NatPhaseTag.mem_initial_iff]
          exact hxK
  | outputEnumMem _ _ =>
      intro h
      simp [ProvesAt] at h
  | finConj l =>
      intro h
      simp [ProvesAt] at h
      simpa [HoldsAt, ProvesAt] using fun ψ hψ => proves_sentence_sound (h ψ hψ)
  | and φ ψ =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨hφ, hψ⟩
      simp [HoldsAt]
      exact ⟨proves_sentence_sound hφ, proves_sentence_sound hψ⟩
  | or φ ψ =>
      intro h
      simp [ProvesAt] at h
      rcases h with (⟨hφ, _⟩ | ⟨_, hψ⟩)
      · simp [HoldsAt]
        exact Or.inl (proves_sentence_sound hφ)
      · simp [HoldsAt]
        exact Or.inr (proves_sentence_sound hψ)
  | not _ =>
      intro h
      simp [ProvesAt] at h

end ProvabilityFacts

end Foundation

end NoveltyTheory
