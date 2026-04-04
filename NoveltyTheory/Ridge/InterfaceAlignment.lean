import NoveltyTheory.Ridge.DiagonalNat

/-!
# Interface alignment (`SPEC_006_ADR`, `SPEC_009_DST`)

Deriving **`RowSoundForSignature`** from explicit agreement with Model A’s `regimeUpto` rows—no hidden
soundness baked into `AdmissibleInterface`.
-/

namespace NoveltyTheory

namespace Ridge

namespace InterfaceAlignment

open Core Models SignatureTower Ridge

variable {υ : Type}

/-- Pointwise implication: every interface row **entails** the matching signature regime (`SPEC_006_ADR`). -/
def ReflectsSignatureRows (E : AdmissibleInterface ℕ υ ℕ) : Prop :=
  ∀ (i : ℕ) (P : Phase ℕ) (v : υ), E.explains i v P → (regimeUpto i).explains P

theorem rowSound_of_reflects (E : AdmissibleInterface ℕ υ ℕ) (h : ReflectsSignatureRows E) :
    RowSoundForSignature E :=
  h

/-- Biconditional agreement with `regimeUpto` rows (strongest common hypothesis). -/
def SignatureInterfaceAgrees (E : AdmissibleInterface ℕ υ ℕ) : Prop :=
  ∀ (i : ℕ) (P : Phase ℕ) (v : υ), E.explains i v P ↔ (regimeUpto i).explains P

theorem reflects_of_agrees (E : AdmissibleInterface ℕ υ ℕ) (h : SignatureInterfaceAgrees E) :
    ReflectsSignatureRows E :=
  fun i P v hv => (h i P v).1 hv

theorem rowSound_of_agrees (E : AdmissibleInterface ℕ υ ℕ) (h : SignatureInterfaceAgrees E) :
    RowSoundForSignature E :=
  rowSound_of_reflects E (reflects_of_agrees E h)

/-- Interface row `i` cannot explain the diagonal witness once rows agree with `regimeUpto` (`SPEC_009_DST`). -/
theorem not_rowExplains_succ_of_agrees {υ : Type} (E : AdmissibleInterface ℕ υ ℕ)
    (h : SignatureInterfaceAgrees E) (i : ℕ) : ¬ E.rowExplains i (phaseSingleton (i + 1)) :=
  diagonal_stage_defeats_row E (rowSound_of_agrees E h) i

end InterfaceAlignment

end Ridge

end NoveltyTheory
