import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Models.SignatureTower

/-!
# Stratified finality predicates (`SPEC_024_NSF1`, `SPEC_026_NSF3`)

Predicates are stated for **numeric** traces (`X = ℕ`) so output comparison uses **`Nat.lt`**.
-/

namespace NoveltyTheory

namespace Models

namespace StratifiedFinality

open Core GenerativeSystem SignatureTower

def FutureDefeat {S : Type} (G : GenerativeSystem S ℕ) : Prop :=
  ∀ bound : ℕ, ∃ t : ℕ, bound < G.trace t

theorem natCounter_futureDefeat : FutureDefeat natCounter := fun bound =>
  ⟨bound + 1, by rw [natCounter_trace]; exact Nat.lt_succ_self bound⟩

def TerminalityPredicate {S : Type} (_G : GenerativeSystem S ℕ) (pred : ℕ → Prop) : Prop :=
  ∃ last : ℕ, pred last ∧ ∀ t, pred t → t ≤ last

theorem terminality_impossible_strict_output_rise {S : Type} (G : GenerativeSystem S ℕ) :
    ¬ TerminalityPredicate G (fun t : ℕ => G.trace t + 1 < G.trace t) := by
  intro h
  obtain ⟨last, hpl, _⟩ := h
  rw [← Nat.succ_eq_add_one (G.trace last)] at hpl
  exact Nat.not_succ_lt_self hpl

end StratifiedFinality

end Models

end NoveltyTheory
