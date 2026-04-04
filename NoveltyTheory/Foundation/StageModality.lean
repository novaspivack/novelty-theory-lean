import NoveltyTheory.Core.Sentence
import NoveltyTheory.Foundation.UpwardNecessity
import NoveltyTheory.Models.SentenceProvability

/-!
# Stage modality scaffolding (`SPEC_040_MD1`)

**Frame.** Discrete successor on **`ℕ`**: “necessarily true at **`m`**” means **`ProvesAt (m + 1)`** on
`Sentence ℕ` (notationally **`StageNecessary`**).

**Axiom policy.** None—this file is definitions plus lemmas recovered from existing strict gaps.

**Crown link.** **`SPEC_037_CR1`** already established **`geOutput`** ascent; here the same fact reads as
**`StageNecessary n (Sentence.geOutput n)`** without quantifying over alternative explanatory worlds.
-/

namespace NoveltyTheory

namespace Foundation

namespace StageModality

open NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability NoveltyTheory.Foundation.UpwardNecessity

def StageNecessary (m : ℕ) (φ : Sentence ℕ) : Prop :=
  ProvesAt (m + 1) φ

theorem stageNecessary_eq (m : ℕ) (φ : Sentence ℕ) : StageNecessary m φ ↔ ProvesAt (m + 1) φ :=
  Iff.rfl

theorem stageNecessary_geOutput (n : ℕ) : StageNecessary n (Sentence.geOutput n) :=
  (upward_necessity_geOutput n).1

end StageModality

end Foundation

end NoveltyTheory
