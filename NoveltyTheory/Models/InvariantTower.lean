import Mathlib.Data.Nat.Basic
import Mathlib.Data.Set.Basic
import NoveltyTheory.Models.SignatureTower

/-!
# Model C — invariant / proof-theoretic tower (`SPEC_012_MDL`, `SPEC_010_UEN`)

Depth-`n` **proof objects** are a small inductive fringe; each maps to a **`CounterFact`**.
The v1 calculus included only **`geOutput`**. The richer fragment keeps the same **inversion on
depth** for **`geOutput`**, and adds **diagonal trace equalities** (**`traceEq i i`**) and **singleton
phase membership atoms** (**`phaseSingletonMem i`**) — the only **trace** / **phase** sentences
derivable at depth `n` are those with **main index `< n`**.

**Semantic reading:** facts embed into **`HoldsAt natCounter`** on the standard counter; **soundness**
is by case on the fringe.
-/

namespace NoveltyTheory

namespace Models

namespace InvariantTower

open Set SignatureTower

/-- Counterfactual / generator-atomic sentences in the proof-theoretic tower. -/
inductive CounterFact : Type
  | geOutput : ℕ → CounterFact
  | traceEq : ℕ → ℕ → CounterFact
  /-- Phase membership atom for the singleton phase at tag `k`: same as `phaseMem (singleton k) k`. -/
  | phaseSingletonMem : ℕ → CounterFact

theorem CounterFact.geOutput_inj {a b : ℕ} (h : CounterFact.geOutput a = CounterFact.geOutput b) : a = b := by
  cases h; rfl

theorem CounterFact.traceEq_inj {a b c d : ℕ} (h : CounterFact.traceEq a b = CounterFact.traceEq c d) :
    a = c ∧ b = d := by
  cases h; exact And.intro rfl rfl

theorem CounterFact.phaseSingletonMem_inj {a b : ℕ}
    (h : CounterFact.phaseSingletonMem a = CounterFact.phaseSingletonMem b) : a = b := by
  cases h; rfl

