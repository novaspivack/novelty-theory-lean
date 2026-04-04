import Mathlib.Data.List.Basic
import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.Sentence

/-!
# Sentence expressibility (`SPEC_013_ES1`, `SPEC_014_ES2`)

Structural **`mentionBound`** and **`ExpressibleAtHeight`**: no truth or regime predicates appear in
the definition.
-/

namespace NoveltyTheory

namespace Core

namespace SentenceExpressibility

def mentionBound : Sentence ℕ → ℕ
  | Sentence.phaseMem _ x => x
  | Sentence.traceEq n x => max n x
  | Sentence.histSeq l =>
      l.foldl (fun acc p => max acc (max p.1 p.2)) 0
  | Sentence.geOutput k => k
  | Sentence.and φ ψ => max (mentionBound φ) (mentionBound ψ)
  | Sentence.or φ ψ => max (mentionBound φ) (mentionBound ψ)
  | Sentence.not φ => mentionBound φ

def ExpressibleAtHeight (height : ℕ) (φ : Sentence ℕ) : Prop :=
  mentionBound φ ≤ height

theorem expressibleAtHeight_iff (h : ℕ) (φ : Sentence ℕ) :
    ExpressibleAtHeight h φ ↔ mentionBound φ ≤ h :=
  Iff.rfl

theorem mentionBound_not (φ : Sentence ℕ) : mentionBound (Sentence.not φ) = mentionBound φ := by
  simp [mentionBound]

theorem mentionBound_histSeq (l : List (ℕ × ℕ)) :
    mentionBound (Sentence.histSeq l) =
      l.foldl (fun acc p => max acc (max p.1 p.2)) 0 := by
  simp [mentionBound]

end SentenceExpressibility

export SentenceExpressibility (mentionBound ExpressibleAtHeight expressibleAtHeight_iff mentionBound_not
  mentionBound_histSeq)

end Core

end NoveltyTheory
