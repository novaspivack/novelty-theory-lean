import Mathlib.Data.Set.Basic

/-!
# Sentence syntax (`SPEC_013_ES1`)

Inductive **`Sentence X`**: phase output-set membership, trace facts, bounded **history** finite
conjunctions, embedded Model C atoms, connectives, and (classical-fragment) negation.

See also **`SentenceSyntax.lean`** as the roadmap-named entry point (re-imports this file).
-/

namespace NoveltyTheory

namespace Core

universe u

inductive Sentence (X : Type u) : Type u
  | phaseMem : Set X → X → Sentence X
  | traceEq : ℕ → X → Sentence X
  /-- Finite conjunction of trace equalities `(clock, value)` (empty list = `True`). -/
  | histSeq : List (ℕ × X) → Sentence X
  | geOutput : ℕ → Sentence X
  | and : Sentence X → Sentence X → Sentence X
  | or : Sentence X → Sentence X → Sentence X
  | not : Sentence X → Sentence X

end Core

end NoveltyTheory