/--
Depth-`n` fringe: a **`geOutput`** witness, a **diagonal trace** witness, or a **singleton-phase**
witness — each with **main index `< n**.
-/
inductive Pf (n : ℕ) : Type
  | ge : (k : ℕ) → k < n → Pf n
  | trace : (i : ℕ) → i < n → Pf n
  | phase : (k : ℕ) → k < n → Pf n

namespace Pf

variable {n : ℕ}

/-- Sentence proved by fringe element `p`. -/
def fact (p : Pf n) : CounterFact :=
  match p with
  | ge k _ => CounterFact.geOutput k
  | trace i _ => CounterFact.traceEq i i
  | phase k _ => CounterFact.phaseSingletonMem k

end Pf

/-- Regime-depth derivability (`SPEC_010_UEN`). -/
def provesAtDepth (n : ℕ) (f : CounterFact) : Prop :=
  ∃ p : Pf n, Pf.fact p = f

theorem proves_succ_ge (n : ℕ) : provesAtDepth (n + 1) (CounterFact.geOutput n) :=
  ⟨Pf.ge n (Nat.lt_succ_self n), rfl⟩

theorem proves_succ_trace (n : ℕ) : provesAtDepth (n + 1) (CounterFact.traceEq n n) :=
  ⟨Pf.trace n (Nat.lt_succ_self n), rfl⟩

theorem proves_succ_phase (n : ℕ) : provesAtDepth (n + 1) (CounterFact.phaseSingletonMem n) :=
  ⟨Pf.phase n (Nat.lt_succ_self n), rfl⟩

theorem not_proves_self (n : ℕ) : ¬ provesAtDepth n (CounterFact.geOutput n) := by
  rintro ⟨p, hp⟩
  match p with
  | Pf.ge k hk =>
      have hn : k = n := CounterFact.geOutput_inj hp
      rw [hn] at hk
      exact Nat.lt_irrefl n hk
  | Pf.trace _ _ =>
      nomatch hp
  | Pf.phase _ _ =>
      nomatch hp

theorem not_proves_trace_diag (n : ℕ) : ¬ provesAtDepth n (CounterFact.traceEq n n) := by
  rintro ⟨p, hp⟩
  match p with
  | Pf.ge _ _ =>
      nomatch hp
  | Pf.trace i hi =>
      have hiN : i = n := (CounterFact.traceEq_inj hp).1
      rw [hiN] at hi
      exact Nat.lt_irrefl n hi
  | Pf.phase _ _ =>
      nomatch hp

theorem not_proves_phase (n : ℕ) : ¬ provesAtDepth n (CounterFact.phaseSingletonMem n) := by
  rintro ⟨p, hp⟩
  match p with
  | Pf.ge _ _ =>
      nomatch hp
  | Pf.trace _ _ =>
      nomatch hp
  | Pf.phase k hk =>
      have hn : k = n := CounterFact.phaseSingletonMem_inj hp
      rw [hn] at hk
      exact Nat.lt_irrefl n hk

theorem upward_derivability_gap (n : ℕ) :
    provesAtDepth (n + 1) (CounterFact.geOutput n) ∧ ¬ provesAtDepth n (CounterFact.geOutput n) :=
  ⟨proves_succ_ge n, not_proves_self n⟩

theorem upward_trace_derivability_gap (n : ℕ) :
    provesAtDepth (n + 1) (CounterFact.traceEq n n) ∧ ¬ provesAtDepth n (CounterFact.traceEq n n) :=
  ⟨proves_succ_trace n, not_proves_trace_diag n⟩

theorem upward_phase_derivability_gap (n : ℕ) :
    provesAtDepth (n + 1) (CounterFact.phaseSingletonMem n) ∧
      ¬ provesAtDepth n (CounterFact.phaseSingletonMem n) :=
  ⟨proves_succ_phase n, not_proves_phase n⟩

theorem retro_derivability {k n : ℕ} (hk : k < n) :
    provesAtDepth n (CounterFact.geOutput k) ∧ ¬ provesAtDepth k (CounterFact.geOutput k) :=
  ⟨⟨Pf.ge k hk, rfl⟩, not_proves_self k⟩

theorem retro_derivability_trace {k n : ℕ} (hk : k < n) :
    provesAtDepth n (CounterFact.traceEq k k) ∧ ¬ provesAtDepth k (CounterFact.traceEq k k) :=
  ⟨⟨Pf.trace k hk, rfl⟩, not_proves_trace_diag k⟩

theorem retro_derivability_phase {k n : ℕ} (hk : k < n) :
    provesAtDepth n (CounterFact.phaseSingletonMem k) ∧ ¬ provesAtDepth k (CounterFact.phaseSingletonMem k) :=
  ⟨⟨Pf.phase k hk, rfl⟩, not_proves_phase k⟩

theorem proves_mono {m n : ℕ} (hmn : m ≤ n) {f : CounterFact} (h : provesAtDepth m f) :
    provesAtDepth n f := by
  rcases h with ⟨p, hp⟩
  match p with
  | Pf.ge k hk =>
      exact ⟨Pf.ge k (Nat.lt_of_lt_of_le hk hmn), hp⟩
  | Pf.trace i hi =>
      exact ⟨Pf.trace i (Nat.lt_of_lt_of_le hi hmn), hp⟩
  | Pf.phase k hk =>
      exact ⟨Pf.phase k (Nat.lt_of_lt_of_le hk hmn), hp⟩

/-- Indices mentioned in a counterfact, for inversion lemmas. -/
def factIndexBound (f : CounterFact) : ℕ :=
  match f with
  | CounterFact.geOutput k => k
  | CounterFact.traceEq i v => max i v
  | CounterFact.phaseSingletonMem k => k

theorem provesAtDepth_le_factIndexBound {m : ℕ} {f : CounterFact} (h : provesAtDepth m f) :
    factIndexBound f < m := by
  rcases h with ⟨p, hp⟩
  match p with
  | Pf.ge k hk =>
      cases f with
      | geOutput j =>
          have hj : k = j := CounterFact.geOutput_inj hp
          subst hj
          simpa [factIndexBound] using hk
      | traceEq _ _ =>
          nomatch hp
      | phaseSingletonMem _ =>
          nomatch hp
  | Pf.trace i hi =>
      cases f with
      | geOutput _ =>
          nomatch hp
      | traceEq j v =>
          rcases CounterFact.traceEq_inj hp with ⟨rfl, rfl⟩
          simpa [factIndexBound] using hi
      | phaseSingletonMem _ =>
          nomatch hp
  | Pf.phase k hk =>
      cases f with
      | geOutput _ =>
          nomatch hp
      | traceEq _ _ =>
          nomatch hp
      | phaseSingletonMem j =>
          have hj : k = j := CounterFact.phaseSingletonMem_inj hp
          subst hj
          simpa [factIndexBound] using hk

theorem provesAtDepth_maxIndex_le (m i v : ℕ) (h : provesAtDepth m (CounterFact.traceEq i v)) :
    max i v < m := by
  simpa [factIndexBound] using provesAtDepth_le_factIndexBound h

/-- Semantic content on **`natCounter`**. -/
def factHolds (f : CounterFact) : Prop :=
  match f with
  | CounterFact.geOutput k => ∃ t : ℕ, k < natCounter.trace t
  | CounterFact.traceEq i v => natCounter.trace i = v
  | CounterFact.phaseSingletonMem k => k ∈ (singleton k : Set ℕ)

theorem factHolds_geOutput (k : ℕ) : factHolds (CounterFact.geOutput k) :=
  ⟨k + 1, by rw [natCounter_trace]; exact Nat.lt_succ_self k⟩

theorem factHolds_diag_trace (i : ℕ) : factHolds (CounterFact.traceEq i i) := by
  simp [factHolds, natCounter_trace]

theorem factHolds_phaseSingletonMem (k : ℕ) : factHolds (CounterFact.phaseSingletonMem k) := by
  simp [factHolds, mem_singleton_iff]

theorem proves_sound {n : ℕ} {f : CounterFact} (h : provesAtDepth n f) : factHolds f := by
  rcases h with ⟨p, hp⟩
  match f with
  | CounterFact.geOutput k =>
      match p with
      | Pf.ge k' hk =>
          have hkK : k' = k := CounterFact.geOutput_inj hp
          subst hkK
          exact ⟨n, by rw [natCounter_trace]; exact hk⟩
      | Pf.trace _ _ =>
          nomatch hp
      | Pf.phase _ _ =>
          nomatch hp
  | CounterFact.traceEq i v =>
      match p with
      | Pf.ge _ _ =>
          nomatch hp
      | Pf.trace _ _hj =>
          rcases CounterFact.traceEq_inj hp with ⟨rfl, rfl⟩
          simp [factHolds, natCounter_trace]
      | Pf.phase _ _ =>
          nomatch hp
  | CounterFact.phaseSingletonMem k =>
      match p with
      | Pf.ge _ _ =>
          nomatch hp
      | Pf.trace _ _ =>
          nomatch hp
      | Pf.phase k' hk =>
          have hkK : k' = k := CounterFact.phaseSingletonMem_inj hp
          subst hkK
          simp [factHolds, mem_singleton_iff]

theorem retro_revelation_derivability_package {k n : ℕ} (hk : k < n) :
    factHolds (CounterFact.geOutput k) ∧
      provesAtDepth n (CounterFact.geOutput k) ∧
        Not (provesAtDepth k (CounterFact.geOutput k)) :=
  And.intro (factHolds_geOutput k)
    (And.intro (retro_derivability hk).1 (retro_derivability hk).2)

theorem retro_revelation_sound {k n : ℕ} (hk : k < n) : factHolds (CounterFact.geOutput k) :=
  proves_sound (retro_derivability hk).1

theorem no_finite_depth_proves_all (n : ℕ) : ∃ f : CounterFact, ¬ provesAtDepth n f :=
  ⟨_, not_proves_self n⟩

end InvariantTower

end Models

end NoveltyTheory
