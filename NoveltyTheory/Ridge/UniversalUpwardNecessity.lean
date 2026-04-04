import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Ridge.ClosureCollapseBoundary
import NoveltyTheory.Ridge.RetroStructuralGap

/-!
# Universal upward necessity attempt (`SPEC_063_CMI4`)

The **retro structural gap** (`histSeqUpto_proves_succ_not_at`) is proved for the concrete
`natCounter` / `ProvesAt` layer. A **universal** `∀ G, …` upward-necessity claim would need
canonicality hypotheses excluding **bounded-trace collapses** (see
`ClosureCollapseBoundary.futureDefeat_or_existsBoundedNumericTrace`) and a functorial
provability layer over **all** admissible instances.

That universal statement is **not** claimed here; this module is the hook for a future **either**
landed universal theorem **or** a formal `upward_necessity_universal_obstruction`.
-/

namespace NoveltyTheory

namespace Ridge

namespace UniversalUpwardNecessity

open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Models.SentenceProvability

/-- Accessor: strict gap at `histSeqUpto` is already in `RetroStructuralGap`. -/
theorem exhibited_strict_retro_gap (n : ℕ) :
    ProvesAt (n + 1) (histSeqUpto n) ∧ ¬ ProvesAt n (histSeqUpto n) := by
  exact RetroStructuralGap.histSeqUpto_proves_succ_not_at n

end UniversalUpwardNecessity

end Ridge

end NoveltyTheory
