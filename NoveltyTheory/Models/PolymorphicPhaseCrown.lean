import NoveltyTheory.Foundation.PhaseSyntaxPolyFacts

/-!
# Polymorphic phase crown (`SPEC_044_CG3`)

Re-exports **`Foundation.PhaseSyntaxPolyFacts`** at the **Models** boundary for epic packaging.
-/

namespace NoveltyTheory

namespace Models

namespace PolymorphicPhaseCrown

export NoveltyTheory.Foundation.PhaseSyntaxPolyFacts (phaseSyntaxPoly_embed_nat_faithful provesAt_poly_phase_sound
  exists_poly_phase_provable_gap poly_phase_crown_family ProvesAtPoly HoldsAtProd prodNatCounter)

end PolymorphicPhaseCrown

end Models

end NoveltyTheory
