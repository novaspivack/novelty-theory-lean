import NoveltyTheory.Core.ParadigmShift
import NoveltyTheory.Core.Conservative

/-!
# Minimal hypotheses scaffolding (`SPEC_060_CMI1`)

Bundles **paradigm-step data** into weak vs packaged (`ParadigmShift`) forms. Use this layer
when asking which conjuncts are **definitionally** required versus **independent** extensions.
-/

namespace NoveltyTheory

namespace Core

universe u

variable {X : Type u}

/--
`WeakParadigmStep` keeps the **witness effects** of a paradigm transition but drops
history conservativity as an explicit field. For the packaged notion `ParadigmShift`,
conservativity is **not optional**: it is part of the defining conjunction.
-/
structure WeakParadigmStep (R R' : ExplanatoryRegime X) (H : Phase.History X) (witness : Phase X) :
    Prop where
  prior_inadequate : ¬ R.explains witness
  later_adequate : R'.explains witness
  not_reducible_back : NotReducible R' R (H ++ [witness])

/--
Packaged paradigm shifts decompose into weak steps **with** conservativity on prior history.
-/
theorem paradigmShift_iff_weak_and_conservative (R R' : ExplanatoryRegime X) (H : Phase.History X)
    (witness : Phase X) :
    ParadigmShift R R' H witness ↔
      WeakParadigmStep R R' H witness ∧ ConservativeOver H R R' := by
  constructor
  · intro ps
    exact ⟨⟨ps.prior_inadequate, ps.later_adequate, ps.not_reducible_back⟩, ps.conservative⟩
  · rintro ⟨wk, c⟩
    exact ⟨c, wk.prior_inadequate, wk.later_adequate, wk.not_reducible_back⟩

end Core

end NoveltyTheory
