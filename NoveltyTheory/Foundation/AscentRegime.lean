import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower

/-!
# Ascent regimes (`SPEC_036_AR1`)

**`ProvesInRegime m`** names the proof-theoretic stratum at Model **C** depth **`m`**: it **is**
`ProvesAt m` on `Sentence ℕ`. This is the formal \(R_m\) used in crown packaging—no duplicate rule
system.
-/

namespace NoveltyTheory

namespace Foundation

namespace AscentRegime

open NoveltyTheory.Core NoveltyTheory.Models.SentenceProvability NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Foundation.ProvabilityFacts

def ProvesInRegime (m : ℕ) (φ : Sentence ℕ) : Prop := ProvesAt m φ

@[simp] theorem provesInRegime_iff {m : ℕ} {φ : Sentence ℕ} :
    ProvesInRegime m φ ↔ ProvesAt m φ :=
  Iff.rfl

theorem provesInRegime_mono {m n : ℕ} (hmn : m ≤ n) {φ : Sentence ℕ}
    (h : ProvesInRegime m φ) : ProvesInRegime n φ := by
  simpa [ProvesInRegime] using proves_mono_sentence hmn (by simpa [ProvesInRegime] using h)

theorem provesInRegime_sound {m : ℕ} {φ : Sentence ℕ} (h : ProvesInRegime m φ) :
    HoldsAt natCounter φ := by
  simpa [ProvesInRegime] using proves_sentence_sound (by simpa [ProvesInRegime] using h)

end AscentRegime

export AscentRegime (ProvesInRegime provesInRegime_iff provesInRegime_mono provesInRegime_sound)

end Foundation

end NoveltyTheory
