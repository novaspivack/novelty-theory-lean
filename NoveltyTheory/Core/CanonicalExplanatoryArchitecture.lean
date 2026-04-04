import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.ExplanatoryRegime

/-!
# Weak explanatory architecture (`SPEC_061_CMI2`)

Abstract packaging of **lawful generation** together with a **regime family**. Further morphism
and representation theorems map this into summit-grade towers in `ArchitectureRepresentation.lean`.
-/

namespace NoveltyTheory

namespace Core

universe u

variable (S X : Type u)

/--
Minimal data for talking about **fixed dynamics** plus **indexed explanatory regimes** on the same
observation type. This is intentionally weaker than full crown packaging.
-/
structure WeakExplanatoryArchitecture where
  G : GenerativeSystem S X
  regime : ℕ → ExplanatoryRegime X

end Core

end NoveltyTheory
