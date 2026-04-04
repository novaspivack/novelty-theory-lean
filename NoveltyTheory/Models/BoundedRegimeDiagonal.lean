import NoveltyTheory.Models.SignatureTower

/-!
# Bounded singleton regimes — abstract diagonal (`SPEC_009_DST`, `SPEC_012_MDL`)

If every **adequate** description at regime `c n` forces the certified phase output to be a
singleton whose value is **`≤ n`**, then `c n` cannot explain `phaseSingleton (n + 1)`—with **no**
assumption that `c n` equals `regimeUpto n`.

`regimeUpto` satisfies this hypothesis (**`regimeUpto_adequate_singletonWithin`**), so Model A is a
instance. Model B’s **`EnumAgreesUpto`** route is the specialization where equalities discharge the
bound uniformly.
-/

namespace NoveltyTheory

namespace Models

namespace BoundedRegimeDiagonal

open Core SignatureTower

/-- Adequacy only certifies **singleton** phases whose distinguished output is at most `bound`. -/
def AdequateSingletonWithin (R : ExplanatoryRegime ℕ) (bound : ℕ) : Prop :=
  ∀ (d : R.Desc) (P : Phase ℕ),
    R.Adequate d P → ∃ (k : ℕ), P.outputSet = ({k} : Set ℕ) ∧ k ≤ bound

theorem not_explains_singleton_succ_of_within (R : ExplanatoryRegime ℕ) (bound : ℕ)
    (h : AdequateSingletonWithin R bound) :
    ¬ R.explains (phaseSingleton (bound + 1)) := by
  rintro ⟨d, hd⟩
  rcases h d (phaseSingleton (bound + 1)) hd with ⟨k, hkset, hk⟩
  rw [phaseSingleton_output] at hkset
  rw [Set.singleton_eq_singleton_iff] at hkset
  subst hkset
  exact Nat.not_succ_le_self bound hk

/-- Stage-`n` regimes in the family each obey the **`≤ n`** singleton bound. -/
def RegimeFamilySingletonWithin (c : ℕ → ExplanatoryRegime ℕ) : Prop :=
  ∀ n, AdequateSingletonWithin (c n) n

theorem family_diagonal_of_singletonWithin (c : ℕ → ExplanatoryRegime ℕ)
    (h : RegimeFamilySingletonWithin c) (n : ℕ) :
    ¬ (c n).explains (phaseSingleton (n + 1)) :=
  not_explains_singleton_succ_of_within (c n) n (h n)

theorem regimeUpto_adequate_singletonWithin (n : ℕ) :
    AdequateSingletonWithin (regimeUpto n) n := by
  intro d P hd
  refine ⟨d.val, (regimeUpto_adequate_iff d P).1 hd, Nat.le_of_lt_succ d.prop⟩

theorem regimeFamily_singletonWithin_upto : RegimeFamilySingletonWithin regimeUpto :=
  regimeUpto_adequate_singletonWithin

end BoundedRegimeDiagonal

end Models

end NoveltyTheory
