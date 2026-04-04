import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.Organization

/-!
# Organization V2 — bundled finite-height labeling (`SPEC_045_CG4`)

**`OrganizationV2`** packages an **`AdequateOrganization ℕ X`** with an explicit **nontrivial separation**
witness and optional **finite height** bounds on stage labels. This is the normative hook for ridge
obstructions that bundle **stage separation** with **bounded height** and for comparing against
**`regimeUpto`**-style finite descriptor universes without quantifying over arbitrary unsound interfaces.
-/

namespace NoveltyTheory

namespace Core

structure OrganizationV2 (X : Type) where
  /-- Underlying multiscale labeling. -/
  org : AdequateOrganization ℕ X
  /-- Certified nontriviality: not a constant `stage` map. -/
  separates : org.SeparatesStages

namespace OrganizationV2

variable {X : Type}

/-- All stage labels stay inside **`0 … B`**. -/
def IsFiniteHeight (org : OrganizationV2 X) (B : ℕ) : Prop :=
  ∀ x : X, org.org.stage x ≤ B

theorem separatesStages (org : OrganizationV2 X) : org.org.SeparatesStages :=
  org.separates

end OrganizationV2

end Core

end NoveltyTheory
