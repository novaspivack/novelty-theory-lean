import Mathlib.Data.Set.Basic
import NoveltyTheory.Core.NatPhaseTag

/-!
# Sentence syntax (`SPEC_013_ES1`)

Inductive **`Sentence X`**: phase output-set membership, trace facts, **tagged** nat phases, **finite
conjunctions** (bounded “∀” over explicitly listed subformulas), embedded Model C atoms on `ℕ`, and
connectives including negation.

Link **`Phase X`** certificates via **`phaseMem P.outputSet x`** (no extra constructor—stays within
the same universe as **`Sentence X`**).

See also **`SentenceSyntax.lean`** as the roadmap-named entry point (re-imports this file).
-/

namespace NoveltyTheory

namespace Core

universe u

inductive Sentence (X : Type u) : Type u
  | phaseMem : Set X → X → Sentence X
  | traceEq : ℕ → X → Sentence X
  /-- Finite bundle of trace equalities (empty = `True`). -/
  | histSeq : List (ℕ × X) → Sentence X
  /-- Membership in a **finitely named** subset of `ℕ`, carried at kind `X` for unary reuse. -/
  | natPhaseTagMem : NatPhaseTag → X → Sentence X
  /-- Finite conjunction / explicit bounded “∀” over a list of subformulas. -/
  | finConj : List (Sentence X) → Sentence X
  | geOutput : ℕ → Sentence X
  | and : Sentence X → Sentence X → Sentence X
  | or : Sentence X → Sentence X → Sentence X
  | not : Sentence X → Sentence X

end Core

end NoveltyTheory
