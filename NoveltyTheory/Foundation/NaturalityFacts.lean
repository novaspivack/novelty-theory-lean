import NoveltyTheory.Core.Conservative
import NoveltyTheory.Core.ExplanatoryRegime
import NoveltyTheory.Core.Phase
import NoveltyTheory.Foundation.ConservativeHistory

/-!
# Naturality-aligned facts in Foundation (`SPEC_054_NS1`)

Short lemmas that connect the weak naturality story to **existing** conservative-history and
adequacy transport statements—no new model commitments.
-/

namespace NoveltyTheory

namespace Foundation

universe u

variable {X : Type u} {R R' : Core.ExplanatoryRegime X}

/--
If `R'` conservatively extends `R` over history `H`, then any `R`-adequate description of a phase in
`H` already forces `R'` to explain that phase (`SPEC_054_NS1`, adequacy preservation along extension).
-/
theorem naturality_adequacy_transport {H : Core.Phase.History X}
    (h : Core.ConservativeOver H R R') (P : Core.Phase X)
    (hP : P ∈ H) (d : R.Desc) (hd : R.Adequate d P) : R'.explains P :=
  conservativeOver_tail_of_conservativeOver h P hP d hd

/--
Repackaging: “phase-invariant” consequence on the **same** certified history—every adequately
certified phase from the prior regime stays explained after a conservative step.
-/
theorem naturality_phase_certificates_preserved {H : Core.Phase.History X}
    (h : Core.ConservativeOver H R R') (P : Core.Phase X) (hP : P ∈ H)
    (hR : ∃ d : R.Desc, R.Adequate d P) : R'.explains P := by
  rcases hR with ⟨d, hd⟩
  exact naturality_adequacy_transport h P hP d hd

end Foundation

end NoveltyTheory
