import NoveltyTheory.Core.Expressibility
import NoveltyTheory.Core.Sentence

/-!
# Retro structural sentences (`SPEC_027_RRS1`, `SPEC_028_RRS2`)

History-facing atoms (**`traceEq`**, **`geOutput`**, **`histSeq`**) and **compositional closure** under
**`and`**, **`or`**, and **`finConj`** when all subformulas are retro (bounded window packaging).
-/

namespace NoveltyTheory

namespace Models

namespace RetroStructuralTruth

open NoveltyTheory.Core

/-- Retro-tagged sentences: primitive history-facing constructors plus guarded compounds. -/
def IsRetroStructural : Sentence ℕ → Prop
  | Sentence.traceEq _ _ => True
  | Sentence.histSeq _ => True
  | Sentence.geOutput _ => True
  | Sentence.and φ ψ => IsRetroStructural φ ∧ IsRetroStructural ψ
  | Sentence.or φ ψ => IsRetroStructural φ ∧ IsRetroStructural ψ
  | Sentence.finConj l => ∀ φ ∈ l, IsRetroStructural φ
  | _ => False

theorem isRetroStructural_traceEq (n x : ℕ) : IsRetroStructural (Sentence.traceEq n x) := by
  simp [IsRetroStructural]

theorem isRetroStructural_histSeq (l : List (ℕ × ℕ)) :
    IsRetroStructural (Sentence.histSeq l) := by
  simp [IsRetroStructural]

theorem isRetroStructural_geOutput (k : ℕ) : IsRetroStructural (Sentence.geOutput k) := by
  simp [IsRetroStructural]

theorem isRetroStructural_and {φ ψ : Sentence ℕ} (hφ : IsRetroStructural φ)
    (hψ : IsRetroStructural ψ) : IsRetroStructural (Sentence.and φ ψ) := by
  simp [IsRetroStructural, hφ, hψ]

theorem isRetroStructural_or {φ ψ : Sentence ℕ} (hφ : IsRetroStructural φ)
    (hψ : IsRetroStructural ψ) : IsRetroStructural (Sentence.or φ ψ) := by
  simp [IsRetroStructural, hφ, hψ]

theorem isRetroStructural_finConj {l : List (Sentence ℕ)}
    (hl : ∀ φ ∈ l, IsRetroStructural φ) : IsRetroStructural (Sentence.finConj l) := by
  simp [IsRetroStructural]
  exact hl

theorem exists_retro_sentence_expressible_gap (h : ℕ) :
    ∃ φ : Sentence ℕ,
      IsRetroStructural φ ∧ ExpressibleAtHeight (h + 1) φ ∧ ¬ ExpressibleAtHeight h φ :=
  ⟨Sentence.traceEq (h + 1) (h + 1), by
    refine And.intro (isRetroStructural_traceEq _ _) (And.intro ?hex ?hnex)
    · simp [ExpressibleAtHeight, mentionBound]
    · intro he
      simp [ExpressibleAtHeight, mentionBound] at he
      exact Nat.not_succ_le_self h he⟩

end RetroStructuralTruth

end Models

end NoveltyTheory
