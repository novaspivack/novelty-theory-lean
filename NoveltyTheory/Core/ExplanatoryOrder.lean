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

theorem orders_strict_diverge :
    ∃ a b : GenCert, causalStrict a b ∧ explanatoryStrict b a :=
  causal_explanatory_orders_diverge

theorem causal_step_lowers_summed_phase_tag :
    ∃ a b : GenCert, causalStrict a b ∧ phaseTag b < phaseTag a :=
  causal_strict_but_tag_decreases

end ExplanatoryOrder

end Core

end NoveltyTheory
