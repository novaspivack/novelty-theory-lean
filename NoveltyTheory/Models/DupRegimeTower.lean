import Mathlib.Data.Fintype.Card
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.List.Range
import Mathlib.Logic.Equiv.Basic
import NoveltyTheory.Core.ParadigmShift
import NoveltyTheory.Core.Tower
import NoveltyTheory.Models.BoundedRegimeDiagonal
import NoveltyTheory.Models.ReducerDiagonal
import NoveltyTheory.Models.SignatureTower

/-!
# Nontrivial bounded regime family (`SPEC_012_MDL` off-axis Model B)

Descriptors carry an extra `Bool` tag that must be **`true`** for adequacy. The family still obeys
**`RegimeFamilySingletonWithin`**, inherits the same diagonal and **infinite** paradigm shifts, yet
is **not** pointwise **`regimeUpto`** (so **`EnumAgreesUpto`** fails).
-/

namespace NoveltyTheory

namespace Models

namespace DupRegimeTower

open Core SignatureTower BoundedRegimeDiagonal ReducerDiagonal

/-- Same tagging geometry as `regimeUpto n`, but descriptions live in `Fin (n + 1) × Bool`. -/
def dupRegime (n : ℕ) : ExplanatoryRegime ℕ where
  Desc := Fin (n + 1) × Bool
  Adequate := fun p P => p.2 = true ∧ P.outputSet = ({p.1.val} : Set ℕ)

theorem dupRegime_ne_regimeUpto (n : ℕ) : dupRegime n ≠ regimeUpto n := by
  intro he
  have hD :
      (dupRegime n).Desc = (regimeUpto n).Desc :=
    congrArg ExplanatoryRegime.Desc he
  dsimp [dupRegime, regimeUpto] at hD
  have hcard := Fintype.card_congr (Equiv.cast hD.symm)
  simp [Fintype.card_prod, Fintype.card_fin, Fintype.card_bool] at hcard
  omega

theorem not_enum_agrees_dup : ¬ EnumAgreesUpto dupRegime := by
  intro h
  exact dupRegime_ne_regimeUpto 0 (h 0)

theorem dup_singletonWithin (n : ℕ) : AdequateSingletonWithin (dupRegime n) n := by
  rintro ⟨df, db⟩ P ⟨hb, hset⟩
  subst hb
  exact ⟨df.val, hset, Nat.le_of_lt_succ df.prop⟩

theorem dup_regime_family_singletonWithin : RegimeFamilySingletonWithin dupRegime :=
  dup_singletonWithin

theorem not_explains_dup_singleton_succ (n : ℕ) :
    ¬ (dupRegime n).explains (phaseSingleton (n + 1)) := by
  rintro ⟨dp, hadeq⟩
  rcases dp with ⟨d, b⟩
  rcases hadeq with ⟨hb, hset⟩
  rw [phaseSingleton_output] at hset
  rw [Set.singleton_eq_singleton_iff] at hset
  have hval : d.val = n + 1 := hset.symm
  have hle : d.val ≤ n := Nat.le_of_lt_succ d.prop
  rw [hval] at hle
  exact Nat.not_succ_le_self n hle

/-- Embed earlier duplicate descriptors into the next tier (ignore the junk `false` branch). -/
def dupEmbed (n : ℕ) : (dupRegime n).Desc → (dupRegime (n + 1)).Desc :=
  fun p => (Fin.castSucc p.1, p.2)

theorem dup_conservative (n : ℕ) :
    ConservativeExtension (dupRegime n) (dupRegime (n + 1))
      ((List.range (n + 1)).map phaseSingleton) (dupEmbed n) := by
  intro P hP d hd
  rcases List.mem_map.1 hP with ⟨m, hm, rfl⟩
  rw [List.mem_range] at hm
  rcases d with ⟨df, db⟩
  rcases hd with ⟨hb, hset⟩
  subst hb
  rw [phaseSingleton_output] at hset
  rw [Set.singleton_eq_singleton_iff] at hset
  subst hset
  refine And.intro rfl ?_
  simp [dupEmbed, phaseSingleton_output, Fin.val_castSucc]

theorem dup_adequate_witness (n : ℕ) :
    (dupRegime (n + 1)).Adequate (⟨⟨n + 1, Nat.lt_succ_self (n + 1)⟩, true⟩) (phaseSingleton (n + 1)) :=
  And.intro rfl (by simp [phaseSingleton_output])

theorem dup_later_explains (n : ℕ) : (dupRegime (n + 1)).explains (phaseSingleton (n + 1)) :=
  ⟨_, dup_adequate_witness n⟩

theorem not_reducible_dup_succ (n : ℕ) :
    NotReducible (dupRegime (n + 1)) (dupRegime n)
      (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) := by
  rintro ⟨f, hf⟩
  let d : (dupRegime (n + 1)).Desc := ⟨⟨n + 1, Nat.lt_succ_self (n + 1)⟩, true⟩
  have had : (dupRegime (n + 1)).Adequate d (phaseSingleton (n + 1)) := dup_adequate_witness n
  have hf1 := hf (phaseSingleton (n + 1)) (witness_mem_tail n) d had
  rcases ff : f d with ⟨fd, fb⟩
  rw [ff] at hf1
  rcases hf1 with ⟨hb', hset'⟩
  cases fb <;> try (simp_all)
  rw [phaseSingleton_output] at hset'
  rw [Set.singleton_eq_singleton_iff] at hset'
  have hval : fd.val = n + 1 := hset'.symm
  exact Nat.lt_irrefl _ (hval ▸ fd.prop)

theorem paradigmShift_dup_succ (n : ℕ) :
    ParadigmShift (dupRegime n) (dupRegime (n + 1))
      ((List.range (n + 1)).map phaseSingleton) (phaseSingleton (n + 1)) where
  conservative := ⟨_, dup_conservative n⟩
  prior_inadequate := not_explains_dup_singleton_succ n
  later_adequate := dup_later_explains n
  not_reducible_back := not_reducible_dup_succ n

def dupDiagonalTower : PhaseRegimeTower ℕ where
  phase := phaseSingleton
  regime := dupRegime

theorem dupDiagonalTower_paradigmSteps : dupDiagonalTower.paradigmShiftSteps := by
  intro n
  simpa [dupDiagonalTower, PhaseRegimeTower.paradigmShiftSteps] using paradigmShift_dup_succ n

theorem dupDiagonalTower_generated : dupDiagonalTower.generatedThroughout natCounter := by
  intro n
  simpa [dupDiagonalTower] using natCounter_generated n

theorem dup_diagonalTower_eq : diagonalTower dupRegime = dupDiagonalTower :=
  rfl

/-- Off-axis Model B: same quantitative singleton bound, same shifts and diagonal, not `regimeUpto`. -/
theorem modelB_dup_singleton_bound_package :
    (diagonalTower dupRegime).generatedThroughout natCounter ∧
      (diagonalTower dupRegime).paradigmShiftSteps ∧
        (∀ n, ¬ (dupRegime n).explains (phaseSingleton (n + 1))) ∧
          RegimeFamilySingletonWithin dupRegime ∧ ¬ EnumAgreesUpto dupRegime :=
  And.intro dupDiagonalTower_generated
    (And.intro dupDiagonalTower_paradigmSteps
      (And.intro (fun n => not_explains_dup_singleton_succ n)
        (And.intro dup_regime_family_singletonWithin not_enum_agrees_dup)))

end DupRegimeTower

end Models

end NoveltyTheory
