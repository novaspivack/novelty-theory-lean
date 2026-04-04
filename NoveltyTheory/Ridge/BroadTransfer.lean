import NoveltyTheory.Core.NaturalAdmissibleClass
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Foundation.PhaseGeneralizationFacts
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.NaturalClassExamples
import NoveltyTheory.Models.OutputEnumCrownFamily
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.StratifiedFinality

/-!
# Broad admissible-class transfer (`SPEC_056_NS3`)

`CarrierSection`-generic output-enum gaps (**`carrier_outputEnum_gap_at`**) specialize to **every**
`NaturalAdmissibleInstance`, not merely the historic **`Bool × ℕ`** section.
-/

namespace NoveltyTheory

namespace Ridge

namespace BroadTransfer

open Core NoveltyTheory.Foundation.PhaseGeneralizationFacts
open NoveltyTheory.Foundation.ProvabilityFacts
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.OutputEnumCrownFamily
open NoveltyTheory.Models.StratifiedFinality
open NoveltyTheory.Models.NaturalClassExamples

/-- `ProvesAt` soundness lifts along **any** aligned natural instance (`SPEC_056_NS3`). -/
theorem naturalClass_preserves_soundness {α : Type} (inst : NaturalAdmissibleInstance α) {m : ℕ} {ψ : Sentence ℕ}
    (h : ProvesAt m ψ) :
    carrierHolds inst.gen inst.sec (inst.embedSentence ψ) :=
  (phase_general_embed_faithful inst.gen inst.sec inst.aligns ψ).mp (proves_sentence_sound h)

