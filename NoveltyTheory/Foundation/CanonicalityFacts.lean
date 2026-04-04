import NoveltyTheory.Core.CanonicalExplanatoryArchitecture
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.ExplanatoryRegime

/-!
# Canonicality facts (`SPEC_061_CMI2`)

Trivial constructors showing the **library’s native objects** satisfy the weak architecture
wrapper. Representation theorems (`Ridge.ArchitectureRepresentation`) build on this layer.
-/

namespace NoveltyTheory

namespace Foundation

universe u

variable {S X : Type u}

def weakArchitectureOf (G : Core.GenerativeSystem S X) (R : ℕ → Core.ExplanatoryRegime X) :
    Core.WeakExplanatoryArchitecture S X :=
  { G := G, regime := R }

theorem weakArchitecture_eta (A : Core.WeakExplanatoryArchitecture S X) :
    weakArchitectureOf A.G A.regime = A := rfl

end Foundation

end NoveltyTheory
