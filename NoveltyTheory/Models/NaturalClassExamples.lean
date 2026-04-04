import NoveltyTheory.Core.NaturalAdmissibleClass
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Ridge.CrownTransfer

/-!
# Instances of the natural admissible class (`SPEC_056_NS3`)

These witnesses show the class contains **materially distinct** carriers: plain **`ℕ`** observation vs
**`Bool × ℕ`** tagging, and **distinct traces** on the same **`Bool × ℕ`** type.
-/

namespace NoveltyTheory

namespace Models

namespace NaturalClassExamples

open Core NoveltyTheory.Models.SignatureTower NoveltyTheory.Ridge.CrownTransfer

/-- `natCounter` with the identity numeric section. -/
def natCounterAdmissible : NaturalAdmissibleInstance ℕ where
  gen := natCounter
  sec := GeneralizedCarrier.natIdentitySection
  aligns := by
    intro n
    rw [natCounter_trace]
    rfl

/-- Default-tagged product counter (`true` on the embedded line). -/
def boolTrueAdmissible : NaturalAdmissibleInstance (Bool × ℕ) where
  gen := trueBoolProdNat
  sec := GeneralizedCarrier.trueBoolPairSection
  aligns := true_bool_aligns

/-- Alternate-tagged product counter (`false` on the embedded line). -/
def boolFalseAdmissible : NaturalAdmissibleInstance (Bool × ℕ) where
  gen := altBoolProdNat
  sec := GeneralizedCarrier.altBoolPairSection
  aligns := alt_bool_aligns

theorem bool_true_false_trace_differ (n : ℕ) :
    boolTrueAdmissible.gen.trace n ≠ boolFalseAdmissible.gen.trace n :=
  trace_true_vs_alt n

/-- The class includes both plain-**`ℕ`** and **`Bool × ℕ`** observation sorts. -/
theorem two_carrier_shapes_inhabited :
    Nonempty (NaturalAdmissibleInstance ℕ) ∧
      Nonempty (NaturalAdmissibleInstance (Bool × ℕ)) :=
  ⟨⟨natCounterAdmissible⟩, ⟨boolTrueAdmissible⟩⟩

end NaturalClassExamples

export NaturalClassExamples (natCounterAdmissible boolTrueAdmissible boolFalseAdmissible
  bool_true_false_trace_differ two_carrier_shapes_inhabited)

end Models

end NoveltyTheory
