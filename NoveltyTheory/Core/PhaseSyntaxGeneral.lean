import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.Sentence

/-!
# Carrier functorial sentence embed (`SPEC_048_GC1`)

Maps **`Sentence ℕ`** to **`Sentence X`** along **`ι : ℕ → X`**, generalizing the product embed in
**`PhaseSyntaxPoly`**. Phase sets are pushed forward with **`Set.image`**; **`geOutput`** stays on **`ℕ`** and
is read through **`observe (G.trace t)`** in **`Foundation.PhaseGeneralizationFacts`**.
-/

namespace NoveltyTheory

namespace Core

namespace PhaseSyntaxGeneral

open Set

variable {X : Type}

/-- Functorial rename of numeric atoms along **`ι`**. -/
def sentenceCarrierEmbed (ι : ℕ → X) : Sentence ℕ → Sentence X
  | Sentence.phaseMem s x =>
      Sentence.phaseMem (image (fun n : ℕ => ι n) s) (ι x)
  | Sentence.traceEq i v => Sentence.traceEq i (ι v)
  | Sentence.histSeq l =>
      Sentence.histSeq (l.map fun p => (p.1, ι p.2))
  | Sentence.natPhaseTagMem tag x => Sentence.natPhaseTagMem tag (ι x)
  | Sentence.outputEnumMem l x =>
      Sentence.outputEnumMem (l.map ι) (ι x)
  | Sentence.finConj L => Sentence.finConj (L.map (sentenceCarrierEmbed ι))
  | Sentence.geOutput k => Sentence.geOutput k
  | Sentence.and φ ψ => Sentence.and (sentenceCarrierEmbed ι φ) (sentenceCarrierEmbed ι ψ)
  | Sentence.or φ ψ => Sentence.or (sentenceCarrierEmbed ι φ) (sentenceCarrierEmbed ι ψ)
  | Sentence.not φ => Sentence.not (sentenceCarrierEmbed ι φ)

end PhaseSyntaxGeneral

end Core

end NoveltyTheory
