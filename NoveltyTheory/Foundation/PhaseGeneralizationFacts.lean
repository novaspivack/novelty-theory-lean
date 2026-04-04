import Mathlib.Data.List.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.GeneralizedCarrier
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.PhaseSyntaxGeneral
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.PhaseSyntaxPolyFacts
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.OutputEnumCrownFamily
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Aligned carrier semantics (`SPEC_048_GC1`)

**`carrierHolds G C`** composes like **`HoldsAt`** on **`ℕ`**, using **`C.observe (G.trace t)`** for
**`geOutput`**. When **`AlignsCarrier G C`**, truth along **`ℕ`** lifts faithfully through
**`sentenceCarrierEmbed C.embed`**.
-/

namespace NoveltyTheory

namespace Foundation

namespace PhaseGeneralizationFacts

open Function List Set NoveltyTheory.Core NoveltyTheory.Core.GeneralizedCarrier
open NoveltyTheory.Core.PhaseSyntaxGeneral
open NoveltyTheory.Foundation.PhaseSyntaxPolyFacts
open NoveltyTheory.Models.OutputEnumCrownFamily
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

variable {S X : Type}

def carrierHolds (G : GenerativeSystem S X) (C : CarrierSection X) : Sentence X → Prop
  | Sentence.phaseMem outs x => x ∈ outs
  | Sentence.traceEq n x => G.trace n = x
  | Sentence.histSeq l => ∀ p ∈ l, G.trace p.1 = p.2
  | Sentence.natPhaseTagMem tag x => C.observe x ∈ NatPhaseTag.toSet tag
  | Sentence.outputEnumMem l x => x ∈ l
  | Sentence.finConj l => ∀ φ ∈ l, carrierHolds G C φ
  | Sentence.geOutput k => ∃ t : ℕ, k < C.observe (G.trace t)
  | Sentence.and φ ψ => carrierHolds G C φ ∧ carrierHolds G C ψ
  | Sentence.or φ ψ => carrierHolds G C φ ∨ carrierHolds G C ψ
  | Sentence.not φ => ¬ carrierHolds G C φ

theorem carrier_observe_eq {G : GenerativeSystem S X} {C : CarrierSection X} (hA : AlignsCarrier G C)
    (n : ℕ) : C.observe (G.trace n) = n := by
  rw [hA, C.observe_embed]

theorem nat_trace_int (n : ℕ) : natCounter.trace n = n :=
  natCounter_trace n

mutual
theorem carrier_embed_fwd (G : GenerativeSystem S X) (C : CarrierSection X) (hA : AlignsCarrier G C)
    (φ : Sentence ℕ) (H : HoldsAt natCounter φ) :
    carrierHolds G C (sentenceCarrierEmbed C.embed φ) := by
  cases φ
  case geOutput k =>
    simp only [HoldsAt, nat_trace_int] at H
    obtain ⟨t, ht⟩ := H
    simp only [sentenceCarrierEmbed, carrierHolds]
    refine Exists.intro t ?_
    have htt := carrier_observe_eq hA t
    rwa [htt]
  case traceEq i v =>
    simp only [HoldsAt, nat_trace_int] at H
    subst H
    simp only [sentenceCarrierEmbed, carrierHolds]
    exact hA i
  case histSeq l =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt, nat_trace_int] at H ⊢
    intro p hp
    rcases List.mem_map.mp hp with ⟨q, hq, rfl⟩
    rw [← H q hq]
    exact hA q.1
  case phaseMem s x =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt, mem_image] at H ⊢
    exact ⟨x, H, rfl⟩
  case natPhaseTagMem tag x =>
    cases tag with
    | sing k =>
        simp only [sentenceCarrierEmbed, carrierHolds, C.observe_embed, HoldsAt,
          NatPhaseTag.mem_sing_iff] at H ⊢
        exact H
    | initial K =>
        simp only [sentenceCarrierEmbed, carrierHolds, C.observe_embed, HoldsAt,
          NatPhaseTag.mem_initial_iff] at H ⊢
        exact H
  case outputEnumMem l x =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    exact List.mem_map.2 ⟨x, H, rfl⟩
  case finConj L =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    intro ψ hψ
    rcases List.mem_map.mp hψ with ⟨η, hη, rfl⟩
    exact carrier_embed_fwd G C hA η (H η hη)
  case and φ ψ =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    exact ⟨carrier_embed_fwd G C hA φ H.1, carrier_embed_fwd G C hA ψ H.2⟩
  case or φ ψ =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    cases H with
    | inl H' => exact Or.inl (carrier_embed_fwd G C hA φ H')
    | inr H' => exact Or.inr (carrier_embed_fwd G C hA ψ H')
  case not φ =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    intro Hp; exact H (carrier_embed_rev G C hA φ Hp)

