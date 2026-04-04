import Mathlib.Data.Set.Basic
import Mathlib.Logic.Function.Iterate

/-!
# Generative systems (`SPEC_004_GSY`)

Deterministic discrete-time generator `G = (S, s₀, τ, out)` and emitted trace.
-/

namespace NoveltyTheory

namespace Core

universe u v

structure GenerativeSystem (S X : Type u) where
  /-- Initial state. -/
  s0 : S
  /-- Single-step transition. -/
  tau : S → S
  /-- Observable output. -/
  out : S → X

namespace GenerativeSystem

variable {S X : Type u}

/-- State after `n` steps. -/
def step (G : GenerativeSystem S X) (n : ℕ) : S :=
  (G.tau)^[n] G.s0

/-- Observed output at time `n`. -/
def trace (G : GenerativeSystem S X) (n : ℕ) : X :=
  G.out (G.step n)

/-- Outputs that appear somewhere on the trajectory. -/
def reachSet (G : GenerativeSystem S X) : Set X :=
  Set.range (G.trace)

@[simp] theorem step_zero (G : GenerativeSystem S X) : G.step 0 = G.s0 := by
  simp [step]

theorem step_succ (G : GenerativeSystem S X) (n : ℕ) :
    G.step (n + 1) = G.tau (G.step n) := by
  simp [step, Function.iterate_succ_apply']

@[simp] theorem trace_zero (G : GenerativeSystem S X) : G.trace 0 = G.out G.s0 := by
  simp [trace, step_zero]

theorem trace_succ (G : GenerativeSystem S X) (n : ℕ) :
    G.trace (n + 1) = G.out (G.tau (G.step n)) := by
  simp [trace, step_succ]

theorem mem_reachSet_iff (G : GenerativeSystem S X) (x : X) :
    x ∈ G.reachSet ↔ ∃ n : ℕ, G.trace n = x :=
  Set.mem_range

variable {T : Type u}

/--
Same **observable output set** (comparison layer for **`SPEC_003_NXT`** S9). State types may differ.
-/
abbrev observationalEquivalence {S T : Type u} (G : GenerativeSystem S X) (H : GenerativeSystem T X) :
    Prop :=
  G.reachSet = H.reachSet

/--
**Step-coupled simulation:** identical emitted values at every clock tick (strictest “exact
simulation” comparison without relating internal state spaces).
-/
abbrev traceCoupled (G : GenerativeSystem S X) (H : GenerativeSystem T X) : Prop :=
  ∀ n : ℕ, G.trace n = H.trace n

theorem reachSet_eq_of_traceCoupled {G : GenerativeSystem S X} {H : GenerativeSystem T X}
    (h : traceCoupled G H) : G.reachSet = H.reachSet := by
  ext x
  simp only [mem_reachSet_iff]
  constructor
  · rintro ⟨n, hn⟩
    exact ⟨n, (h n).symm.trans hn⟩
  · rintro ⟨n, hn⟩
    exact ⟨n, (h n).trans hn⟩

theorem observationalEquivalence_of_traceCoupled {G : GenerativeSystem S X} {H : GenerativeSystem T X}
    (h : traceCoupled G H) : observationalEquivalence G H :=
  reachSet_eq_of_traceCoupled h

end GenerativeSystem

end Core

end NoveltyTheory
