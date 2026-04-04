import NoveltyTheory.Core.Organization
import NoveltyTheory.Models.BoundedRegimeDiagonal
import NoveltyTheory.Models.SignatureTower

/-!
# Organization frontier (`SPEC_041_OR1`)

Exports **separation** witnesses for abstract **multiscale organization**: **`SeparatesStages`** rules out
the trivial class of **constant** `stage` maps (see **`AdequateOrganization.not_separatesStages_of_const`**).

**Diagonal context.** `RegimeFamilySingletonWithin` obstructions and **`family_diagonal_of_singletonWithin`**
operate on **explanatory regimes** at the **Models** layer; they bypass degenerate universal quantifiers over
unsound interfaces (`trivialInterface`, **`emptyRegime`**, **etc.**) in the same spirit as **`SPEC_011_SPK`**.
This summit only packages **Core** predicates; reuse organization summit theorems for explicit diagonal names.
-/

namespace NoveltyTheory

namespace Summits

namespace OrganizationFrontierSummit

open NoveltyTheory.Core NoveltyTheory.Models.SignatureTower NoveltyTheory.Models.BoundedRegimeDiagonal

theorem summit_adequateNatParity_separates : adequateNatParity.SeparatesStages :=
  adequateNatParity_separates

theorem summit_totalFutureOnNat_separates : totalFutureOnNat.toAdequateOrganization.SeparatesStages :=
  totalFutureOnNat_separates

theorem summit_constant_stage_not_separated {ι X : Type} (i₀ : ι) (org : AdequateOrganization ι X)
    (h : ∀ x, org.stage x = i₀) : ¬ org.SeparatesStages :=
  AdequateOrganization.not_separatesStages_of_const i₀ org h

theorem summit_diagonal_compatible_family (c : ℕ → ExplanatoryRegime ℕ)
    (h : RegimeFamilySingletonWithin c) (n : ℕ) :
    ¬ (c n).explains (phaseSingleton (n + 1)) :=
  family_diagonal_of_singletonWithin c h n

end OrganizationFrontierSummit

end Summits

end NoveltyTheory
