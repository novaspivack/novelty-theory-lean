import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.Sentence

/-!
# Sentences on generators (`SPEC_014_ES2`)

**`HoldsAt G φ`** for **`G : GenerativeSystem S ℕ`**: compositional semantics aligned with Model C on
numeric outputs, **phase tags**, and **finite conjunctions**.
-/

namespace NoveltyTheory

namespace Core

variable {S : Type}

def HoldsAt (G : GenerativeSystem S ℕ) : Sentence ℕ → Prop
  | Sentence.phaseMem outs x => x ∈ outs
  | Sentence.traceEq n x => G.trace n = x
  | Sentence.histSeq l => ∀ p ∈ l, G.trace p.1 = p.2
  | Sentence.natPhaseTagMem tag x => x ∈ NatPhaseTag.toSet tag
  | Sentence.outputEnumMem l x => x ∈ l
  | Sentence.finConj l => ∀ φ ∈ l, HoldsAt G φ
  | Sentence.geOutput k => ∃ t : ℕ, k < G.trace t
  | Sentence.and φ ψ => HoldsAt G φ ∧ HoldsAt G ψ
  | Sentence.or φ ψ => HoldsAt G φ ∨ HoldsAt G ψ
  | Sentence.not φ => ¬ HoldsAt G φ

end Core

end NoveltyTheory
