import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.GenerativeSystem

/-!
# Phases and invariants (`SPEC_007_PIN`)

A **phase** bundles distinguished outputs and invariant typing; realizability keeps
invariants tied to subsets of those outputs.
-/

namespace NoveltyTheory

namespace Core

universe u

structure Phase (X : Type u) where
  /-- Outputs situated in this phase. -/
  outputSet : Set X
  /-- Certificates for structural invariants attributed to this phase. -/
  Invariants : Type u
  /-- Subsets of outputs realizing each invariant certificate. -/
  realizes : Invariants → Set X
  realizes_subset : ∀ i, realizes i ⊆ outputSet

namespace Phase

variable {S X : Type u}

/-- Every output of the phase appears on the generator trace (`GeneratedBy` in `SPEC_007_PIN`). -/
def generatedBy (G : GenerativeSystem S X) (P : Phase X) : Prop :=
  P.outputSet ⊆ G.reachSet

/-- Finite history of phases (prefix of a tower). -/
abbrev History (X : Type u) := List (Phase X)

end Phase

end Core

end NoveltyTheory
