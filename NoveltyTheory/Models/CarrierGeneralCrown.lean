import NoveltyTheory.Foundation.PhaseGeneralizationFacts

/-!
# Carrier-generalized crown (`SPEC_048_GC1`)

Re-exports aligned-carrier strict **`ProvesAtCarrier`** gaps at **`Bool × ℕ`**.
-/

namespace NoveltyTheory

namespace Models

namespace CarrierGeneralCrown

export NoveltyTheory.Foundation.PhaseGeneralizationFacts (carrierHolds HoldsAtCarrier ProvesAtCarrier
  phase_general_embed_current_faithful holdsAt_general_phase_sound provesAt_general_phase_sound
  general_phase_gap_at exists_general_phase_provable_gap general_phase_crown_family
  current_crown_embeds_into_general_phase_layer prod_aligns)

end CarrierGeneralCrown

end Models

end NoveltyTheory
