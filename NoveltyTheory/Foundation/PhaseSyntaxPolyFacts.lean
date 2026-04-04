import Mathlib.Data.List.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Core.NatPhaseTag
import NoveltyTheory.Core.PhaseSyntaxPoly
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.OutputEnumCrownFamily
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Polymorphic product semantics (`SPEC_044_CG3`)

**`HoldsAtProd`** and **`prodNatCounter`** interpret **`Sentence (α × ℕ)`** with **`geOutput`** measured on
**`(G.trace t).snd`**.

**Faithfulness (`phaseSyntaxPoly_embed_nat_faithful`).** Full semantic alignment
**`HoldsAt natCounter φ ↔ HoldsAtProd … (sentencePolyEmbed φ)`** for **all** **`φ`** at carrier **`Unit × ℕ`**
(proof: mutual forward/reverse maps, with **`not`** tied via contraposition).

**Operational closure (`SPEC_044`).** **`poly_phase_crown_family`** pulls back **`outputEnumCrownWitness`** through
**`sentencePolyEmbed`**; **`exists_poly_phase_provable_gap`** packages the **strict ascent** at the poly layer.
The **generator** **`PhaseSyntaxPoly`** embed is **conservative** (numeric atoms become **`(default, n)`** pairs).
-/

namespace NoveltyTheory

namespace Foundation

namespace PhaseSyntaxPolyFacts

open Function List Set NoveltyTheory.Core NoveltyTheory.Core.PhaseSyntaxPoly
open NoveltyTheory.Models.OutputEnumCrownFamily
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower

variable {S α : Type} [Inhabited α]

def HoldsAtProd (G : GenerativeSystem S (α × ℕ)) : Sentence (α × ℕ) → Prop
  | Sentence.phaseMem outs x => x ∈ outs
  | Sentence.traceEq n x => G.trace n = x
  | Sentence.histSeq l => ∀ p ∈ l, G.trace p.1 = p.2
  | Sentence.natPhaseTagMem tag x => x.snd ∈ NatPhaseTag.toSet tag
  | Sentence.outputEnumMem l x => x ∈ l
  | Sentence.finConj l => ∀ φ ∈ l, HoldsAtProd G φ
  | Sentence.geOutput k => ∃ t : ℕ, k < (G.trace t).snd
  | Sentence.and φ ψ => HoldsAtProd G φ ∧ HoldsAtProd G ψ
  | Sentence.or φ ψ => HoldsAtProd G φ ∨ HoldsAtProd G ψ
  | Sentence.not φ => ¬ HoldsAtProd G φ

def prodNatCounter : GenerativeSystem ℕ (α × ℕ) where
  s0 := 0
  tau := Nat.succ
  out := fun s : ℕ => (default, s)

theorem prodNatCounter_trace (n : ℕ) : (prodNatCounter (α := α)).trace n = embedNatPair n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hs : (prodNatCounter (α := α)).step n = n := by
      simpa [GenerativeSystem.trace, GenerativeSystem.step, prodNatCounter, embedNatPair] using ih
    calc
      (prodNatCounter (α := α)).trace (n + 1)
          = (prodNatCounter (α := α)).out ((prodNatCounter (α := α)).tau ((prodNatCounter (α := α)).step n)) := by
        rw [GenerativeSystem.trace_succ]
      _ = (default, Nat.succ ((prodNatCounter (α := α)).step n)) := rfl
      _ = (default, Nat.succ n) := by rw [hs]
      _ = embedNatPair (n + 1) := rfl

omit [Inhabited α] in
theorem embedNatPair_injective [Inhabited α] :
    Function.Injective (embedNatPair (α := α)) := fun _ _ h => (Prod.mk.inj h).2

def ProvesAtPoly (m : ℕ) (φ : Sentence (α × ℕ)) : Prop :=
  ∃ ψ : Sentence ℕ, φ = sentencePolyEmbed ψ ∧ ProvesAt m ψ

