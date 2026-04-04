import NoveltyTheory.Core.Sentence
import NoveltyTheory.Models.SentenceProvability

/-!
# Modal / temporal scaffolding on **`ProvesAt`** (`SPEC_050_GC3`).

Discrete **`ℕ`** stages: **next** is **`ProvesAt (m+1)`**, **bounded future** stacks finitely many
successor stages, **past segment** is a finite listing constraint (retro-linked).
-/

namespace NoveltyTheory

namespace Core

namespace ModalTemporalSyntax

open NoveltyTheory.Models.SentenceProvability

/-- **□\_\{succ m\} φ**: one-step **_necessity_** — derivable at **`m + 1`**. -/
def StageNext (m : ℕ) (φ : Sentence ℕ) : Prop :=
  ProvesAt (Nat.succ m) φ

/-- **□\_\{[m,m+k)\} φ**: **`k`** many successive stages all derive **`φ`**. -/
def BoundedFutureNecessary (m k : ℕ) (φ : Sentence ℕ) : Prop :=
  ∀ j : ℕ, j < k → ProvesAt (m + Nat.succ j) φ

/-- Finite **`histSeq`** hypothesis on listed times (retro layer hook). -/
def PastSegmentListed (l : List (ℕ × ℕ)) : Prop :=
  l ≠ [] ∧ ∀ p ∈ l, p.1 = p.2

end ModalTemporalSyntax

end Core

end NoveltyTheory