theorem carrier_embed_rev (G : GenerativeSystem S X) (C : CarrierSection X) (hA : AlignsCarrier G C)
    (φ : Sentence ℕ) (H : carrierHolds G C (sentenceCarrierEmbed C.embed φ)) :
    HoldsAt natCounter φ := by
  cases φ
  case geOutput k =>
    simp only [sentenceCarrierEmbed, carrierHolds] at H
    obtain ⟨t, ht⟩ := H
    have htt := carrier_observe_eq hA t
    simp only [HoldsAt, nat_trace_int]
    rw [htt] at ht
    exact ⟨t, ht⟩
  case traceEq i v =>
    simp only [sentenceCarrierEmbed, carrierHolds] at H
    have hiv : i = v := by
      have hobs : C.observe (G.trace i) = C.observe (C.embed v) := congrArg C.observe H
      have hL : C.observe (G.trace i) = i := carrier_observe_eq hA i
      have hR : C.observe (C.embed v) = v := C.observe_embed v
      exact (hL.symm.trans hobs).trans hR
    subst hiv
    simp [HoldsAt, nat_trace_int]
  case histSeq l =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    intro q hq
    have hm :=
      H (q.1, C.embed q.2) (List.mem_map_of_mem (f := fun p : ℕ × ℕ => (p.1, C.embed p.2)) hq)
    rw [hA] at hm
    simpa [nat_trace_int] using C.embed_injective hm
  case phaseMem s x =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt, mem_image] at H ⊢
    rcases H with ⟨y, hy, he⟩
    rwa [C.embed_injective he] at hy
  case natPhaseTagMem tag x =>
    cases tag with
    | sing k =>
        simp only [sentenceCarrierEmbed, carrierHolds, C.observe_embed, HoldsAt,
          NatPhaseTag.mem_sing_iff] at H ⊢
        exact H
    | initial K =>
        simp only [sentenceCarrierEmbed, carrierHolds, C.observe_embed, HoldsAt,
          NatPhaseTag.mem_initial_iff] at H ⊢
        exact H
  case outputEnumMem l x =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt, List.mem_map] at H ⊢
    rcases H with ⟨y, hy, he⟩
    rwa [C.embed_injective he] at hy
  case finConj L =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    intro η hη
    exact carrier_embed_rev G C hA η (H _ (List.mem_map_of_mem hη))
  case and φ ψ =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    exact ⟨carrier_embed_rev G C hA φ H.1, carrier_embed_rev G C hA ψ H.2⟩
  case or φ ψ =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    cases H with
    | inl H' => exact Or.inl (carrier_embed_rev G C hA φ H')
    | inr H' => exact Or.inr (carrier_embed_rev G C hA ψ H')
  case not φ =>
    simp only [sentenceCarrierEmbed, carrierHolds, HoldsAt] at H ⊢
    intro Hn; exact H (carrier_embed_fwd G C hA φ Hn)
end

/-- Spec-facing alias. -/
abbrev HoldsAtCarrier (G : GenerativeSystem S X) (C : CarrierSection X) (φ : Sentence X) : Prop :=
  carrierHolds G C φ

theorem phase_general_embed_faithful (G : GenerativeSystem S X) (C : CarrierSection X)
    (hA : AlignsCarrier G C) (φ : Sentence ℕ) :
    HoldsAt natCounter φ ↔ carrierHolds G C (sentenceCarrierEmbed C.embed φ) :=
  Iff.intro (carrier_embed_fwd G C hA φ) (carrier_embed_rev G C hA φ)

theorem prod_aligns (α : Type) [Inhabited α] :
    AlignsCarrier (prodNatCounter (α := α)) (prodCarrierSection α) := by
  intro n
  rw [prodNatCounter_trace (α := α)]
  rfl

theorem phase_general_embed_current_faithful (φ : Sentence ℕ) :
    HoldsAt natCounter φ ↔
      carrierHolds (prodNatCounter (α := Bool)) (prodCarrierSection Bool)
        (sentenceCarrierEmbed (prodCarrierSection Bool).embed φ) :=
  phase_general_embed_faithful _ _ (prod_aligns Bool) φ

