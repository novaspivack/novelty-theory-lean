import NoveltyTheory.Core.GeneralizedCarrier
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.PhaseSyntaxGeneral
import NoveltyTheory.Foundation.PhaseGeneralizationFacts
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.OutputEnumCrownFamily
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Crown transfer across tagged **`Bool × ℕ`** generators (`SPEC_052_GC5`).

**`trueBoolProdNat`** and **`altBoolProdNat`** disagree on the **Bool** observation at every time,
yet each aligns with its **`CarrierSection`**, so **`ProvesAtCarrier`** pulls back the same **`ℕ`**
enum witness family.
-/

namespace NoveltyTheory

namespace Ridge

namespace CrownTransfer

open NoveltyTheory.Core NoveltyTheory.Core.GeneralizedCarrier
open NoveltyTheory.Core.PhaseSyntaxGeneral
open NoveltyTheory.Foundation.PhaseGeneralizationFacts
open NoveltyTheory.Models.OutputEnumCrownFamily
open NoveltyTheory.Foundation.ProvabilityFacts
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

def trueBoolProdNat : GenerativeSystem ℕ (Bool × ℕ) where
  s0 := 0
  tau := Nat.succ
  out := fun s : ℕ => (true, s)

theorem trueBoolProdNat_trace (n : ℕ) : trueBoolProdNat.trace n = (true, n) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hs : trueBoolProdNat.step n = n := by
      simpa [GenerativeSystem.trace, GenerativeSystem.step, trueBoolProdNat] using ih
    calc
      trueBoolProdNat.trace (n + 1)
          = trueBoolProdNat.out (trueBoolProdNat.tau (trueBoolProdNat.step n)) := by
        rw [GenerativeSystem.trace_succ]
      _ = (true, Nat.succ (trueBoolProdNat.step n)) := rfl
      _ = (true, Nat.succ n) := by rw [hs]

def altBoolProdNat : GenerativeSystem ℕ (Bool × ℕ) where
  s0 := 0
  tau := Nat.succ
  out := fun s : ℕ => (false, s)

theorem altBoolProdNat_trace (n : ℕ) : altBoolProdNat.trace n = (false, n) := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hs : altBoolProdNat.step n = n := by
      simpa [GenerativeSystem.trace, GenerativeSystem.step, altBoolProdNat] using ih
    calc
      altBoolProdNat.trace (n + 1)
          = altBoolProdNat.out (altBoolProdNat.tau (altBoolProdNat.step n)) := by
        rw [GenerativeSystem.trace_succ]
      _ = (false, Nat.succ (altBoolProdNat.step n)) := rfl
      _ = (false, Nat.succ n) := by rw [hs]

theorem true_bool_aligns : AlignsCarrier trueBoolProdNat trueBoolPairSection := by
  intro n
  rw [trueBoolProdNat_trace]
  rfl

theorem alt_bool_aligns : AlignsCarrier altBoolProdNat altBoolPairSection := by
  intro n
  rw [altBoolProdNat_trace]
  rfl

theorem trace_true_vs_alt (n : ℕ) : trueBoolProdNat.trace n ≠ altBoolProdNat.trace n := by
  rw [trueBoolProdNat_trace, altBoolProdNat_trace]
  intro h
  cases (congrArg Prod.fst h : true = false)

theorem phase_general_embed_true_faithful (φ : Sentence ℕ) :
    HoldsAt natCounter φ ↔
      carrierHolds trueBoolProdNat trueBoolPairSection
        (sentenceCarrierEmbed trueBoolPairSection.embed φ) :=
  phase_general_embed_faithful trueBoolProdNat trueBoolPairSection true_bool_aligns φ

theorem phase_general_embed_alt_faithful (φ : Sentence ℕ) :
    HoldsAt natCounter φ ↔
      carrierHolds altBoolProdNat altBoolPairSection
        (sentenceCarrierEmbed altBoolPairSection.embed φ) :=
  phase_general_embed_faithful altBoolProdNat altBoolPairSection alt_bool_aligns φ

theorem admissibleClass_preserves_soundness {m : ℕ} {ψ : Sentence ℕ} (h : ProvesAt m ψ) :
    carrierHolds trueBoolProdNat trueBoolPairSection
        (sentenceCarrierEmbed trueBoolPairSection.embed ψ) ∧
      carrierHolds altBoolProdNat altBoolPairSection
        (sentenceCarrierEmbed altBoolPairSection.embed ψ) :=
  And.intro ((phase_general_embed_true_faithful ψ).mp (proves_sentence_sound h))
    ((phase_general_embed_alt_faithful ψ).mp (proves_sentence_sound h))

