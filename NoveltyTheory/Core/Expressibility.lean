import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.Sentence

/-!
# Expressibility strata (`SPEC_014_ES2`, `SPEC_016_ES4`)

**`mentionBound`** is a structural numeric on `Sentence ℕ`; it does **not** look at truth or proof.
**`ExpressibleAtHeight h φ`** means every numeric atom appearing in `φ` is at most `h`.
-/

namespace NoveltyTheory

namespace Core

def mentionBound : Sentence ℕ → ℕ
  | Sentence.phaseMem _ x => x
  | Sentence.traceEq n x => max n x
  | Sentence.geOutput k => k
  | Sentence.and φ ψ => max (mentionBound φ) (mentionBound ψ)
  | Sentence.or φ ψ => max (mentionBound φ) (mentionBound ψ)

def ExpressibleAtHeight (height : ℕ) (φ : Sentence ℕ) : Prop :=
  mentionBound φ ≤ height

theorem expressibleAtHeight_iff (h : ℕ) (φ : Sentence ℕ) :
    ExpressibleAtHeight h φ ↔ mentionBound φ ≤ h :=
  Iff.rfl

end Core

end NoveltyTheory
