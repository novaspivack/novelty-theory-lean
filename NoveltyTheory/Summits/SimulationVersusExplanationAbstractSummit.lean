import NoveltyTheory.Core.SimulationVersusExplanationAbstract

/-!
# Abstract simulation vs explanation summit (`SPEC_032_SVE3`)

Re-exports the strictness gap between observational equivalence and trace coupling.
-/

namespace NoveltyTheory

namespace Summits

namespace SimulationVersusExplanationAbstractSummit

export NoveltyTheory.Core.SimulationVersusExplanationAbstract (
  SimulatesTracePrefix
  simulatesTracePrefix_self
  observationalEquiv_altParity_pair
  not_traceCoupled_altParity_counterexample
  observational_equiv_not_implies_trace_coupled)

end SimulationVersusExplanationAbstractSummit

end Summits

end NoveltyTheory
