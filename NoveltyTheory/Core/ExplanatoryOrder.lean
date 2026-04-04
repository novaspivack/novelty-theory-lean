import Mathlib.Data.Set.Basic
import NoveltyTheory.Models.CausalExplanatoryOrders
import NoveltyTheory.Models.GenCertPhase

/-!
# Explanatory-order compatibility hooks (`SPEC_019_UEN3`)

Re-packages **`GenCert`** facts so explanatory vs causal tag data appear beside phase carriers without
pulling summit modules into every consumer.
-/

namespace NoveltyTheory

namespace Core

namespace ExplanatoryOrder

open Models.CausalExplanatoryOrders Models.GenCertPhase

/-- Equal singleton supports from `phaseOf` force equal tags (support determines the certificate tag). -/
theorem phaseTag_eq_of_phaseOf_outputSet_eq {c d : GenCert}
    (h : (phaseOf c).outputSet = (phaseOf d).outputSet) : phaseTag c = phaseTag d := by
  simpa [phaseOf_output, Set.singleton_eq_singleton_iff] using h

theorem orders_strict_diverge :
    ∃ a b : GenCert, causalStrict a b ∧ explanatoryStrict b a :=
  causal_explanatory_orders_diverge

theorem causal_step_lowers_summed_phase_tag :
    ∃ a b : GenCert, causalStrict a b ∧ phaseTag b < phaseTag a :=
  causal_strict_but_tag_decreases

end ExplanatoryOrder

end Core

end NoveltyTheory