theorem holdsAt_general_phase_sound {m : ℕ} {ψ : Sentence ℕ} (h : ProvesAt m ψ) :
    carrierHolds (prodNatCounter (α := Bool)) (prodCarrierSection Bool)
      (sentenceCarrierEmbed (prodCarrierSection Bool).embed ψ) :=
  (phase_general_embed_current_faithful ψ).mp (ProvabilityFacts.proves_sentence_sound h)

theorem provesAt_general_phase_sound {m : ℕ} {ψ : Sentence ℕ}
    (h : ProvesAt m ψ) :
    ∃ η : Sentence (Bool × ℕ),
      η = sentenceCarrierEmbed (prodCarrierSection Bool).embed ψ ∧
        carrierHolds (prodNatCounter (α := Bool)) (prodCarrierSection Bool) η :=
  ⟨_, rfl, holdsAt_general_phase_sound h⟩

def ProvesAtCarrier (C : CarrierSection X) (m : ℕ) (φ : Sentence X) : Prop :=
  ∃ ψ : Sentence ℕ, φ = sentenceCarrierEmbed C.embed ψ ∧ ProvesAt m ψ

theorem output_enum_carrier_embed_eq (C : CarrierSection X) (n : ℕ) (ψ : Sentence ℕ)
    (h : sentenceCarrierEmbed C.embed (outputEnumCrownWitness n) = sentenceCarrierEmbed C.embed ψ) :
    ψ = outputEnumCrownWitness n := by
  cases ψ <;> (simp [sentenceCarrierEmbed, outputEnumCrownWitness] at h <;> try contradiction)
  case outputEnumMem l x =>
    rcases h with ⟨hL, hnx⟩
    replace hnx : n = x := C.embed_injective hnx
    replace hL : List.range (n + 2) = l :=
      (map_injective_iff.2 C.embed_injective) hL
    subst hnx hL
    rfl

theorem general_phase_gap_at (n : ℕ) :
    ProvesAtCarrier (prodCarrierSection Bool) (Nat.succ n)
        (sentenceCarrierEmbed (prodCarrierSection Bool).embed (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtCarrier (prodCarrierSection Bool) n
        (sentenceCarrierEmbed (prodCarrierSection Bool).embed (outputEnumCrownWitness n)) := by
  refine And.intro ?_ ?_
  · exact ⟨outputEnumCrownWitness n, rfl, (outputEnumCrownWitness_proves_succ_not_at n).1⟩
  · rintro ⟨ψ, heq, hp⟩
    rw [output_enum_carrier_embed_eq (prodCarrierSection Bool) n ψ heq] at hp
    exact (outputEnumCrownWitness_proves_succ_not_at n).2 hp

theorem exists_general_phase_provable_gap (n : ℕ) :
    ∃ φ : Sentence (Bool × ℕ),
      ProvesAtCarrier (prodCarrierSection Bool) (Nat.succ n) φ ∧
        ¬ ProvesAtCarrier (prodCarrierSection Bool) n φ :=
  ⟨_, general_phase_gap_at n⟩

theorem general_phase_crown_family :
    ∃ (G : GenerativeSystem ℕ (Bool × ℕ)) (C : CarrierSection (Bool × ℕ)) (Φ : ℕ → Sentence (Bool × ℕ)),
      AlignsCarrier G C ∧
        (∀ n, ProvesAtCarrier C (Nat.succ n) (Φ n) ∧ ¬ ProvesAtCarrier C n (Φ n)) :=
  ⟨prodNatCounter (α := Bool), prodCarrierSection Bool,
    fun n => sentenceCarrierEmbed (prodCarrierSection Bool).embed (outputEnumCrownWitness n),
    prod_aligns Bool, fun n => general_phase_gap_at n⟩

theorem current_crown_embeds_into_general_phase_layer (n : ℕ) :
    ProvesAtCarrier (prodCarrierSection Bool) (Nat.succ n)
        (sentenceCarrierEmbed (prodCarrierSection Bool).embed (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtCarrier (prodCarrierSection Bool) n
        (sentenceCarrierEmbed (prodCarrierSection Bool).embed (outputEnumCrownWitness n)) :=
  general_phase_gap_at n

end PhaseGeneralizationFacts

end Foundation

end NoveltyTheory
