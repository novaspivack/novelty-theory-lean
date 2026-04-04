import Mathlib.Data.List.Range
import NoveltyTheory.Core.ParadigmShift
import NoveltyTheory.Core.Tower
import NoveltyTheory.Models.BoundedRegimeDiagonal
import NoveltyTheory.Models.SignatureTower

/-!
# `RegimeFamilySingletonWithin` does **not** entail paradigm chains

**Singleton-within** only bounds certified singleton outputs; it does **not** force conservative
extensions, adequacy on fresh witnesses, or back-reduction failure. A **vacuous** regime (empty
descriptor type) satisfies the bound at every height yet **never** explains a nonempty phase, so
no `ParadigmShift` step with nontrivial `later_adequate` can run.
-/

namespace NoveltyTheory

namespace Models

namespace RegimeFamilyObstruction

open Core SignatureTower BoundedRegimeDiagonal PhaseRegimeTower

/-- Descriptor-free regime: nothing is adequately certified. -/
def emptyRegime (_n : ℕ) : ExplanatoryRegime ℕ where
  Desc := Empty
  Adequate := fun d _ => nomatch d

theorem emptyRegime_singletonWithin (n : ℕ) : AdequateSingletonWithin (emptyRegime n) n := by
  intro d _ hd
  cases d

theorem emptyRegime_family_singletonWithin : RegimeFamilySingletonWithin (fun n => emptyRegime n) :=
  emptyRegime_singletonWithin

theorem not_explains_emptyRegime (n k : ℕ) : ¬ (emptyRegime n).explains (phaseSingleton k) := by
  rintro ⟨d, _⟩
  cases d

theorem not_paradigmShift_empty_step (n : ℕ) :
    ¬ ParadigmShift (emptyRegime n) (emptyRegime (n + 1))
      ((List.range (n + 1)).map phaseSingleton) (phaseSingleton (n + 1)) := by
  intro h
  exact not_explains_emptyRegime (n + 1) (n + 1) h.later_adequate

theorem not_paradigmShiftSteps_empty_tower :
    ¬ ({ phase := phaseSingleton, regime := fun n => emptyRegime n } : PhaseRegimeTower ℕ).paradigmShiftSteps := by
  intro h
  exact not_paradigmShift_empty_step 0 (h 0)

end RegimeFamilyObstruction

end Models

end NoveltyTheory