/--
Strict **`ProvesAtCarrier`** ascent for the output-enum witness survives on **any** aligned carrier
(**`SPEC_056_NS3`**)—the same content as **`naturalClass_preserves_future_defeat`** under a structural
name for paper routing.
-/
theorem naturalClass_preserves_structural_ascent {α : Type} (inst : NaturalAdmissibleInstance α) (n : ℕ) :
    ProvesAtCarrier inst.sec (Nat.succ n) (inst.embedSentence (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtCarrier inst.sec n (inst.embedSentence (outputEnumCrownWitness n)) := by
  simpa [NaturalAdmissibleInstance.embedSentence] using carrier_outputEnum_gap_at α inst.sec n

theorem naturalClass_preserves_future_defeat {α : Type} (inst : NaturalAdmissibleInstance α) (n : ℕ) :
    ProvesAtCarrier inst.sec (Nat.succ n) (inst.embedSentence (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtCarrier inst.sec n (inst.embedSentence (outputEnumCrownWitness n)) :=
  naturalClass_preserves_structural_ascent inst n

/-- Numeric `natCounter` remains **unboundedly productive** inside the class (`SPEC_056_NS3`). -/
theorem naturalClass_preserves_nonfinality : FutureDefeat natCounterAdmissible.gen :=
  natCounter_futureDefeat

/--
Bundled index + instance for summarizing broad-transfer hypotheses (`SPEC_056_NS3`).
-/
structure BroadPoint (α : Type) where
  /-- Stage index for the output-enum witness. -/
  idx : ℕ
  /-- Aligned generator package at that stage. -/
  adm : NaturalAdmissibleInstance α

/-- Numeric index first so `∀`-types never splice `inst n :` misreads (`SPEC_056_NS3`). -/
theorem futureDefeatAt {α : Type} (stage : ℕ) (inst : NaturalAdmissibleInstance α) :
    ProvesAtCarrier inst.sec (Nat.succ stage) (inst.embedSentence (outputEnumCrownWitness stage)) ∧
      ¬ ProvesAtCarrier inst.sec stage (inst.embedSentence (outputEnumCrownWitness stage)) :=
  naturalClass_preserves_structural_ascent inst stage

/--
Point packaging for indexing + instance (`SPEC_056_NS3`).
-/
theorem futureDefeatBroadPoint {α : Type} (p : BroadPoint α) :
    ProvesAtCarrier p.adm.sec (Nat.succ p.idx) (p.adm.embedSentence (outputEnumCrownWitness p.idx)) ∧
      ¬ ProvesAtCarrier p.adm.sec p.idx (p.adm.embedSentence (outputEnumCrownWitness p.idx)) :=
  naturalClass_preserves_structural_ascent p.adm p.idx

theorem futureDefeatBroadPoint_eq {α : Type} (stage : ℕ) (inst : NaturalAdmissibleInstance α) :
    futureDefeatBroadPoint { idx := stage, adm := inst } = futureDefeatAt stage inst :=
  rfl

abbrev broad_transfer_at := @futureDefeatAt

/--
`∀`-bodies here must apply a predicate (`p ω`), not bare `theorem ω …` heads: the latter can parse
like `… ω : …` splices in `Prop` contexts (`SPEC_056_NS3`).
-/
def BroadTransferStatement (k : ℕ) : Prop :=
  let pNat : NaturalAdmissibleInstance ℕ → Prop := fun ω =>
    ProvesAtCarrier ω.sec (Nat.succ k) (ω.embedSentence (outputEnumCrownWitness k)) ∧
      ¬ ProvesAtCarrier ω.sec k (ω.embedSentence (outputEnumCrownWitness k))
  let pProd : NaturalAdmissibleInstance (Bool × ℕ) → Prop := fun ω =>
    ProvesAtCarrier ω.sec (Nat.succ k) (ω.embedSentence (outputEnumCrownWitness k)) ∧
      ¬ ProvesAtCarrier ω.sec k (ω.embedSentence (outputEnumCrownWitness k))
  (∀ ω : NaturalAdmissibleInstance ℕ, pNat ω) ∧ (∀ ω : NaturalAdmissibleInstance (Bool × ℕ), pProd ω)

theorem broad_transfer_of_generalized_crown (stage : ℕ) : BroadTransferStatement stage :=
  And.intro (fun ω => naturalClass_preserves_structural_ascent ω stage)
    (fun ω => naturalClass_preserves_structural_ascent ω stage)

theorem multiple_nontrivially_distinct_instances (n : ℕ) :
    boolTrueAdmissible.gen.trace n ≠ boolFalseAdmissible.gen.trace n ∧
      Nonempty (NaturalAdmissibleInstance ℕ) :=
  ⟨bool_true_false_trace_differ n, ⟨natCounterAdmissible⟩⟩

def CrownEncodingStatement (k : ℕ) : Prop :=
  let gap : NaturalAdmissibleInstance (Bool × ℕ) → Prop := fun ω =>
    ProvesAtCarrier ω.sec (Nat.succ k) (ω.embedSentence (outputEnumCrownWitness k)) ∧
      ¬ ProvesAtCarrier ω.sec k (ω.embedSentence (outputEnumCrownWitness k))
  (boolTrueAdmissible.gen.trace k ≠ boolFalseAdmissible.gen.trace k) ∧
    (gap boolTrueAdmissible ∧ gap boolFalseAdmissible)

theorem crown_not_encoding_artifact_in_natural_class (stage : ℕ) : CrownEncodingStatement stage :=
  And.intro (bool_true_false_trace_differ stage)
    (And.intro (naturalClass_preserves_structural_ascent boolTrueAdmissible stage)
      (naturalClass_preserves_structural_ascent boolFalseAdmissible stage))

end BroadTransfer

export BroadTransfer (naturalClass_preserves_soundness naturalClass_preserves_structural_ascent
  naturalClass_preserves_future_defeat naturalClass_preserves_nonfinality BroadPoint futureDefeatAt
  futureDefeatBroadPoint futureDefeatBroadPoint_eq broad_transfer_at BroadTransferStatement
  broad_transfer_of_generalized_crown CrownEncodingStatement multiple_nontrivially_distinct_instances
  crown_not_encoding_artifact_in_natural_class)

end Ridge

end NoveltyTheory
