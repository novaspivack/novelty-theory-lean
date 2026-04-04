import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StratifiedFinality
import NoveltyTheory.Ridge.ClosureCollapseBoundary
import NoveltyTheory.Ridge.MinimalityCountermodels
import NoveltyTheory.Ridge.RetroStructuralGap

/-!
# Universal upward necessity attempt (`SPEC_063_CMI4`)

The **retro structural gap** (`histSeqUpto_proves_succ_not_at`) is proved for the concrete
`natCounter` / `ProvesAt` layer. A **universal** `∀ G, …` upward-necessity claim would need
canonicality hypotheses excluding **bounded-trace collapses** (see
`ClosureCollapseBoundary.futureDefeat_or_existsBoundedNumericTrace`) and a functorial
provability layer over **all** admissible instances.

A universal `∀ G, FutureDefeat G` statement is **refuted** at the numeric layer by
`upward_necessity_universal_obstruction`; the retro gap witness `exhibited_strict_retro_gap`
remains the positive navigation hook for the proved `histSeqUpto` phenomenon.
-/

namespace NoveltyTheory

namespace Ridge

namespace UniversalUpwardNecessity

open NoveltyTheory.Core NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.StratifiedFinality

/-- Constant numeric observation `0` on `Unit` dynamics (counterexample to universal `FutureDefeat`). -/
private def silentNumericGen : GenerativeSystem Unit ℕ where
  s0 := ()
  tau := id
  out := fun _ => 0

private theorem silentNumericGen_trace_const (n : ℕ) : silentNumericGen.trace n = 0 := by
  induction n <;> simp [silentNumericGen, GenerativeSystem.trace, GenerativeSystem.step, *]

/--
**Universal obstruction (numeric layer):** \(\texttt{FutureDefeat}\) is not forced for every
lawful `GenerativeSystem` on \(\mathbb{N}\); a bounded (here, constant) trace defeats all bounds.
-/
theorem upward_necessity_universal_obstruction :
    ¬ ∀ (S : Type) (G : GenerativeSystem S ℕ), FutureDefeat G := by
  intro hall
  exact MinimalityCountermodels.not_futureDefeat_of_constant_numeric_trace silentNumericGen 0
    silentNumericGen_trace_const (hall Unit silentNumericGen)

/-- Accessor: strict gap at `histSeqUpto` is already in `RetroStructuralGap`. -/
theorem exhibited_strict_retro_gap (n : ℕ) :
    ProvesAt (n + 1) (histSeqUpto n) ∧ ¬ ProvesAt n (histSeqUpto n) := by
  exact RetroStructuralGap.histSeqUpto_proves_succ_not_at n

end UniversalUpwardNecessity

end Ridge

end NoveltyTheory
