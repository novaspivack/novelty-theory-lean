import Mathlib.Data.List.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.Reduction
import NoveltyTheory.Models.SignatureTower

/-!
# Simulation vs explanatory reduction (`SPEC_003_NXT` S9)

**Observational equivalence** (here: identical `reachSet`) is weaker than **explanatory
reducible closure**: two generators may present the same observable set of outputs while adjacent
regimes on a historical still refuse back-reduction.

Model: a **single** `natCounter` is twin-fold compared to itself, so observational coincidence is
trivial; the nontrivial content is entirely in the regime layer (`not_reducible_succ`).
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

end SimulationVersusExplanation

end Models

end NoveltyTheory
