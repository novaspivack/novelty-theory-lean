import Mathlib.Data.Fin.Basic
import Mathlib.Data.List.Range
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Insert
import NoveltyTheory.Core.ParadigmShift
import NoveltyTheory.Core.Tower
import NoveltyTheory.Foundation.Trajectory

/-!
# Model A — “signature strength” tower (`SPEC_012_MDL`)

Ticks `n : ℕ`; regimes use `Fin (n + 1)` so they name outputs `0 … n`. The next tick needs a
strictly larger descriptor universe, giving stage-wise **ParadigmShift** with conservative
extension and failure of back-reduction.
-/

namespace NoveltyTheory

namespace Models

namespace SignatureTower

open Core

/-- Phase carried by the singleton output `{k}`. -/
def phaseSingleton (k : ℕ) : Phase ℕ where
  outputSet := {k}
  Invariants := Unit
  realizes := fun _ => {k}
  realizes_subset := by
    intro ⟨⟩ x hx
    simpa using hx

theorem phaseSingleton_output (k : ℕ) : (phaseSingleton k).outputSet = ({k} : Set ℕ) := rfl

/-- Observable counter: state `ℕ`, tick `Nat.succ`, observation identity. -/
def natCounter : GenerativeSystem ℕ ℕ where
  s0 := 0
  tau := Nat.succ
  out := id

theorem natCounter_trace (n : ℕ) : natCounter.trace n = n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hs : natCounter.step n = n := by
      simpa [GenerativeSystem.trace, GenerativeSystem.step, natCounter] using ih
    calc
      natCounter.trace (n + 1) = natCounter.out (natCounter.tau (natCounter.step n)) := by
        rw [GenerativeSystem.trace_succ]
      _ = Nat.succ (natCounter.step n) := rfl
      _ = Nat.succ n := by rw [hs]
      _ = n + 1 := rfl

theorem natCounter_generated (k : ℕ) : (phaseSingleton k).generatedBy natCounter := by
  rw [Phase.generatedBy, Set.subset_def]
  intro x hx
  rw [phaseSingleton_output, Set.mem_singleton_iff] at hx
  rw [hx, GenerativeSystem.mem_reachSet_iff]
  exact ⟨k, natCounter_trace k⟩

/-- Regime that **exactly** names outputs `0 … n` via `Fin (n + 1)`. -/
def regimeUpto (n : ℕ) : ExplanatoryRegime ℕ where
  Desc := Fin (n + 1)
  Adequate := fun d P => P.outputSet = ({d.val} : Set ℕ)

theorem regimeUpto_adequate_iff {n : ℕ} (d : Fin (n + 1)) (P : Phase ℕ) :
    (regimeUpto n).Adequate d P ↔ P.outputSet = ({d.val} : Set ℕ) :=
  Iff.rfl

theorem regimeUpto_explains_singleton {n k : ℕ} :
    (regimeUpto n).explains (phaseSingleton k) ↔ k ≤ n := by
  constructor
  · intro h
    rcases h with ⟨d, hd⟩
    have hset : ({k} : Set ℕ) = ({d.val} : Set ℕ) :=
      (regimeUpto_adequate_iff d (phaseSingleton k)).1 hd
    rw [Set.singleton_eq_singleton_iff] at hset
    have hknd : d.val ≤ n := Nat.le_of_lt_succ d.prop
    rw [hset]
    exact hknd
  · intro hk
    have hk' : k < n + 1 := Nat.lt_succ_of_le hk
    refine ⟨⟨k, hk'⟩, ?_⟩
    simp [regimeUpto_adequate_iff, phaseSingleton_output]

theorem not_explains_regime_singleton_succ {n : ℕ} :
    ¬ (regimeUpto n).explains (phaseSingleton (n + 1)) := by
  intro h
  have := (regimeUpto_explains_singleton (n := n) (k := n + 1)).mp h
  exact Nat.not_succ_le_self n this

theorem mem_history_range {n m : ℕ} (hm : m < n + 1) :
    phaseSingleton m ∈ (List.range (n + 1)).map phaseSingleton := by
  simp [List.mem_map]
  exact ⟨m, by simpa [List.mem_range] using hm, rfl⟩

theorem conservative_castSucc (n : ℕ) :
    ConservativeExtension (regimeUpto n) (regimeUpto (n + 1))
      ((List.range (n + 1)).map phaseSingleton) Fin.castSucc := by
  intro P hP d hd
  rcases List.mem_map.1 hP with ⟨m, hm, rfl⟩
  rw [List.mem_range] at hm
  refine (regimeUpto_adequate_iff _ _).2 ?_
  calc
    (phaseSingleton m).outputSet = ({m} : Set ℕ) := phaseSingleton_output m
    _ = ({d.val} : Set ℕ) := (regimeUpto_adequate_iff d _).1 hd
    _ = ({(Fin.castSucc d).val} : Set ℕ) := rfl

theorem conservativeOver_castSucc (n : ℕ) :
    ConservativeOver ((List.range (n + 1)).map phaseSingleton) (regimeUpto n) (regimeUpto (n + 1)) :=
  ⟨Fin.castSucc, conservative_castSucc n⟩

theorem adequateWitness_succ (n : ℕ) :
    (regimeUpto (n + 1)).Adequate ⟨n + 1, Nat.lt_succ_self (n + 1)⟩
      (phaseSingleton (n + 1)) := by
  simp [regimeUpto_adequate_iff, phaseSingleton_output]

theorem later_explains_witness (n : ℕ) :
    (regimeUpto (n + 1)).explains (phaseSingleton (n + 1)) :=
  ⟨_, adequateWitness_succ n⟩

theorem witness_mem_tail (n : ℕ) :
    phaseSingleton (n + 1) ∈
      (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) := by
  simp

theorem not_reducible_succ (n : ℕ) :
    NotReducible (regimeUpto (n + 1)) (regimeUpto n)
      (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) := by
  rintro ⟨f, hf⟩
  let d : Fin (n + 2) := ⟨n + 1, Nat.lt_succ_self (n + 1)⟩
  have had : (regimeUpto (n + 1)).Adequate d (phaseSingleton (n + 1)) := adequateWitness_succ n
  have hf1 := hf (phaseSingleton (n + 1)) (witness_mem_tail n) d had
  have hfe := (regimeUpto_adequate_iff (f d) _).1 hf1
  simp only [phaseSingleton_output] at hfe
  replace hfe := (Set.singleton_eq_singleton_iff).mp hfe
  exact Nat.lt_irrefl (f d).val (Nat.lt_of_lt_of_eq (f d).prop hfe)

theorem paradigmShift_succ (n : ℕ) :
    ParadigmShift (regimeUpto n) (regimeUpto (n + 1))
      ((List.range (n + 1)).map phaseSingleton) (phaseSingleton (n + 1)) where
  conservative := conservativeOver_castSucc n
  prior_inadequate := not_explains_regime_singleton_succ
  later_adequate := later_explains_witness n
  not_reducible_back := not_reducible_succ n

/-- Canonical tower on `ℕ`. -/
def canonicalTower : PhaseRegimeTower ℕ where
  phase := phaseSingleton
  regime := regimeUpto

theorem canonicalTower_paradigmSteps : canonicalTower.paradigmShiftSteps := by
  intro n
  simpa [PhaseRegimeTower.paradigmShiftSteps, canonicalTower] using paradigmShift_succ n

theorem canonicalTower_generated : canonicalTower.generatedThroughout natCounter := by
  intro n
  simpa [canonicalTower] using natCounter_generated n

end SignatureTower

end Models

end NoveltyTheory
