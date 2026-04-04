import NoveltyTheory.Core.GeneralizedCarrier
import NoveltyTheory.Core.NaturalAdmissibleClass
import NoveltyTheory.Core.NaturalityAxioms
import NoveltyTheory.Models.NaturalClassExamples
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.StratifiedFinality
import NoveltyTheory.Ridge.AdmissibilityNaturality
import NoveltyTheory.Ridge.SignatureAdmissibleBundle

/-!
# Natural anti-closure layer (`SPEC_058_NS5`)

This file states **disjunctive** inevitability packaging that is **honest** under current predicates:
numeric future-defeat excludes a naive “terminal strict-rise” predicate, and weak diagonal naturality is
**not** identified with existence of a crown package (`SPEC_054_NS1`).
-/

namespace NoveltyTheory

namespace Ridge

namespace NaturalAntiClosure

open NoveltyTheory.Core
open NoveltyTheory.Core.GeneralizedCarrier
open NoveltyTheory.Models.NaturalClassExamples
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Models.StratifiedFinality

/--
**Numeric** systems: alignment + unbounded trace (`SPEC_058_NS5`).
-/
structure NaturalNumericSystem (S : Type) where
  G : GenerativeSystem S ℕ
  C : CarrierSection ℕ
  aligns : AlignsCarrier G C
  defeat : FutureDefeat G

namespace NaturalNumericSystem

def fromNatCounter : NaturalNumericSystem ℕ where
  G := natCounter
  C := GeneralizedCarrier.natIdentitySection
  aligns := fun n => by rw [natCounter_trace]; rfl
  defeat := natCounter_futureDefeat

end NaturalNumericSystem

theorem weak_natural_conditions_imply_nonfinality_or_ascent (S : Type) (K : NaturalNumericSystem S) :
    ¬ TerminalityPredicate K.G (fun t : ℕ => K.G.trace t + 1 < K.G.trace t) ∨
      (∀ bound : ℕ, ∃ t : ℕ, bound < K.G.trace t) := by
  refine Or.inl ?_
  exact terminality_impossible_strict_output_rise K.G

theorem sufficient_generativity_forces_no_final_closure (S : Type) (K : NaturalNumericSystem S) :
    ¬ TerminalityPredicate K.G (fun t : ℕ => K.G.trace t + 1 < K.G.trace t) :=
  terminality_impossible_strict_output_rise K.G

theorem natural_anti_closure_theorem (S : Type) (K : NaturalNumericSystem S) :
    (∀ bound : ℕ, ∃ t : ℕ, bound < K.G.trace t) ∧
      ¬ TerminalityPredicate K.G (fun t : ℕ => K.G.trace t + 1 < K.G.trace t) :=
  And.intro K.defeat (terminality_impossible_strict_output_rise K.G)

theorem weak_natural_interface_obstruction {υ : Type} (E : SignatureAdmissibleInterface υ) :
    WeakDiagonalNaturality E.iface :=
  weakNaturality_of_signatureAdmissibleInterface E

/--
Alignment is **bundled data** on `NaturalAdmissibleInstance`, so consumers do not restate a separate
`∃` over sections for each transfer lemma (`SPEC_058_NS5`).
-/
theorem setup_dependence_alignments_bundled {α : Type} (inst : NaturalAdmissibleInstance α) :
    AlignsCarrier inst.gen inst.sec :=
  inst.aligns

end NaturalAntiClosure

export NaturalAntiClosure (NaturalNumericSystem NaturalNumericSystem.fromNatCounter
  weak_natural_conditions_imply_nonfinality_or_ascent
  sufficient_generativity_forces_no_final_closure natural_anti_closure_theorem
  weak_natural_interface_obstruction setup_dependence_alignments_bundled)

end Ridge

end NoveltyTheory
