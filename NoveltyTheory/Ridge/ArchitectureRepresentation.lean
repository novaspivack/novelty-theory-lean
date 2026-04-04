import NoveltyTheory.Core.CanonicalExplanatoryArchitecture
import NoveltyTheory.Core.Reduction
import NoveltyTheory.Foundation.CanonicalityFacts

/-!
# Architecture representation (`SPEC_061_CMI2`)

**Weak architectures** are definitionally pairs \((G,\texttt{regime})\); this module records the
induced **generator / regime** scheme and a vacuous **`Reducible`** corner (empty later description
type). Further nontrivial comparison up to equivalence lives in summit layers.
-/

namespace NoveltyTheory

namespace Ridge

namespace ArchitectureRepresentation

universe u

variable {S X : Type u}

/-- Any weak architecture is **induced** by some (unique) generator and regime family. -/
theorem weak_explanatory_architecture_induces_generator_regime_scheme
    (A : Core.WeakExplanatoryArchitecture S X) :
    ∃ (G : Core.GenerativeSystem S X) (R : ℕ → Core.ExplanatoryRegime X),
      A = Foundation.weakArchitectureOf G R :=
  ⟨A.G, A.regime, rfl⟩

/-- **`weakArchitectureOf` normal form:** the native constructor is inverse to bundling. -/
theorem canonical_representation_of_explanatory_architecture
    (A : Core.WeakExplanatoryArchitecture S X) :
    A = Foundation.weakArchitectureOf A.G A.regime :=
  rfl

/--
If the indexed later regimes have **no** descriptions at some stage, the project’s backward
**`Reducible`** predicate holds **vacuously** on that step’s history slice (via `reducible_of_isEmpty`).
-/
theorem every_adequate_account_instantiates_reduction_layer_on_empty_later_desc
    {H : Core.Phase.History X} (R R' : Core.ExplanatoryRegime X) [IsEmpty R'.Desc] :
    Core.Reducible R' R H :=
  Core.reducible_of_isEmpty

/-- Identity witnessing: every weak architecture is already in generator–regime form. -/
def sameShape (A : Core.WeakExplanatoryArchitecture S X) : Core.WeakExplanatoryArchitecture S X :=
  A

theorem sameShape_id (A : Core.WeakExplanatoryArchitecture S X) : sameShape A = A := rfl

end ArchitectureRepresentation

end Ridge

end NoveltyTheory
