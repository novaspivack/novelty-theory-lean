import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.ClosureDichotomy
import NoveltyTheory.Core.GenerativeSystem
import NoveltyTheory.Models.StratifiedFinality

/-!
# Closure / collapse boundary on numeric traces (`SPEC_062_CMI3`)

Sharp dichotomy: **`FutureDefeat`** (unbounded strict output recurrence vs any fixed bound)
holds **iff** the numeric trace is **not** uniformly bounded.

This is an early **characterization theorem** at the **stratified finality** layer; full
explanatory finality for arbitrary regime families is strictly richer and remains open in EPIC_014.
-/

namespace NoveltyTheory

namespace Ridge

namespace ClosureCollapseBoundary

open Core Core.ClosureDichotomy GenerativeSystem Models StratifiedFinality

variable {S : Type} (G : GenerativeSystem S ℕ)

theorem not_futureDefeat_iff_existsBoundedNumericTrace :
    ¬ FutureDefeat G ↔ ExistsBoundedNumericTrace G := by
  classical
  dsimp [FutureDefeat, ExistsBoundedNumericTrace, BoundedNumericTrace]
  constructor
  · intro h
    push_neg at h
    exact h
  · rintro ⟨B, hB⟩ hfd
    obtain ⟨t, ht⟩ := hfd B
    exact Nat.not_lt_of_ge (hB t) ht

/--
**`closure_dichotomy_numeric_trace`:** either unbounded output recurrence or uniform boundedness.
-/
theorem futureDefeat_or_existsBoundedNumericTrace :
    FutureDefeat G ∨ ExistsBoundedNumericTrace G := by
  classical
  by_cases h : FutureDefeat G
  · left; exact h
  · right
    simpa [not_futureDefeat_iff_existsBoundedNumericTrace] using h

theorem collapse_bounded_trace_implies_not_futureDefeat (B : ℕ)
    (h : BoundedNumericTrace G B) : ¬ FutureDefeat G :=
  (not_futureDefeat_iff_existsBoundedNumericTrace G).mpr ⟨B, h⟩

theorem noncollapse_futureDefeat_of_unbounded (h : FutureDefeat G) :
    ¬ ExistsBoundedNumericTrace G := by
  intro hb
  exact (not_futureDefeat_iff_existsBoundedNumericTrace G).mpr hb h

/--
Name crosswalk for **`SPEC_060`**: at the numeric-trace layer, the minimal barrier for
`FutureDefeat` is exactly this **unbounded vs uniformly bounded** dichotomy.
-/
theorem minimal_assumption_barrier_for_crown :
    FutureDefeat G ∨ ExistsBoundedNumericTrace G :=
  futureDefeat_or_existsBoundedNumericTrace G

end ClosureCollapseBoundary

end Ridge

end NoveltyTheory
