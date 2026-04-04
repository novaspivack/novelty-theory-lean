import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.GeneratorTruth
import NoveltyTheory.Core.OrganizationV2
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Foundation.StructuralCrownSentence
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Models.OutputEnumCrownFamily
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.StratifiedFinality
import NoveltyTheory.Models.StructuralCrownFamily
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Ridge.OrganizationHeightObstruction
import NoveltyTheory.Summits.StructuralCrownSummit

/-!
# Final crown package (`SPEC_047_CG6`)

**Interpretation boundary.** This module **does not** assert **literal universals** over arbitrary
**`AdmissibleInterface`** families or infinite paradigm chains for every **`RegimeFamilySingletonWithin`**
instance—those obstructions remain **documentation / inventory** material.

**What is bundled.** Structural **strict `ProvesAt` ascent** with **`IsStructuralGeneratorSentence`**,
**generator-truth** linkage on **`natCounter`**, **no fixed finite signature** explaining the full singleton
ladder, **future defeat of terminality-style bounded output** on the canonical counter, and **height
obstructions** for **bounded multiscale organization** ( **`SPEC_045`** ridge).
-/

namespace NoveltyTheory

namespace Summits

namespace FinalCrownPackage

open NoveltyTheory.Core NoveltyTheory.Core.GeneratorTruth NoveltyTheory.Core.GenerativeSystem
open NoveltyTheory.Foundation.StructuralCrownSentence
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.StructuralCrownFamily
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Models.StratifiedFinality
open NoveltyTheory.Ridge.OrganizationHeightObstruction
open NoveltyTheory.Summits.StructuralCrownSummit

/-- **`∃ G, ∃ Φ, ∀ n`**, structural certification, strict provability gap (`SPEC_047`). -/
theorem final_crown_iterated_structural_ascent :
    ∃ (_ : GenerativeSystem ℕ ℕ) (Φ : ℕ → Sentence ℕ),
      (∀ n, IsStructuralGeneratorSentence (Φ n)) ∧
        ∀ n, ProvesAt (n + 1) (Φ n) ∧ ¬ ProvesAt n (Φ n) :=
  structural_sentence_crown_family

/--
No **single** fixed **`regimeUpto k`** stratum explains **every** singleton ladder phase; paired with
**`OrganizationHeightObstruction`** for abstract bounded organizations (**scoped**, not a blocked universal
over all informal “explanations”).
-/
theorem final_crown_no_fixed_structural_stratum (k : ℕ) :
    (∃ ph : Phase ℕ, ph.generatedBy natCounter ∧ ¬ (regimeUpto k).explains ph) ∧
      ∀ (Y : Type) (org : OrganizationV2 Y), org.IsFiniteHeight k → ¬ TotalizesStandardFuture org :=
  organization_height_obstruction k

/-- Canonical **`natCounter`** strictly **outruns** any proposed uniform output bound (**`FutureDefeat`**). -/
theorem final_crown_future_defeat_of_terminality : FutureDefeat natCounter :=
  natCounter_futureDefeat

/--
**`natCounter`** satisfies the standard **holds-at** generator-truth ridge simultaneously with the
**structural** crown family (re-export packaging).
-/
theorem final_crown_generator_truth_family :
    (∀ n : ℕ, ∃ φ : Sentence ℕ, φ = Sentence.traceEq n n ∧ IsGeneratorStructural φ ∧ HoldsAt natCounter φ) ∧
      (∃ (_ : GenerativeSystem ℕ ℕ) (Φ : ℕ → Sentence ℕ),
        (∀ n, IsStructuralGeneratorSentence (Φ n)) ∧
          ∀ n, ProvesAt (n + 1) (Φ n) ∧ ¬ ProvesAt n (Φ n)) :=
  And.intro
    (fun n =>
      ⟨Sentence.traceEq n n, And.intro rfl (And.intro (isGeneratorStructural_traceEq n)
        (holdsAt_natCounter_traceEq_self n))⟩)
    (⟨natCounter, structuralCrownWitness, fun n => isStructural_structuralCrownWitness n, fun n =>
      structuralCrownWitness_proves_succ_not_at n⟩)

theorem final_crown_enum_output_layer_gap (n : ℕ) :
    ∃ φ : Sentence ℕ, ProvesAt (n + 1) φ ∧ ¬ ProvesAt n φ :=
  NoveltyTheory.Models.OutputEnumCrownFamily.exists_outputEnumMem_provable_gap n

end FinalCrownPackage

end Summits

end NoveltyTheory
