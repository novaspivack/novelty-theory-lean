import NoveltyTheory.Core.OrganizationV2

/-!
# Bundled admissible organization (`SPEC_051_GC4`).

Finite height and nontrivial separation are **packaged** so class quantifiers avoid raw
unsound interface quantification.
-/

namespace NoveltyTheory

namespace Core

namespace OrganizationAbstract

/-- Bounded separated multiscale organization (`SPEC_051`). -/
structure AdmissibleBoundedOrganization (X : Type) where
  org : OrganizationV2 X
  height : ℕ
  bounded : org.IsFiniteHeight height
  /-- Certified separation used in ridge theorems. -/
  separates : org.org.SeparatesStages := org.separatesStages

end OrganizationAbstract

end Core

end NoveltyTheory
