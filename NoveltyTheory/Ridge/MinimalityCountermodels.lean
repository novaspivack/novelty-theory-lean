import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Models.StratifiedFinality

/-!
# Minimality countermodels (`SPEC_060_CMI1`)

Trivial or bounded dynamics show that **unbounded output recurrence** (`FutureDefeat`) is a
real **load-bearing** input for that predicate family: constant or bounded traces are explicit
`countermodel_without_nontriviality`-style obstructions at the numeric layer.
-/

namespace NoveltyTheory

namespace Ridge

namespace MinimalityCountermodels

open Core GenerativeSystem Models StratifiedFinality

/-- Trivial dynamics on `Unit`: constant state and observation. -/
def trivialUnitGen : GenerativeSystem Unit Unit where
  s0 := ()
  tau := id
  out := id

theorem trivialUnitGen_trace (n : ℕ) : trivialUnitGen.trace n = () := by
  induction n <;> simp [trivialUnitGen, trace, step, *]

/--
Constant numeric trace: `FutureDefeat` fails because outputs never overtake a large bound.
-/
theorem not_futureDefeat_of_constant_numeric_trace {S : Type} (G : GenerativeSystem S ℕ) (c : ℕ)
    (h : ∀ n : ℕ, G.trace n = c) : ¬ FutureDefeat G := by
  intro H
  specialize H c
  obtain ⟨t, ht⟩ := H
  rw [h t] at ht
  exact Nat.not_lt.mpr (Nat.le_refl c) ht

/--
**Countermodel shape (numeric):** bounded observational height obstructs `FutureDefeat`.
-/
theorem countermodel_without_nontriviality_of_bounded_trace {S : Type} (G : GenerativeSystem S ℕ)
    (B : ℕ) (h : ∀ n : ℕ, G.trace n ≤ B) : ¬ FutureDefeat G := by
  intro H
  specialize H B
  obtain ⟨t, ht⟩ := H
  exact Nat.not_lt_of_ge (h t) ht

end MinimalityCountermodels

end Ridge

end NoveltyTheory
