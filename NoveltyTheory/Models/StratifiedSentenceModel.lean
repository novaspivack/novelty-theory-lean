import Mathlib.Data.Nat.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SentenceProvability

/-!
# Stratified sentence model (`SPEC_016_ES4`)

Explicit **non-collapse** witnesses for expressibility strata and for sentence **`ProvesAt`** aligned
with Model C on `ℕ` — across **`geOutput`**, diagonal **`traceEq`**, singleton **`phaseMem`**, and
nonempty **`histSeq`** bundles.
-/

namespace NoveltyTheory

namespace Models

namespace StratifiedSentenceModel

open Set NoveltyTheory.Core InvariantTower SentenceProvability

theorem exists_sentence_expressible_succ_not_at (h : ℕ) :
    ∃ φ : Sentence ℕ, ExpressibleAtHeight (h + 1) φ ∧ ¬ ExpressibleAtHeight h φ :=
  ⟨Sentence.traceEq (h + 1) (h + 1), by
    constructor
    · simp [ExpressibleAtHeight, mentionBound]
    · intro he
      simp [ExpressibleAtHeight, mentionBound] at he
      exact Nat.not_succ_le_self h he⟩

theorem exists_sentence_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ := by
  refine ⟨Sentence.geOutput n, ?_⟩
  simpa [ProvesAt] using upward_derivability_gap n

theorem exists_sentence_trace_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ := by
  refine ⟨Sentence.traceEq n n, ?_⟩
  simpa [ProvesAt] using upward_trace_derivability_gap n

theorem exists_sentence_phase_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ := by
  refine ⟨Sentence.phaseMem (singleton n) n, ?_⟩
  constructor
  · exact And.intro rfl (proves_succ_phase n)
  · intro ⟨_, hpr⟩
    exact not_proves_phase n hpr

theorem exists_histSeq_nonempty_provable_succ_not_at (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ := by
  refine ⟨Sentence.histSeq [(n, n)], ?_⟩
  constructor
  · intro p hp
    rw [List.mem_singleton] at hp
    subst hp
    simpa [ProvesAt] using (upward_trace_derivability_gap n).1
  · refine fun hpr => not_proves_trace_diag n (hpr (n, n) ?_)
    exact List.mem_singleton_self (α := ℕ × ℕ) (a := (n, n))

theorem universal_no_sentence_proof_at_own_bound (n : ℕ) :
    ∃ φ : Sentence ℕ, ¬ ProvesAt n φ :=
  ⟨Sentence.geOutput n, by simpa [ProvesAt] using not_proves_self n⟩

end StratifiedSentenceModel

end Models

end NoveltyTheory