mutual
theorem phaseSyntaxPoly_embed_fwd (φ : Sentence ℕ) (H : HoldsAt natCounter φ) :
    HoldsAtProd (prodNatCounter (α := Unit)) (sentencePolyEmbed φ) := by
  cases φ
  case geOutput k =>
    simpa [sentencePolyEmbed, HoldsAt, HoldsAtProd, natCounter_trace, prodNatCounter_trace, embedNatPair] using H
  case traceEq i v =>
    simpa [sentencePolyEmbed, HoldsAt, HoldsAtProd, natCounter_trace, prodNatCounter_trace, embedNatPair] using H
  case histSeq l =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd, natCounter_trace] at H ⊢
    intro p hp
    rcases List.mem_map.mp hp with ⟨q, hq, rfl⟩
    simpa [prodNatCounter_trace, natCounter_trace, embedNatPair] using H q hq
  case phaseMem s x =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd, mem_image, embedNatPair] at H ⊢
    exact ⟨x, H, rfl⟩
  case natPhaseTagMem tag x =>
    cases tag <;> simp [sentencePolyEmbed, HoldsAt, HoldsAtProd, embedNatPair, NatPhaseTag.mem_sing_iff,
      NatPhaseTag.mem_initial_iff] at H ⊢ <;> assumption
  case outputEnumMem l x =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd, embedNatPair] at H ⊢
    exact List.mem_map.2 ⟨x, H, rfl⟩
  case finConj L =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    intro ψ hψ
    rcases List.mem_map.mp hψ with ⟨η, hη, rfl⟩
    exact phaseSyntaxPoly_embed_fwd η (H η hη)
  case and φ ψ =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    exact ⟨phaseSyntaxPoly_embed_fwd φ H.1, phaseSyntaxPoly_embed_fwd ψ H.2⟩
  case or φ ψ =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    cases H with
    | inl H' => exact Or.inl (phaseSyntaxPoly_embed_fwd φ H')
    | inr H' => exact Or.inr (phaseSyntaxPoly_embed_fwd ψ H')
  case not φ =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    intro Hp; exact H (phaseSyntaxPoly_embed_rev φ Hp)

theorem phaseSyntaxPoly_embed_rev (φ : Sentence ℕ) (H : HoldsAtProd (prodNatCounter (α := Unit)) (sentencePolyEmbed φ)) :
    HoldsAt natCounter φ := by
  cases φ
  case geOutput k =>
    simpa [sentencePolyEmbed, HoldsAt, HoldsAtProd, natCounter_trace, prodNatCounter_trace, embedNatPair] using H
  case traceEq i v =>
    simpa [sentencePolyEmbed, HoldsAt, HoldsAtProd, natCounter_trace, prodNatCounter_trace, embedNatPair] using H
  case histSeq l =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    intro q hq
    have hm : (q.1, embedNatPair (α := Unit) q.2) ∈ List.map (fun p : ℕ × ℕ => (p.1, embedNatPair (α := Unit) p.2)) l :=
      List.mem_map_of_mem (f := fun p : ℕ × ℕ => (p.1, embedNatPair (α := Unit) p.2)) hq
    have htr := H (q.1, embedNatPair q.2) hm
    rw [prodNatCounter_trace] at htr
    simpa [natCounter_trace, embedNatPair] using embedNatPair_injective (α := Unit) htr
  case phaseMem s x =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd, mem_image, embedNatPair] at H ⊢
    rcases H with ⟨y, hy, he⟩
    have hxy : y = x := embedNatPair_injective (α := Unit) he
    subst hxy
    exact hy
  case natPhaseTagMem tag x =>
    cases tag <;> simp [sentencePolyEmbed, HoldsAt, HoldsAtProd, embedNatPair, NatPhaseTag.mem_sing_iff,
      NatPhaseTag.mem_initial_iff] at H ⊢ <;> assumption
  case outputEnumMem l x =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd, List.mem_map, embedNatPair] at H ⊢
    rcases H with ⟨y, hy, he⟩
    have hxy : y = x := embedNatPair_injective (α := Unit) he
    subst hxy
    exact hy
  case finConj L =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    intro η hη
    exact phaseSyntaxPoly_embed_rev η (H (sentencePolyEmbed η) (List.mem_map_of_mem hη))
  case and φ ψ =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    exact ⟨phaseSyntaxPoly_embed_rev φ H.1, phaseSyntaxPoly_embed_rev ψ H.2⟩
  case or φ ψ =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    cases H with
    | inl H' => exact Or.inl (phaseSyntaxPoly_embed_rev φ H')
    | inr H' => exact Or.inr (phaseSyntaxPoly_embed_rev ψ H')
  case not φ =>
    simp only [sentencePolyEmbed, HoldsAt, HoldsAtProd] at H ⊢
    intro Hn; exact H (phaseSyntaxPoly_embed_fwd φ Hn)
