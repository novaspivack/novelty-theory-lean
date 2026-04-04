import Mathlib.Data.Nat.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Insert
import NoveltyTheory.Core.GenerativeSystem

/-!
# Abstract simulation layer (`SPEC_030_SVE1`, `SPEC_031_SVE2`)

Prefix trace agreement and an explicit **observational equivalence does not imply trace coupling**
counterexample on `ℕ`.
-/

namespace NoveltyTheory

namespace Core

namespace SimulationVersusExplanationAbstract

open GenerativeSystem

variable {S T X : Type}

def SimulatesTracePrefix (G : GenerativeSystem S X) (H : GenerativeSystem T X) (steps : ℕ) : Prop :=
  ∀ n, n < steps → G.trace n = H.trace n

theorem simulatesTracePrefix_zero (G : GenerativeSystem S X) (H : GenerativeSystem T X) :
    SimulatesTracePrefix G H 0 := fun n hn => False.elim (Nat.not_lt_zero n hn)

private def altParity (parity : ℕ) : GenerativeSystem ℕ ℕ where
  s0 := parity
  tau := Nat.succ
  out := fun s => s % 2

private def altParityShifted : GenerativeSystem ℕ ℕ where
  s0 := 0
  tau := Nat.succ
  out := fun s => 1 - s % 2

private theorem altParity_step (parity n : ℕ) : (altParity parity).step n = parity + n := by
  induction n with
  | zero =>
      simp [GenerativeSystem.step, altParity]
  | succ n ih =>
      rw [GenerativeSystem.step_succ, ih, altParity]
      rw [Nat.add_succ]

private theorem altParity_trace (parity n : ℕ) : (altParity parity).trace n = (parity + n) % 2 := by
  show ((altParity parity).step n) % 2 = (parity + n) % 2
  rw [altParity_step]

private theorem altParityShifted_step (n : ℕ) : altParityShifted.step n = n := by
  induction n with
  | zero =>
      simp [GenerativeSystem.step, altParityShifted]
  | succ n ih =>
      rw [GenerativeSystem.step_succ, ih, altParityShifted]

private theorem altParityShifted_trace (n : ℕ) : altParityShifted.trace n = 1 - n % 2 := by
  show 1 - (altParityShifted.step n) % 2 = 1 - n % 2
  rw [altParityShifted_step]

private theorem zero_one_of_mod_two {x : ℕ} (h : ∃ a b : ℕ, (a + b) % 2 = x) : x = 0 ∨ x = 1 := by
  obtain ⟨a, b, hn⟩ := h
  subst hn
  rcases Nat.mod_two_eq_zero_or_one (a + b) with hm | hm <;> simp [hm]

private theorem exists_mod_hit (b x : ℕ) (hx : x = 0 ∨ x = 1) :
    ∃ n : ℕ, (b + n) % 2 = x := by
  rcases hx with rfl | rfl
  · rcases Nat.mod_two_eq_zero_or_one b with hb0 | hb1
    · exact ⟨0, by rw [Nat.add_zero]; simp [hb0]⟩
    · exact ⟨1, by rw [Nat.add_mod, hb1]⟩
  · rcases Nat.mod_two_eq_zero_or_one b with hb0 | hb1
    · exact ⟨1, by rw [Nat.add_mod, hb0]⟩
    · exact ⟨0, by simp [hb1]⟩

private theorem altParity_reach_eq (parity : ℕ) : (altParity parity).reachSet = ({0, 1} : Set ℕ) := by
  ext x
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff, mem_reachSet_iff]
  constructor
  · rintro ⟨n, hn⟩
    have hx : x = (parity + n) % 2 := hn.symm.trans (altParity_trace parity n)
    rw [hx]
    exact zero_one_of_mod_two ⟨parity, n, rfl⟩
  · intro hx
    obtain ⟨n, hn⟩ := exists_mod_hit parity x hx
    exact ⟨n, (altParity_trace parity n).trans hn⟩

private theorem zero_one_of_shift (x : ℕ) (h : ∃ n, 1 - n % 2 = x) : x = 0 ∨ x = 1 := by
  obtain ⟨n, hn⟩ := h
  rcases Nat.mod_two_eq_zero_or_one n with hm | hm
  · rw [hm] at hn
    have hx : x = 1 := hn.symm
    subst hx
    exact Or.inr rfl
  · rw [hm] at hn
    have hx : x = 0 := hn.symm
    subst hx
    exact Or.inl rfl

private theorem exists_shift_hit (x : ℕ) (hx : x = 0 ∨ x = 1) :
    ∃ n : ℕ, 1 - n % 2 = x := by
  rcases hx with rfl | rfl
  · exact ⟨1, by rfl⟩
  · exact ⟨0, by rfl⟩

private theorem altShifted_reach_eq : altParityShifted.reachSet = ({0, 1} : Set ℕ) := by
  ext x
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff, mem_reachSet_iff]
  constructor
  · rintro ⟨n, hn⟩
    exact zero_one_of_shift x ⟨n, (altParityShifted_trace n).symm.trans hn⟩
  · intro hx
    obtain ⟨n, hn⟩ := exists_shift_hit x hx
    exact ⟨n, (altParityShifted_trace n).trans hn⟩

theorem observationalEquiv_altParity_pair :
    observationalEquivalence (altParity 0) altParityShifted := by
  simp [observationalEquivalence, altParity_reach_eq, altShifted_reach_eq]

theorem not_traceCoupled_altParity_counterexample :
    ¬ traceCoupled (altParity 0) altParityShifted := by
  intro h
  have h0 := h 0
  rw [altParity_trace, altParityShifted_trace] at h0
  simp at h0

theorem observational_equiv_not_implies_trace_coupled :
    ¬ (∀ (S T : Type) (G : GenerativeSystem S ℕ) (H : GenerativeSystem T ℕ),
        observationalEquivalence G H → traceCoupled G H) := fun h =>
  not_traceCoupled_altParity_counterexample
    (h ℕ ℕ (altParity 0) altParityShifted observationalEquiv_altParity_pair)

theorem simulatesTracePrefix_self (S : Type) (G : GenerativeSystem S ℕ) (steps : ℕ) :
    SimulatesTracePrefix G G steps := fun _ _ => rfl

end SimulationVersusExplanationAbstract

end Core

end NoveltyTheory
