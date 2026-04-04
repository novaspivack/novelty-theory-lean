import NoveltyTheory.Core.GeneralizedCarrier
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.PhaseSyntaxGeneral

/-!
# Broader natural admissible class (`SPEC_056_NS3`)

**Data** packaging for aligned generators: any observation type **`α`** may appear, so long as a
`CarrierSection` witnesses numeric alignment. Concrete instances (`natCounter`, product carriers,
**etc.**) are exported from **`Models.NaturalClassExamples`** to keep Core independent of model layers.
-/

namespace NoveltyTheory

namespace Core

open GeneralizedCarrier
open PhaseSyntaxGeneral

/-- Aligned generator + numeric section witness (`SPEC_056_NS3`). -/
structure NaturalAdmissibleInstance (α : Type) where
  gen : GenerativeSystem ℕ α
  /-- Certified numeric section on the observation type. -/
  sec : CarrierSection α
  /-- Trace agrees with the embedded numeric line. -/
  aligns : AlignsCarrier gen sec

namespace NaturalAdmissibleInstance

variable {α : Type}

/-- Pull back a base `Sentence ℕ` along the section embedding. -/
def embedSentence (inst : NaturalAdmissibleInstance α) (ψ : Sentence ℕ) : Sentence α :=
  sentenceCarrierEmbed inst.sec.embed ψ

end NaturalAdmissibleInstance

end Core

end NoveltyTheory
