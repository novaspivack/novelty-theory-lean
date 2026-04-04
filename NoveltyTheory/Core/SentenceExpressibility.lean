import Mathlib.Data.List.Basic
import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.NatPhaseTag
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
  | Sentence.natPhaseTagMem tag x => max (NatPhaseTag.bound tag) x
  | Sentence.outputEnumMem l x =>
      max (l.foldl (fun acc y => max acc y) 0) x
  | Sentence.finConj l =>
      l.foldl (fun acc φ => max acc (mentionBound φ)) 0
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

theorem mentionBound_finConj (l : List (Sentence ℕ)) :
    mentionBound (Sentence.finConj l) =
      l.foldl (fun acc φ => max acc (mentionBound φ)) 0 := by
  simp [mentionBound]

theorem mentionBound_natPhaseTagMem (tag : NatPhaseTag) (x : ℕ) :
    mentionBound (Sentence.natPhaseTagMem tag x) = max (NatPhaseTag.bound tag) x := by
  simp [mentionBound]

end SentenceExpressibility

export SentenceExpressibility (mentionBound ExpressibleAtHeight expressibleAtHeight_iff mentionBound_not
  mentionBound_histSeq mentionBound_finConj mentionBound_natPhaseTagMem)

end Core

end NoveltyTheory
