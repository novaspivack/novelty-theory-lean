import NoveltyTheory.Core.ClosureDichotomy
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Models.StratifiedFinality
import NoveltyTheory.Ridge.ClosureCollapseBoundary

/-!
# Closure dichotomy summit (`SPEC_062_CMI3`)

Re-exports the numeric-trace **closure / collapse** boundary for inventory and paper indexing.
-/

namespace NoveltyTheory

namespace Summits

namespace ClosureDichotomySummit

open Core Core.ClosureDichotomy GenerativeSystem Ridge.ClosureCollapseBoundary Models StratifiedFinality

variable {S : Type} (G : GenerativeSystem S ℕ)

theorem closure_dichotomy_numeric_trace :
    FutureDefeat G ∨ ExistsBoundedNumericTrace G :=
  futureDefeat_or_existsBoundedNumericTrace (G := G)

theorem finality_boundary_iff_bounded :
    ¬ FutureDefeat G ↔ ExistsBoundedNumericTrace G :=
  not_futureDefeat_iff_existsBoundedNumericTrace (G := G)

end ClosureDichotomySummit

end Summits

end NoveltyTheory
