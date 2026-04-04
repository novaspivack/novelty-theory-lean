import Mathlib.Data.Set.Basic

/-!
# Sentence syntax (`SPEC_013_ES1`)

Inductive **`Sentence X`** for phase-output-set membership, trace equalities, embedded `geOutput`
atoms (`SPEC_015_ES3`), and compositional connectives.

Phase membership is carried as **`Set X`** (the situated outputs) to stay universe-correct with
**`Phase.outputSet`** projections in models.
-/

namespace NoveltyTheory

namespace Core

universe u

inductive Sentence (X : Type u) : Type u
  | phaseMem : Set X → X → Sentence X
  | traceEq : ℕ → X → Sentence X
  | geOutput : ℕ → Sentence X
  | and : Sentence X → Sentence X → Sentence X
  | or : Sentence X → Sentence X → Sentence X

end Core

end NoveltyTheory
