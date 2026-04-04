import Mathlib.Data.Nat.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.InvariantTower

/-!
# Sentence-level derivability (`SPEC_014_ES2`, `SPEC_010_UEN`)

**`ProvesAt m φ`** extends Model C on **`CounterFact`**; **`finConj`** lifts finite proof context;
**`natPhaseTagMem.sing`** uses singleton Model C atoms; **`initial`** tags (**`SPEC_039_DT1`**) require
**`x ≤ K`**, **`K ≤ m`**, and a matching **`phaseSingletonMem`** proof; **`outputEnumMem`** is
**unprovable** in the first tranche (**`SPEC_038_XS1`** — semantics only via soundness vacuity).
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
  | Sentence.natPhaseTagMem tag x =>
      match tag with
      | NatPhaseTag.sing k => x = k ∧ provesAtDepth m (CounterFact.phaseSingletonMem k)
      | NatPhaseTag.initial K =>
          x ≤ K ∧ K ≤ m ∧ provesAtDepth m (CounterFact.phaseSingletonMem x)
  | Sentence.outputEnumMem _ _ => False
  | Sentence.finConj l => ∀ φ ∈ l, ProvesAt m φ
  | Sentence.and φ ψ => ProvesAt m φ ∧ ProvesAt m ψ
  | Sentence.or φ ψ =>
      (ProvesAt m φ ∧ mentionBound ψ ≤ m) ∨ (mentionBound φ ≤ m ∧ ProvesAt m ψ)
  | Sentence.not _ => False

theorem ProvesAt_geOutput_iff {m k : ℕ} :
    ProvesAt m (Sentence.geOutput k) ↔ provesAtDepth m (CounterFact.geOutput k) := by
  simp [ProvesAt]

theorem proves_mono_sentence {m n : ℕ} (hmn : m ≤ n) {φ : Sentence ℕ} (h : ProvesAt m φ) :
    ProvesAt n φ := by
  revert h
  cases φ with
  | phaseMem outs x =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨hout, hpf⟩
      simp [ProvesAt]
      exact And.intro hout (proves_mono hmn hpf)
  | traceEq i v =>
      intro h
      simpa [ProvesAt] using proves_mono hmn (by simpa [ProvesAt] using h)
  | histSeq l =>
      intro h
      simp [ProvesAt] at h
      simpa [ProvesAt] using fun (p : ℕ × ℕ) hp => proves_mono hmn (h p.1 p.2 hp)
  | natPhaseTagMem tag x =>
      cases tag with
      | sing k =>
          intro h
          simp [ProvesAt] at h
          rcases h with ⟨hxk, hpf⟩
          simp [ProvesAt]
          exact And.intro hxk (proves_mono hmn hpf)
      | initial K =>
          intro h
          simp [ProvesAt] at h
          rcases h with ⟨hxK, hKm, hpf⟩
          simp [ProvesAt]
          exact ⟨hxK, Nat.le_trans hKm hmn, proves_mono hmn hpf⟩
  | outputEnumMem _ _ =>
      intro h
      simp [ProvesAt] at h
  | finConj l =>
      intro h
      simp [ProvesAt] at h
      simpa [ProvesAt] using fun ψ hψ => proves_mono_sentence hmn (h ψ hψ)
  | geOutput k =>
      intro h
      simpa [ProvesAt] using proves_mono hmn (by simpa [ProvesAt] using h)
  | and φ ψ =>
      intro h
      simp [ProvesAt] at h
      rcases h with ⟨hφ, hψ⟩
      simp [ProvesAt]
      exact ⟨proves_mono_sentence hmn hφ, proves_mono_sentence hmn hψ⟩
  | or φ ψ =>
      intro h
      simp [ProvesAt] at h
      rcases h with (⟨hφ, hψb⟩ | ⟨hφb, hψ⟩)
      · simp [ProvesAt]
        exact Or.inl ⟨proves_mono_sentence hmn hφ, Nat.le_trans hψb hmn⟩
      · simp [ProvesAt]
        exact Or.inr ⟨Nat.le_trans hφb hmn, proves_mono_sentence hmn hψ⟩
  | not _ =>
      intro h
      simp [ProvesAt] at h

theorem provesAt_initial_endpoint (K : ℕ) :
    ProvesAt (K + 1) (Sentence.natPhaseTagMem (NatPhaseTag.initial K) K) := by
  simp only [ProvesAt]
  exact And.intro (Nat.le_refl K) (And.intro (Nat.le_succ K) (proves_succ_phase K))

end SentenceProvability

end Models

end NoveltyTheory