theorem true_general_phase_gap_at (n : ℕ) :
    ProvesAtCarrier trueBoolPairSection (Nat.succ n)
        (sentenceCarrierEmbed trueBoolPairSection.embed (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtCarrier trueBoolPairSection n
        (sentenceCarrierEmbed trueBoolPairSection.embed (outputEnumCrownWitness n)) := by
  refine And.intro ?_ ?_
  · exact ⟨outputEnumCrownWitness n, rfl, (outputEnumCrownWitness_proves_succ_not_at n).1⟩
  · rintro ⟨ψ, heq, hp⟩
    rw [output_enum_carrier_embed_eq trueBoolPairSection n ψ heq] at hp
    exact (outputEnumCrownWitness_proves_succ_not_at n).2 hp

theorem alt_general_phase_gap_at (n : ℕ) :
    ProvesAtCarrier altBoolPairSection (Nat.succ n)
        (sentenceCarrierEmbed altBoolPairSection.embed (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtCarrier altBoolPairSection n
        (sentenceCarrierEmbed altBoolPairSection.embed (outputEnumCrownWitness n)) := by
  refine And.intro ?_ ?_
  · exact ⟨outputEnumCrownWitness n, rfl, (outputEnumCrownWitness_proves_succ_not_at n).1⟩
  · rintro ⟨ψ, heq, hp⟩
    rw [output_enum_carrier_embed_eq altBoolPairSection n ψ heq] at hp
    exact (outputEnumCrownWitness_proves_succ_not_at n).2 hp

theorem admissibleClass_preserves_gap_structure (n : ℕ) :
    ProvesAtCarrier trueBoolPairSection (Nat.succ n)
        (sentenceCarrierEmbed trueBoolPairSection.embed (outputEnumCrownWitness n)) ∧
      ProvesAtCarrier altBoolPairSection (Nat.succ n)
        (sentenceCarrierEmbed altBoolPairSection.embed (outputEnumCrownWitness n)) :=
  And.intro (true_general_phase_gap_at n).1 (alt_general_phase_gap_at n).1

theorem crown_transfers_across_admissible_class (n : ℕ) :
    (∃ (G : GenerativeSystem ℕ (Bool × ℕ)) (C : CarrierSection (Bool × ℕ)),
        AlignsCarrier G C ∧
          ProvesAtCarrier C (Nat.succ n) (sentenceCarrierEmbed C.embed (outputEnumCrownWitness n)) ∧
            ¬ ProvesAtCarrier C n (sentenceCarrierEmbed C.embed (outputEnumCrownWitness n))) ∧
      (∀ n0 : ℕ, trueBoolProdNat.trace n0 ≠ altBoolProdNat.trace n0) :=
  And.intro ⟨_, trueBoolPairSection, true_bool_aligns, true_general_phase_gap_at n⟩ trace_true_vs_alt

/-- **`Bool`** observation carried by the **`outputEnumMem`** witness point. -/
def witnessOutputEnumBool (φ : Sentence (Bool × ℕ)) : Option Bool :=
  match φ with
  | Sentence.outputEnumMem _ (b, _) => some b
  | _ => none

theorem witnessOutput_true_of_trueEmbed (n : ℕ) :
    witnessOutputEnumBool (sentenceCarrierEmbed trueBoolPairSection.embed (outputEnumCrownWitness n)) =
      some true := by
  simp [witnessOutputEnumBool, sentenceCarrierEmbed, outputEnumCrownWitness, trueBoolPairSection]

theorem witnessOutput_false_of_altEmbed (n : ℕ) :
    witnessOutputEnumBool (sentenceCarrierEmbed altBoolPairSection.embed (outputEnumCrownWitness n)) =
      some false := by
  simp [witnessOutputEnumBool, sentenceCarrierEmbed, outputEnumCrownWitness, altBoolPairSection]

theorem exists_two_nonisomorphic_crown_instances (n : ℕ) :
    ∃ φ ψ : Sentence (Bool × ℕ), φ ≠ ψ ∧
      ProvesAtCarrier trueBoolPairSection (Nat.succ n) φ ∧
        ProvesAtCarrier altBoolPairSection (Nat.succ n) ψ :=
  ⟨sentenceCarrierEmbed trueBoolPairSection.embed (outputEnumCrownWitness n),
    sentenceCarrierEmbed altBoolPairSection.embed (outputEnumCrownWitness n),
    And.intro
      (by
        intro he
        have hopt : some true = some false := by
          rw [← witnessOutput_true_of_trueEmbed n, ← witnessOutput_false_of_altEmbed n]
          exact congrArg witnessOutputEnumBool he
        have hb := Option.some.inj hopt
        cases hb)
      (And.intro (true_general_phase_gap_at n).1 (alt_general_phase_gap_at n).1)⟩

theorem generalized_crown_not_single_model_artifact :
    ∃ G1 G2 : GenerativeSystem ℕ (Bool × ℕ),
      (∃ C1 : CarrierSection (Bool × ℕ), AlignsCarrier G1 C1) ∧
        (∃ C2 : CarrierSection (Bool × ℕ), AlignsCarrier G2 C2) ∧
          (∃ n0 : ℕ, G1.trace n0 ≠ G2.trace n0) :=
  ⟨trueBoolProdNat, altBoolProdNat, ⟨_, true_bool_aligns⟩, ⟨_, alt_bool_aligns⟩, 0,
    trace_true_vs_alt 0⟩

end CrownTransfer

end Ridge

end NoveltyTheory
