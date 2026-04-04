import NoveltyTheory.Core.NaturalityAxioms
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Ridge.DiagonalNat
import NoveltyTheory.Ridge.SignatureAdmissibleBundle

/-!
# Admissibility and weak naturality (`SPEC_054_NS1`)

Ridge-level theorems: signature-admissible interfaces occupy the abstract naturality slots introduced in
`Core.NaturalityAxioms`, and pathological universally-explanatory interfaces are excluded **definitionally**
from weak diagonal naturality.
-/

namespace NoveltyTheory

namespace Ridge

open Core Models SignatureTower

variable {υ : Type}

/-- Signature-admissible interfaces satisfy weak diagonal naturality (`SPEC_054_NS1`). -/
theorem weakNaturality_of_signatureAdmissibleInterface (E : SignatureAdmissibleInterface υ) :
    WeakDiagonalNaturality E.iface :=
  ⟨fun i => phaseSingleton (i + 1), diagonal_every_admissible E⟩

theorem weakNaturality_preserves_crown_relevance (E : AdmissibleInterface ℕ υ ℕ)
    (h : RowSoundForSignature E) (i : ℕ) :
    ¬ E.rowExplains i (phaseSingleton (i + 1)) :=
  diagonal_stage_defeats_row E h i

/-- The trivial all-explaining interface is not weakly diagonally natural (`SPEC_054_NS1`). -/
theorem weakNaturality_excludes_trivial_interface :
    ¬ WeakDiagonalNaturality trivialAdmissibleInterface := by
  rintro ⟨w, hw⟩
  exact hw 0 ⟨(), trivial⟩

/-- Row-wise soundness for the signature tower is **incompatible** with the trivial interface (`SPEC_054_NS1`). -/
theorem not_rowSound_trivialAdmissibleInterface : ¬ RowSoundForSignature trivialAdmissibleInterface := by
  intro h
  have hbogus :=
    not_explains_regime_singleton_succ (n := 0)
      (h 0 (phaseSingleton 1) () (by trivial))
  exact hbogus

/--
Current signature admissibility bundles instantiate the constructive weak naturality class (`SPEC_054_NS1`).
-/
def current_admissibility_is_natural_instance (E : SignatureAdmissibleInterface υ) :
    IsWeakDiagonalNatural ℕ υ ℕ E.iface where
  diagWitness := fun i => phaseSingleton (i + 1)
  diagDefeatsRow := diagonal_every_admissible E

instance isWeakDiagonal_natural_signature (E : SignatureAdmissibleInterface υ) :
    IsWeakDiagonalNatural ℕ υ ℕ E.iface :=
  current_admissibility_is_natural_instance E

end Ridge

end NoveltyTheory
