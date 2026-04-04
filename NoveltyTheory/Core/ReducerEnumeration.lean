import Mathlib.Logic.Encodable.Basic
import NoveltyTheory.Core.Phase

/-!
# Encodable admissible interfaces (`SPEC_009_DST`)

Hypothesis layer for diagonal constructions: admissible **interfaces** are indexed by an
`Encodable` type, so stages can be scheduled against a listing.
-/

namespace NoveltyTheory

namespace Core

universe u

/--
`AdmissibleInterface ι υ X` bundles a family of explanation predicates indexed by `ι`,
used as the generic target for diagonalization (`SPEC_009_DST`).

`explains` stays abstract: models relate it to `ExplanatoryRegime` without fixing a tower here.
-/
structure AdmissibleInterface (ι υ X : Type u) where
  explains : ι → υ → Phase X → Prop

namespace AdmissibleInterface

variable {ι υ X : Type u}

/-- Some parameter `v` witnesses explanation at interface row `i` (`SPEC_006_ADR`, `SPEC_011_SPK`). -/
def rowExplains (E : AdmissibleInterface ι υ X) (i : ι) (P : Phase X) : Prop :=
  ∃ v : υ, E.explains i v P

end AdmissibleInterface

end Core

end NoveltyTheory
