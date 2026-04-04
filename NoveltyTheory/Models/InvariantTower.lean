import Mathlib.Data.Nat.Basic
import NoveltyTheory.Models.SignatureTower

/-!
# Model C — invariant / proof-theoretic tower (`SPEC_012_MDL`, `SPEC_010_UEN`)

Depth-`n` **proof objects** are encodings `k` with `k < n`; each maps to the sentence `geOutput k`.
Separation theorems are **inversion on the bound** `k < n`, not a custom `Provable` predicate that
mentions the summit conclusion.

**Semantic reading:** `geOutput k` means the ticker eventually observes a value strictly above `k`.
For `natCounter`, tick `k + 1` suffices; **soundness** maps each legal proof fringe to a realizing tick.

Link to regimes (informative only): `regimeUpto n` in Model A plays the role of “depth-`n`” vocabulary;
`provesAtDepth n` below is the formal **derivability** hook for **`SPEC_010_UEN`**.
-/

namespace NoveltyTheory

namespace Models

namespace InvariantTower

open SignatureTower

/-- Sentences for the counterfact calculus (`SPEC_010_UEN` — structural truth carrier). -/
inductive CounterFact : Type
  | geOutput : ℕ → CounterFact

theorem CounterFact.geOutput_inj {a b : ℕ} (h : CounterFact.geOutput a = CounterFact.geOutput b) : a = b := by
  simpa using congrArg (fun c => match c with | .geOutput x => x) h

/--
Depth-`n` proofs are witnesses `k < n`; `Pf.fact` maps each fringe witness to the sentence it types.
-/
def Pf (n : ℕ) :=
  { k // k < n }

namespace Pf

variable {n : ℕ}

/-- Sentence proved by fringe element `p`. -/
def fact (p : Pf n) : CounterFact :=
  CounterFact.geOutput p.val

end Pf

/-- Regime-depth derivability: **Model C** instantiates `R ⊢ Φ` for the signature ladder (`SPEC_010_UEN`). -/
def provesAtDepth (n : ℕ) (f : CounterFact) : Prop :=
  ∃ p : Pf n, Pf.fact p = f

theorem proves_succ_ge (n : ℕ) : provesAtDepth (n + 1) (CounterFact.geOutput n) :=
  ⟨⟨n, Nat.lt_succ_self n⟩, rfl⟩

theorem not_proves_self (n : ℕ) : ¬ provesAtDepth n (CounterFact.geOutput n) := by
  rintro ⟨⟨k, hk⟩, hp⟩
  rw [Pf.fact] at hp
  have hn : k = n := CounterFact.geOutput_inj hp
  rw [hn] at hk
  exact Nat.lt_irrefl n hk

theorem upward_derivability_gap (n : ℕ) :
    provesAtDepth (n + 1) (CounterFact.geOutput n) ∧
      ¬ provesAtDepth n (CounterFact.geOutput n) :=
  ⟨proves_succ_ge n, not_proves_self n⟩

/--
**Retroactive / cross-depth gap (`SPEC_003_NXT` S7 template):** at lower depth `k` one cannot prove
`geOutput k`, yet at any strictly greater depth `n` one can. The sentence is *about* the fixed
index `k`; only the proof budget (`n`) changes.
-/
theorem retro_derivability {k n : ℕ} (hk : k < n) :
    provesAtDepth n (CounterFact.geOutput k) ∧ ¬ provesAtDepth k (CounterFact.geOutput k) :=
  ⟨⟨⟨k, hk⟩, rfl⟩, not_proves_self k⟩

/-- Monotonicity in depth: larger `n` weakens the guard `k < n`, so every shallow proof lifts (`SPEC_010_UEN`). -/
theorem proves_mono {m n : ℕ} (hmn : m ≤ n) {f : CounterFact} (h : provesAtDepth m f) :
    provesAtDepth n f := by
  rcases h with ⟨p, hp⟩
  exact ⟨⟨p.val, Nat.lt_of_lt_of_le p.prop hmn⟩, hp⟩

/-- Semantic content: some tick observes a value strictly above `k`. -/
def factHolds (f : CounterFact) : Prop :=
  match f with
  | CounterFact.geOutput k => ∃ t : ℕ, k < natCounter.trace t

theorem factHolds_geOutput (k : ℕ) : factHolds (CounterFact.geOutput k) :=
  ⟨k + 1, by rw [natCounter_trace]; exact Nat.lt_succ_self k⟩

theorem proves_sound {n : ℕ} {f : CounterFact} (h : provesAtDepth n f) : factHolds f := by
  rcases h with ⟨p, hp⟩
  cases f with
  | geOutput k =>
    rw [Pf.fact] at hp
    have hk : p.val = k := CounterFact.geOutput_inj hp
    subst hk
    exact ⟨n, by rw [natCounter_trace]; exact p.prop⟩

/-- No single finite depth proves every sentence `geOutput m` (already at `m` equal to the depth). -/
theorem no_finite_depth_proves_all (n : ℕ) : ∃ f : CounterFact, ¬ provesAtDepth n f :=
  ⟨_, not_proves_self n⟩

end InvariantTower

end Models

end NoveltyTheory
