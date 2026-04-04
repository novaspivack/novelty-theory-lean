import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.Sentence

/-!
# Polymorphic carrier scaffolding (`SPEC_044_CG3`)

**Design.** **`Sentence X`** is already parametric in the output carrier **`X`** ([`Sentence.lean`](Sentence.lean)).
This module implements the **tagged numeric** carrier **`α × ℕ`**: polymorphic **`α`** is an explicit side
channel; **`ℕ`** is the coordinate aligned with **`natCounter`**.

**Conservative embed** **`sentencePolyEmbed`** maps **`Sentence ℕ`** to **`Sentence (α × ℕ)`** by pairing
numeric atoms with **`default : α`**. Semantics (**`Foundation.PhaseSyntaxPolyFacts`**) compares
**`geOutput`** against the **second projection** of **`G.trace`**.

**Finset-grade remark.** Finite enumerations already live in **`outputEnumMem`** (**`SPEC_043`**); this layer
adds **non-`ℕ`-alone** observation tagging.
-/

namespace NoveltyTheory

namespace Core

namespace PhaseSyntaxPoly

open Set

variable {α : Type} [Inhabited α]

@[simp] def embedNatPair (n : ℕ) : α × ℕ :=
  (default, n)

/-- Conservative embedding: numeric outputs become **`default`-tagged** pairs. -/
def sentencePolyEmbed : Sentence ℕ → Sentence (α × ℕ)
  | Sentence.phaseMem s x =>
      Sentence.phaseMem (image (fun n : ℕ => embedNatPair (α := α) n) s) (embedNatPair x)
  | Sentence.traceEq i v => Sentence.traceEq i (embedNatPair v)
  | Sentence.histSeq l =>
      Sentence.histSeq (l.map fun p => (p.1, embedNatPair p.2))
  | Sentence.natPhaseTagMem tag x => Sentence.natPhaseTagMem tag (embedNatPair x)
  | Sentence.outputEnumMem l x =>
      Sentence.outputEnumMem (l.map embedNatPair) (embedNatPair x)
  | Sentence.finConj L => Sentence.finConj (L.map sentencePolyEmbed)
  | Sentence.geOutput k => Sentence.geOutput k
  | Sentence.and φ ψ => Sentence.and (sentencePolyEmbed φ) (sentencePolyEmbed ψ)
  | Sentence.or φ ψ => Sentence.or (sentencePolyEmbed φ) (sentencePolyEmbed ψ)
  | Sentence.not φ => Sentence.not (sentencePolyEmbed φ)

end PhaseSyntaxPoly

end Core

end NoveltyTheory
