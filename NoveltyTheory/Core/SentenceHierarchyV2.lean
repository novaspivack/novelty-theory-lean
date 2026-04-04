import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Foundation.StructuralGeneratorSentence

/-!
# Structural sentence hierarchy v2 (`SPEC_049_GC2`)

**`IsStructuralSentenceV2`** extends the generator-structural fragment with **retro v2** diagonal
**`histSeq`** bundles—certifiably beyond trace-only **`IsGeneratorStructural`** or bare
**`mentionBound`** classification alone.
-/

namespace NoveltyTheory

namespace Core

namespace SentenceHierarchyV2

open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Core

/-- Union of **`SPEC_035`** generator-structural fragment and **`SPEC_046`** retro v2 fragment. -/
def IsStructuralSentenceV2 (φ : Sentence ℕ) : Prop :=
  IsStructuralGeneratorSentence φ ∨ IsRetroStructuralV2 φ

theorem isStructuralGenerator_implies_structuralV2 {φ : Sentence ℕ}
    (h : IsStructuralGeneratorSentence φ) : IsStructuralSentenceV2 φ :=
  Or.inl h

theorem isRetroStructuralV2_implies_structuralV2 {φ : Sentence ℕ}
    (h : IsRetroStructuralV2 φ) : IsStructuralSentenceV2 φ :=
  Or.inr h

/-- “**Structural**” predicates split exactly along the defining disjunction (`SPEC_049` bookkeeping). -/
theorem isStructuralV2_cases {φ : Sentence ℕ} (h : IsStructuralSentenceV2 φ) :
    IsStructuralGeneratorSentence φ ∨ IsRetroStructuralV2 φ :=
  h

end SentenceHierarchyV2

end Core

end NoveltyTheory