end

/-- Full **`Unit × ℕ`** semantic alignment for the conservative poly embed. -/
theorem phaseSyntaxPoly_embed_nat_faithful (φ : Sentence ℕ) :
    HoldsAt natCounter φ ↔ HoldsAtProd (prodNatCounter (α := Unit)) (sentencePolyEmbed φ) :=
  Iff.intro (phaseSyntaxPoly_embed_fwd φ) (phaseSyntaxPoly_embed_rev φ)

/-- **Enum-crown** layer (specialization of **`phaseSyntaxPoly_embed_nat_faithful`**). -/
theorem phaseSyntaxPoly_embed_nat_faithful_on_enum_crown (n : ℕ) :
    HoldsAt natCounter (outputEnumCrownWitness n) ↔
      HoldsAtProd (prodNatCounter (α := Unit)) (sentencePolyEmbed (outputEnumCrownWitness n)) :=
  phaseSyntaxPoly_embed_nat_faithful _

theorem provesAt_poly_phase_sound {m : ℕ} {ψ : Sentence ℕ} (h : ProvesAt m ψ) :
    HoldsAtProd (prodNatCounter (α := Unit)) (sentencePolyEmbed ψ) :=
  (phaseSyntaxPoly_embed_nat_faithful ψ).mp (ProvabilityFacts.proves_sentence_sound h)

theorem outputEnum_crown_embed_eq (n : ℕ) (ψ : Sentence ℕ)
    (h : sentencePolyEmbed (α := Unit) (outputEnumCrownWitness n) = sentencePolyEmbed (α := Unit) ψ) :
    ψ = outputEnumCrownWitness n := by
  cases ψ
    <;> (simp [sentencePolyEmbed, outputEnumCrownWitness] at h; try contradiction)
  case outputEnumMem l x =>
    rcases h with ⟨hL, hnx⟩
    have hx : n = x := hnx
    have hl : List.range (n + 2) = l := (map_injective_iff.2 (embedNatPair_injective (α := Unit))) hL
    subst hx hl
    rfl

theorem poly_phase_gap_at (n : ℕ) :
    ProvesAtPoly (n + 1) (sentencePolyEmbed (α := Unit) (outputEnumCrownWitness n)) ∧
      ¬ ProvesAtPoly n (sentencePolyEmbed (α := Unit) (outputEnumCrownWitness n)) := by
  refine And.intro ?_ ?_
  · exact ⟨_, rfl, (outputEnumCrownWitness_proves_succ_not_at n).1⟩
  · intro ⟨ψ, heq, hp⟩
    rw [outputEnum_crown_embed_eq n ψ heq] at hp
    exact (outputEnumCrownWitness_proves_succ_not_at n).2 hp

theorem exists_poly_phase_provable_gap (n : ℕ) :
    ∃ φ : Sentence (Unit × ℕ), ProvesAtPoly (n + 1) φ ∧ ¬ ProvesAtPoly n φ :=
  ⟨_, poly_phase_gap_at n⟩

theorem poly_phase_crown_family :
    ∃ (_ : GenerativeSystem ℕ (Unit × ℕ)) (Φ : ℕ → Sentence (Unit × ℕ)),
      (∀ n, ProvesAtPoly (n + 1) (Φ n) ∧ ¬ ProvesAtPoly n (Φ n)) :=
  ⟨prodNatCounter (α := Unit), fun n => sentencePolyEmbed (outputEnumCrownWitness n), fun n => poly_phase_gap_at n⟩

end PhaseSyntaxPolyFacts

end Foundation

end NoveltyTheory
