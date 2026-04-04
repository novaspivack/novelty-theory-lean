import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.Sentence

/-!
# Retro structural sentences (`SPEC_027_RRS1`, `SPEC_028_RRS2`)

History-facing atoms (**`traceEq`**, **`geOutput`**) carry the ridge footprint used in strict
expressibility-gap packaging.
-/

namespace NoveltyTheory

namespace Models

namespace RetroStructuralTruth

open NoveltyTheory.Core

def IsRetroStructural (φ : Sentence ℕ) : Prop :=
  match φ with
  | Sentence.traceEq _ _ => True
  | Sentence.histSeq _ => True
  | Sentence.geOutput _ => True
  | _ => False

theorem isRetroStructural_traceEq (n x : ℕ) : IsRetroStructural (Sentence.traceEq n x) :=
  trivial

theorem isRetroStructural_geOutput (k : ℕ) : IsRetroStructural (Sentence.geOutput k) :=
  trivial

theorem exists_retro_sentence_expressible_gap (h : ℕ) :
    ∃ φ : Sentence ℕ,
      IsRetroStructural φ ∧ ExpressibleAtHeight (h + 1) φ ∧ ¬ ExpressibleAtHeight h φ :=
  ⟨Sentence.traceEq (h + 1) (h + 1), by
    refine And.intro trivial (And.intro ?hex ?hnex)
    · simp [ExpressibleAtHeight, mentionBound]
    · intro he
      simp [ExpressibleAtHeight, mentionBound] at he
      exact Nat.not_succ_le_self h he⟩

end RetroStructuralTruth

end Models

end NoveltyTheory
