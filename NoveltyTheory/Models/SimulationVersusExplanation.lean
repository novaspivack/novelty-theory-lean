import Mathlib.Data.List.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Reduction
import NoveltyTheory.Models.SignatureTower

/-!
# Simulation vs explanatory reduction (`SPEC_003_NXT` S9)

**Observational equivalence** (here: identical `reachSet`) is weaker than **explanatory
reducible closure**: two generators may present the same observable set of outputs while adjacent
regimes on a historical still refuse back-reduction.

`natCounter` **versus** itself is the minimal observation-identical pair; **`natCounterProd`** uses a
distinct state type while staying **trace-coupled**, sharpening the simulation layer before the
regime diagonal (`not_reducible_succ`).
-/

namespace NoveltyTheory

namespace Models

namespace SimulationVersusExplanation

open Core GenerativeSystem SignatureTower

/--
The same generator is observationally equivalent to itself, yet the strengthened history still
witnesses **non-reduction** of `regimeUpto (n + 1)` to `regimeUpto n` (**S9** shape).
-/
theorem observational_eq_but_irreducible (n : ℕ) :
    observationalEquivalence natCounter natCounter ∧
      NotReducible (regimeUpto (n + 1)) (regimeUpto n)
        (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) :=
  And.intro rfl (not_reducible_succ n)

/--
**Distinct state carrier** with **tick-by-tick** trace agreement—strong “exact simulation” at the
observation level—still does not force back-reduction (**`SPEC_003_NXT` S9**).
-/
theorem trace_coupled_prod_not_reducible (n : ℕ) :
    traceCoupled natCounter natCounterProd ∧
      observationalEquivalence natCounter natCounterProd ∧
      NotReducible (regimeUpto (n + 1)) (regimeUpto n)
        (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) :=
  And.intro traceCoupled_natCounter_prod
    (And.intro observationalEquiv_natCounter_prod (not_reducible_succ n))

end SimulationVersusExplanation

end Models

end NoveltyTheory
