import NoveltyTheory.Core.SentenceHierarchyV2

/-!
# Weak naturality principles for structural sentences (`SPEC_055_NS2`)

Predicates extending **both** the generator-structural fragment and the retro-v2 fragment are recorded
as a reusable hypothesis shape; `IsStructuralSentenceV2` is the canonical witness.
-/

namespace NoveltyTheory

namespace Core

namespace StructuralSentenceNaturality

open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open SentenceHierarchyV2

/--
A predicate on sentences satisfies the **weak structural** naturality principles if it accepts every
generator-structural **and** every retro-v2 sentence (`SPEC_055_NS2`).
-/
def WeakStructuralSentencePrinciples (P : Sentence ℕ → Prop) : Prop :=
  (∀ {φ}, IsStructuralGeneratorSentence φ → P φ) ∧
    (∀ {φ}, IsRetroStructuralV2 φ → P φ)

theorem isStructuralV2_satisfies_weakPrinciples :
    WeakStructuralSentencePrinciples IsStructuralSentenceV2 :=
  And.intro (fun {_} h => isStructuralGenerator_implies_structuralV2 h)
    (fun {_} h => isRetroStructuralV2_implies_structuralV2 h)

theorem structuralV2_of_weakPrinciples {P : Sentence ℕ → Prop}
    (hP : WeakStructuralSentencePrinciples P) {φ : Sentence ℕ} (h : IsStructuralSentenceV2 φ) :
    P φ := by
  rcases h with (hg | hr)
  · exact hP.1 hg
  · exact hP.2 hr

end StructuralSentenceNaturality

end Core

end NoveltyTheory
