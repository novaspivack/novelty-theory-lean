import Mathlib.Data.Nat.Basic
import NoveltyTheory.Core.GenerativeSystem

/-!
# Closure / collapse vocabulary on numeric traces (`SPEC_062_CMI3`)

`ExistsBoundedNumericTrace` is a concrete **collapse** condition at the level of **observable
numeric outputs**: no unbounded strict rises of `trace t` against constants `B`.
 Ridge modules relate this to `Models.StratifiedFinality.FutureDefeat`.
-/

namespace NoveltyTheory

namespace Core

namespace ClosureDichotomy

variable {S : Type} (G : GenerativeSystem S ℕ)

/-- Uniform bound `B` majorizes every observed numeric output. -/
def BoundedNumericTrace (B : ℕ) : Prop :=
  ∀ t : ℕ, G.trace t ≤ B

/-- Some uniform bound exists (collapse of output dynamical complexity). -/
def ExistsBoundedNumericTrace : Prop :=
  ∃ B : ℕ, BoundedNumericTrace G B

end ClosureDichotomy

end Core

end NoveltyTheory
