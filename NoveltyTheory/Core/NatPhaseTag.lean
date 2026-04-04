import Mathlib.Data.Nat.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Insert

/-!
# Naming phases on ℕ (`SPEC_013` extension)

Finite **grammars** for output predicates used by **`natPhaseTagMem`**: a **singleton** tag names
`{k}`, and an **initial-segment** tag names outputs **`x` with `x ≤ K`** (no separate Mathlib
interval import required).
-/

namespace NoveltyTheory

namespace Core

inductive NatPhaseTag : Type
  /-- Singleton output class `{k}`. -/
  | sing : ℕ → NatPhaseTag
  /-- Initial value segment `{ x // x ≤ K }`. -/
  | initial : ℕ → NatPhaseTag

namespace NatPhaseTag

def toSet : NatPhaseTag → Set ℕ
  | sing k => {k}
  | initial K => {x : ℕ | x ≤ K}

def bound : NatPhaseTag → ℕ
  | sing k => k
  | initial K => K

@[simp] theorem mem_sing_iff (k x : ℕ) : x ∈ (toSet (sing k)) ↔ x = k := by
  simp [toSet, Set.mem_singleton_iff]

@[simp] theorem mem_initial_iff (K x : ℕ) : x ∈ (toSet (initial K)) ↔ x ≤ K := by
  rfl

end NatPhaseTag

export NatPhaseTag (toSet bound)

end Core

end NoveltyTheory
