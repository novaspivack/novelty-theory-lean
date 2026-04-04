import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Sentence

/-!
# Sentences on generators (`SPEC_014_ES2`)

**`HoldsAt G φ`** for **`G : GenerativeSystem S ℕ`**: compositional semantics aligned with Model C on
numeric outputs.
-/

namespace NoveltyTheory

namespace Core

variable {S : Type}

def HoldsAt (G : GenerativeSystem S ℕ) : Sentence ℕ → Prop
  | Sentence.phaseMem outs x => x ∈ outs
  | Sentence.traceEq n x => G.trace n = x
  | Sentence.geOutput k => ∃ t : ℕ, k < G.trace t
  | Sentence.and φ ψ => HoldsAt G φ ∧ HoldsAt G ψ
  | Sentence.or φ ψ => HoldsAt G φ ∨ HoldsAt G ψ

end Core

end NoveltyTheory
