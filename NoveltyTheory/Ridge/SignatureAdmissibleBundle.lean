import NoveltyTheory.Ridge.DiagonalNat

/-!
# Globally “admissible” signature interfaces (bookkeeping)

There is **no** uniform diagonal statement for **arbitrary** `AdmissibleInterface`—the trivial
interface that claims every row explains every phase refutes it.

The honest **`𝓔_adm`-style** pattern is therefore: **carry row-soundness in the type** of objects
quantified over, so summit theorems need **no separate** `RowSoundForSignature` hypothesis.
-/

namespace NoveltyTheory

namespace Ridge

open Core Models SignatureTower

/-- Row-sound interfaces relative to **`regimeUpto`** bundled as data (`SPEC_009_DST`). -/
structure SignatureAdmissibleInterface (υ : Type) where
  /-- Underlying indexed explanation relation. -/
  iface : AdmissibleInterface ℕ υ ℕ
  /-- Each claimed explanation is semantically backed by the matching signature regime. -/
  sound : RowSoundForSignature iface

theorem diagonal_every_admissible {υ : Type} (E : SignatureAdmissibleInterface υ) (i : ℕ) :
    ¬ E.iface.rowExplains i (phaseSingleton (i + 1)) :=
  diagonal_stage_defeats_row E.iface E.sound i

/-- Extract the plain interface (e.g. for `explainsTowerStage`). -/
def SignatureAdmissibleInterface.toInterface {υ : Type} (E : SignatureAdmissibleInterface υ) :
    AdmissibleInterface ℕ υ ℕ :=
  E.iface

/-! ## Why bundling is unavoidable

Without **`RowSoundForSignature`**, row-wise defeat of the standard diagonal witness is **false**:
every row can nominally “explain” everything.
-/

/-- Interface whose rows accept **every** phase—diagonal-proof **requires** a nontriviality class. -/
def trivialAdmissibleInterface : AdmissibleInterface ℕ Unit ℕ where
  explains := fun _ _ _ => True

theorem trivialInterface_rows_claim_everything (i : ℕ) :
    trivialAdmissibleInterface.rowExplains i (phaseSingleton (i + 1)) :=
  ⟨(), trivial⟩

end Ridge

end NoveltyTheory
